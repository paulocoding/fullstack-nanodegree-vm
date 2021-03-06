-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Dropping database if any exists, and creating a new one

DROP DATABASE tournament;
CREATE DATABASE tournament;
\c tournament

-- Creating tables
CREATE TABLE players(name TEXT, id SERIAL PRIMARY KEY);
CREATE TABLE matches(winner INTEGER REFERENCES players(id),
                     loser INTEGER REFERENCES players(id),
                     id SERIAL PRIMARY KEY
                   );

-- wins view
CREATE VIEW wins as
SELECT players.id as id, name, count(matches.id) as wins
                 FROM players LEFT JOIN matches
                 ON players.id = matches.winner
                 GROUP BY players.id
                 ORDER BY wins DESC;

-- matches_count view
CREATE VIEW matches_count as
SELECT players.id as id, name, count(matches.id) as games
                FROM players LEFT JOIN matches
                ON players.id = matches.winner OR
                   players.id = matches.loser
                GROUP BY players.id;
