{-# LANGUAGE QuasiQuotes, TemplateHaskell, TypeFamilies, OverloadedStrings #-}
{-# LANGUAGE GADTs #-}

import Database.Persist
import Database.Persist.Postgresql
import Database.Persist.TH
import Database.Persist.Base
import Control.Monad.IO.Class (liftIO)

mkPersist sqlSettings [persist|
  Blah sql=blah
    name String 
|]

main :: IO ()
main = withPostgresqlConn "host=127.0.0.1 dbname=test" $ runSqlConn $ do
  _ <- insert $ Blah "blah blah"
  blahs <- selectList [BlahName ==. "blah blah"] []
  blahs1 <- selectList [BlahId <. Key (PersistInt64 3)] []
  liftIO $ print blahs
  liftIO $ print blahs1
  liftIO $ print "done"
  return ()

