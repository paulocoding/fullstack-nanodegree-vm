-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- 1st create the database, execute this comman
-- CREATE DATABASE tournament;
CREATE TABLE players(name TEXT, id SERIAL PRIMARY KEY);
CREATE TABLE matches(player_a INTEGER REFERENCES players(id),
                     player_b INTEGER REFERENCES players(id),
                     winner INTEGER REFERENCES players(id),
                     id SERIAL PRIMARY KEY
                   );
-- wins view
CREATE VIEW wins as
SELECT players.id as id, name, count(matches.id) as wins
                 FROM players LEFT JOIN matches
                 ON players.id = matches.winner
                 GROUP BY players.id
                 ORDER BY wins DESC;
-- games_count view
CREATE VIEW games_count as
SELECT players.id as id, name, count(matches.id) as games
                FROM players LEFT JOIN matches
                ON players.id = matches.player_a OR
                   players.id = matches.player_b
                GROUP BY players.id;
