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
    round character varying NOT NULL,
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
    name character varying NOT NULL
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

INSERT INTO public.games VALUES (69, 2018, 'Final', 245, 246, 4, 2);
INSERT INTO public.games VALUES (70, 2018, 'Third Place', 247, 248, 2, 0);
INSERT INTO public.games VALUES (71, 2018, 'Semi-Final', 246, 248, 2, 1);
INSERT INTO public.games VALUES (72, 2018, 'Semi-Final', 245, 247, 1, 0);
INSERT INTO public.games VALUES (73, 2018, 'Quarter-Final', 246, 249, 3, 2);
INSERT INTO public.games VALUES (74, 2018, 'Quarter-Final', 248, 250, 2, 0);
INSERT INTO public.games VALUES (75, 2018, 'Quarter-Final', 247, 251, 2, 1);
INSERT INTO public.games VALUES (76, 2018, 'Quarter-Final', 245, 252, 2, 0);
INSERT INTO public.games VALUES (77, 2018, 'Eighth-Final', 248, 253, 2, 1);
INSERT INTO public.games VALUES (78, 2018, 'Eighth-Final', 250, 254, 1, 0);
INSERT INTO public.games VALUES (79, 2018, 'Eighth-Final', 247, 255, 3, 2);
INSERT INTO public.games VALUES (80, 2018, 'Eighth-Final', 251, 256, 2, 0);
INSERT INTO public.games VALUES (81, 2018, 'Eighth-Final', 246, 257, 2, 1);
INSERT INTO public.games VALUES (82, 2018, 'Eighth-Final', 249, 258, 2, 1);
INSERT INTO public.games VALUES (83, 2018, 'Eighth-Final', 252, 259, 2, 1);
INSERT INTO public.games VALUES (84, 2018, 'Eighth-Final', 245, 260, 4, 3);
INSERT INTO public.games VALUES (85, 2014, 'Final', 261, 260, 1, 0);
INSERT INTO public.games VALUES (86, 2014, 'Third Place', 262, 251, 3, 0);
INSERT INTO public.games VALUES (87, 2014, 'Semi-Final', 260, 262, 1, 0);
INSERT INTO public.games VALUES (88, 2014, 'Semi-Final', 261, 251, 7, 1);
INSERT INTO public.games VALUES (89, 2014, 'Quarter-Final', 262, 263, 1, 0);
INSERT INTO public.games VALUES (90, 2014, 'Quarter-Final', 260, 247, 1, 0);
INSERT INTO public.games VALUES (91, 2014, 'Quarter-Final', 251, 253, 2, 1);
INSERT INTO public.games VALUES (92, 2014, 'Quarter-Final', 261, 245, 1, 0);
INSERT INTO public.games VALUES (93, 2014, 'Eighth-Final', 251, 264, 2, 1);
INSERT INTO public.games VALUES (94, 2014, 'Eighth-Final', 253, 252, 2, 0);
INSERT INTO public.games VALUES (95, 2014, 'Eighth-Final', 245, 265, 2, 0);
INSERT INTO public.games VALUES (96, 2014, 'Eighth-Final', 261, 266, 2, 1);
INSERT INTO public.games VALUES (97, 2014, 'Eighth-Final', 262, 256, 2, 1);
INSERT INTO public.games VALUES (98, 2014, 'Eighth-Final', 263, 267, 2, 1);
INSERT INTO public.games VALUES (99, 2014, 'Eighth-Final', 260, 254, 1, 0);
INSERT INTO public.games VALUES (100, 2014, 'Eighth-Final', 247, 268, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (245, 'France');
INSERT INTO public.teams VALUES (246, 'Croatia');
INSERT INTO public.teams VALUES (247, 'Belgium');
INSERT INTO public.teams VALUES (248, 'England');
INSERT INTO public.teams VALUES (249, 'Russia');
INSERT INTO public.teams VALUES (250, 'Sweden');
INSERT INTO public.teams VALUES (251, 'Brazil');
INSERT INTO public.teams VALUES (252, 'Uruguay');
INSERT INTO public.teams VALUES (253, 'Colombia');
INSERT INTO public.teams VALUES (254, 'Switzerland');
INSERT INTO public.teams VALUES (255, 'Japan');
INSERT INTO public.teams VALUES (256, 'Mexico');
INSERT INTO public.teams VALUES (257, 'Denmark');
INSERT INTO public.teams VALUES (258, 'Spain');
INSERT INTO public.teams VALUES (259, 'Portugal');
INSERT INTO public.teams VALUES (260, 'Argentina');
INSERT INTO public.teams VALUES (261, 'Germany');
INSERT INTO public.teams VALUES (262, 'Netherlands');
INSERT INTO public.teams VALUES (263, 'Costa Rica');
INSERT INTO public.teams VALUES (264, 'Chile');
INSERT INTO public.teams VALUES (265, 'Nigeria');
INSERT INTO public.teams VALUES (266, 'Algeria');
INSERT INTO public.teams VALUES (267, 'Greece');
INSERT INTO public.teams VALUES (268, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 100, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 268, true);


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
