--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (65, 2018, 'Final', 110, 111, 4, 2);
INSERT INTO public.games VALUES (66, 2018, 'Third Place', 112, 113, 2, 0);
INSERT INTO public.games VALUES (67, 2018, 'Semi-Final', 111, 113, 2, 1);
INSERT INTO public.games VALUES (68, 2018, 'Semi-Final', 110, 112, 1, 0);
INSERT INTO public.games VALUES (69, 2018, 'Quarter-Final', 111, 114, 3, 2);
INSERT INTO public.games VALUES (70, 2018, 'Quarter-Final', 113, 115, 2, 0);
INSERT INTO public.games VALUES (71, 2018, 'Quarter-Final', 112, 116, 2, 1);
INSERT INTO public.games VALUES (72, 2018, 'Quarter-Final', 110, 117, 2, 0);
INSERT INTO public.games VALUES (73, 2018, 'Eighth-Final', 113, 118, 2, 1);
INSERT INTO public.games VALUES (74, 2018, 'Eighth-Final', 115, 119, 1, 0);
INSERT INTO public.games VALUES (75, 2018, 'Eighth-Final', 112, 120, 3, 2);
INSERT INTO public.games VALUES (76, 2018, 'Eighth-Final', 116, 121, 2, 0);
INSERT INTO public.games VALUES (77, 2018, 'Eighth-Final', 111, 122, 2, 1);
INSERT INTO public.games VALUES (78, 2018, 'Eighth-Final', 114, 123, 2, 1);
INSERT INTO public.games VALUES (79, 2018, 'Eighth-Final', 117, 124, 2, 1);
INSERT INTO public.games VALUES (80, 2018, 'Eighth-Final', 110, 125, 4, 3);
INSERT INTO public.games VALUES (81, 2014, 'Final', 126, 125, 1, 0);
INSERT INTO public.games VALUES (82, 2014, 'Third Place', 127, 116, 3, 0);
INSERT INTO public.games VALUES (83, 2014, 'Semi-Final', 125, 127, 1, 0);
INSERT INTO public.games VALUES (84, 2014, 'Semi-Final', 126, 116, 7, 1);
INSERT INTO public.games VALUES (85, 2014, 'Quarter-Final', 127, 128, 1, 0);
INSERT INTO public.games VALUES (86, 2014, 'Quarter-Final', 125, 112, 1, 0);
INSERT INTO public.games VALUES (87, 2014, 'Quarter-Final', 116, 118, 2, 1);
INSERT INTO public.games VALUES (88, 2014, 'Quarter-Final', 126, 110, 1, 0);
INSERT INTO public.games VALUES (89, 2014, 'Eighth-Final', 116, 129, 2, 1);
INSERT INTO public.games VALUES (90, 2014, 'Eighth-Final', 118, 117, 2, 0);
INSERT INTO public.games VALUES (91, 2014, 'Eighth-Final', 110, 130, 2, 0);
INSERT INTO public.games VALUES (92, 2014, 'Eighth-Final', 126, 131, 2, 1);
INSERT INTO public.games VALUES (93, 2014, 'Eighth-Final', 127, 121, 2, 1);
INSERT INTO public.games VALUES (94, 2014, 'Eighth-Final', 128, 132, 2, 1);
INSERT INTO public.games VALUES (95, 2014, 'Eighth-Final', 125, 119, 1, 0);
INSERT INTO public.games VALUES (96, 2014, 'Eighth-Final', 112, 133, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (110, 'France');
INSERT INTO public.teams VALUES (111, 'Croatia');
INSERT INTO public.teams VALUES (112, 'Belgium');
INSERT INTO public.teams VALUES (113, 'England');
INSERT INTO public.teams VALUES (114, 'Russia');
INSERT INTO public.teams VALUES (115, 'Sweden');
INSERT INTO public.teams VALUES (116, 'Brazil');
INSERT INTO public.teams VALUES (117, 'Uruguay');
INSERT INTO public.teams VALUES (118, 'Colombia');
INSERT INTO public.teams VALUES (119, 'Switzerland');
INSERT INTO public.teams VALUES (120, 'Japan');
INSERT INTO public.teams VALUES (121, 'Mexico');
INSERT INTO public.teams VALUES (122, 'Denmark');
INSERT INTO public.teams VALUES (123, 'Spain');
INSERT INTO public.teams VALUES (124, 'Portugal');
INSERT INTO public.teams VALUES (125, 'Argentina');
INSERT INTO public.teams VALUES (126, 'Germany');
INSERT INTO public.teams VALUES (127, 'Netherlands');
INSERT INTO public.teams VALUES (128, 'Costa Rica');
INSERT INTO public.teams VALUES (129, 'Chile');
INSERT INTO public.teams VALUES (130, 'Nigeria');
INSERT INTO public.teams VALUES (131, 'Algeria');
INSERT INTO public.teams VALUES (132, 'Greece');
INSERT INTO public.teams VALUES (133, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 96, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 133, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

