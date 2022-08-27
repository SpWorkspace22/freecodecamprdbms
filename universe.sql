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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    descr text NOT NULL,
    is_spiral boolean,
    is_dwarf boolean,
    app_mag numeric(5,2),
    dis_from_earth numeric(5,2),
    extra_column_one integer,
    extra_column_two integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    descr text NOT NULL,
    cl boolean,
    cl1 boolean,
    mean_life_planet numeric(5,2),
    mean_life_star numeric(5,2),
    no_of_star integer,
    no_of_moon integer
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    descr text NOT NULL,
    has_water boolean,
    has_oxygen boolean,
    orbit_days numeric(5,2),
    diameter numeric(5,2),
    orbit_radius integer,
    dist_from_planet integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    descr text NOT NULL,
    is_spiral boolean,
    has_life boolean,
    dist_from_earth numeric(5,2),
    radius numeric(5,2),
    no_of_moon integer,
    orbit_days integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    descr text NOT NULL,
    is_spiral boolean,
    is_dwarf boolean,
    app_mag numeric(5,2),
    proximity numeric(5,2),
    extra_column_one integer,
    extra_column_two integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'g1', 'desbjh', true, false, 53.00, 23.00, 1, 2);
INSERT INTO public.galaxy VALUES (2, 'g2', 'desbjh', true, false, 53.00, 23.00, 1, 2);
INSERT INTO public.galaxy VALUES (3, 'g3', 'desbjh', true, false, 53.00, 23.00, 1, 2);
INSERT INTO public.galaxy VALUES (4, 'g4', 'desbjh', true, false, 53.00, 23.00, 1, 2);
INSERT INTO public.galaxy VALUES (5, 'g5', 'desbjh', true, false, 53.00, 23.00, 1, 2);
INSERT INTO public.galaxy VALUES (6, 'g6', 'desbjh', true, false, 53.00, 23.00, 1, 2);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 't1', 'gt', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy_type VALUES (2, 't2', 'gt', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy_type VALUES (3, 't3', 'gt', NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'm1', 'desbjh', true, false, 53.00, 23.00, 1, 2, 1);
INSERT INTO public.moon VALUES (2, 'm2', 'desbjh', true, false, 53.00, 23.00, 1, 2, 2);
INSERT INTO public.moon VALUES (3, 'm3', 'desbjh', true, false, 53.00, 23.00, 1, 2, 3);
INSERT INTO public.moon VALUES (4, 'm4', 'desbjh', true, false, 53.00, 23.00, 1, 2, 4);
INSERT INTO public.moon VALUES (5, 'm5', 'desbjh', true, false, 53.00, 23.00, 1, 2, 5);
INSERT INTO public.moon VALUES (6, 'm6', 'desbjh', true, false, 53.00, 23.00, 1, 2, 6);
INSERT INTO public.moon VALUES (7, 'm7', 'desbjh', true, false, 53.00, 23.00, 1, 2, 7);
INSERT INTO public.moon VALUES (8, 'm8', 'desbjh', true, false, 53.00, 23.00, 1, 2, 8);
INSERT INTO public.moon VALUES (9, 'm9', 'desbjh', true, false, 53.00, 23.00, 1, 2, 9);
INSERT INTO public.moon VALUES (10, 'm10', 'desbjh', true, false, 53.00, 23.00, 1, 2, 10);
INSERT INTO public.moon VALUES (11, 'm11', 'desbjh', true, false, 53.00, 23.00, 1, 2, 11);
INSERT INTO public.moon VALUES (12, 'm12', 'desbjh', true, false, 53.00, 23.00, 1, 2, 12);
INSERT INTO public.moon VALUES (13, 'm13', 'desbjh', true, false, 53.00, 23.00, 1, 2, 1);
INSERT INTO public.moon VALUES (14, 'm14', 'desbjh', true, false, 53.00, 23.00, 1, 2, 2);
INSERT INTO public.moon VALUES (15, 'm15', 'desbjh', true, false, 53.00, 23.00, 1, 2, 2);
INSERT INTO public.moon VALUES (16, 'm16', 'desbjh', true, false, 53.00, 23.00, 1, 2, 2);
INSERT INTO public.moon VALUES (17, 'm17', 'desbjh', true, false, 53.00, 23.00, 1, 2, 3);
INSERT INTO public.moon VALUES (18, 'm18', 'desbjh', true, false, 53.00, 23.00, 1, 2, 4);
INSERT INTO public.moon VALUES (19, 'm19', 'desbjh', true, false, 53.00, 23.00, 1, 2, 5);
INSERT INTO public.moon VALUES (20, 'm20', 'desbjh', true, false, 53.00, 23.00, 1, 2, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'p1', 'desbjh', true, false, 53.00, 23.00, 1, 2, 1);
INSERT INTO public.planet VALUES (2, 'p2', 'desbjh', true, false, 53.00, 23.00, 1, 2, 1);
INSERT INTO public.planet VALUES (3, 'p3', 'desbjh', true, false, 53.00, 23.00, 1, 2, 2);
INSERT INTO public.planet VALUES (4, 'p4', 'desbjh', true, false, 53.00, 23.00, 1, 2, 2);
INSERT INTO public.planet VALUES (5, 'p5', 'desbjh', true, false, 53.00, 23.00, 1, 2, 3);
INSERT INTO public.planet VALUES (6, 'p6', 'desbjh', true, false, 53.00, 23.00, 1, 2, 3);
INSERT INTO public.planet VALUES (7, 'p7', 'desbjh', true, false, 53.00, 23.00, 1, 2, 4);
INSERT INTO public.planet VALUES (8, 'p8', 'desbjh', true, false, 53.00, 23.00, 1, 2, 4);
INSERT INTO public.planet VALUES (9, 'p9', 'desbjh', true, false, 53.00, 23.00, 1, 2, 5);
INSERT INTO public.planet VALUES (10, 'p10', 'desbjh', true, false, 53.00, 23.00, 1, 2, 5);
INSERT INTO public.planet VALUES (11, 'p11', 'desbjh', true, false, 53.00, 23.00, 1, 2, 6);
INSERT INTO public.planet VALUES (12, 'p12', 'desbjh', true, false, 53.00, 23.00, 1, 2, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 's1', 'desbjh', true, false, 53.00, 23.00, 1, 2, 1);
INSERT INTO public.star VALUES (2, 's2', 'desbjh', true, false, 53.00, 23.00, 1, 2, 2);
INSERT INTO public.star VALUES (3, 's3', 'desbjh', true, false, 53.00, 23.00, 1, 2, 3);
INSERT INTO public.star VALUES (4, 's4', 'desbjh', true, false, 53.00, 23.00, 1, 2, 4);
INSERT INTO public.star VALUES (5, 's5', 'desbjh', true, false, 53.00, 23.00, 1, 2, 5);
INSERT INTO public.star VALUES (6, 's6', 'desbjh', true, false, 53.00, 23.00, 1, 2, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

