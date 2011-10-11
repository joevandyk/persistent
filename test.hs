import Database.HDBC
import Database.HDBC.PostgreSQL
import Database.HaskellDB.HDBC.PostgreSQL

main = do
  let connStr = "host=127.0.0.1 dbname=test"
  conn <- connectPostgreSQL connStr
  begin conn
  run conn "insert into blah (name) values ('new')" []
  result <- quickQuery' conn "select * from blah" []
  print result
  print "done with hdbc"

  --conn1 <- postgresqlConnect [("host", "localhost"), ("dbname", "test")]
  postgresqlConnect [("host", "localhost"), ("dbname", "test")]

  print "done with haskelldb"
