--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-07-19 17:16:53

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
-- TOC entry 216 (class 1259 OID 16442)
-- Name: filmovi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filmovi (
    id integer NOT NULL,
    naziv_filma character varying(255) NOT NULL,
    godina_filma integer NOT NULL,
    likes integer DEFAULT 0,
    dislikes integer DEFAULT 0
);


ALTER TABLE public.filmovi OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16441)
-- Name: filmovi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.filmovi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.filmovi_id_seq OWNER TO postgres;

--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 215
-- Name: filmovi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filmovi_id_seq OWNED BY public.filmovi.id;


--
-- TOC entry 4688 (class 2604 OID 16445)
-- Name: filmovi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filmovi ALTER COLUMN id SET DEFAULT nextval('public.filmovi_id_seq'::regclass);


--
-- TOC entry 4837 (class 0 OID 16442)
-- Dependencies: 216
-- Data for Name: filmovi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filmovi (id, naziv_filma, godina_filma, likes, dislikes) FROM stdin;
33	Hit Man	2023	1	0
29	Missing	2023	10	0
30	Fresh	2022	5	0
31	You Are So Not Invited to My Bat Mitzvah	2023	2	1
32	Bob Marley: One Love	2024	2	1
34	Land of Bad	2024	1	0
35	Fast Charlie	2023	1	0
36	The Killer	2023	0	1
\.


--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 215
-- Name: filmovi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filmovi_id_seq', 36, true);


--
-- TOC entry 4692 (class 2606 OID 16449)
-- Name: filmovi filmovi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filmovi
    ADD CONSTRAINT filmovi_pkey PRIMARY KEY (id);


-- Completed on 2024-07-19 17:16:54

--
-- PostgreSQL database dump complete
--

