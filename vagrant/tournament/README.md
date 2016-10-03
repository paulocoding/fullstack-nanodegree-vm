# Tournament Results

### A database schema to store and a Python module to rank manage a Swiss system tournament.


## Structure
* tournament_test.py - unit tests
* tournament.py - Python module that connects to the database
* tournament.sql - SQL schema for the tournament project.

## Use
* Make sure you have PostgreSQL installed
  * http://postgresguide.com/setup/install.html
* Make sure you have python installed
  * https://www.python.org/downloads/
* Create the tournament database, by executing (on project folder):
```
  $ psql
  $ \i tournament.sql
  $ \q
```
* now you can run the unit tests, by executing:
```
  $ python tournament_test.py
```
