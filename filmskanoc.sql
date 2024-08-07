toc.dat                                                                                             0000600 0004000 0002000 00000005263 14646506415 0014460 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       :                |        
   filmskanoc    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    16440 
   filmskanoc    DATABASE     �   CREATE DATABASE filmskanoc WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Croatian_Croatia.1250';
    DROP DATABASE filmskanoc;
                postgres    false         �            1259    16442    filmovi    TABLE     �   CREATE TABLE public.filmovi (
    id integer NOT NULL,
    naziv_filma character varying(255) NOT NULL,
    godina_filma integer NOT NULL,
    likes integer DEFAULT 0,
    dislikes integer DEFAULT 0
);
    DROP TABLE public.filmovi;
       public         heap    postgres    false         �            1259    16441    filmovi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.filmovi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.filmovi_id_seq;
       public          postgres    false    216         �           0    0    filmovi_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.filmovi_id_seq OWNED BY public.filmovi.id;
          public          postgres    false    215         P           2604    16445 
   filmovi id    DEFAULT     h   ALTER TABLE ONLY public.filmovi ALTER COLUMN id SET DEFAULT nextval('public.filmovi_id_seq'::regclass);
 9   ALTER TABLE public.filmovi ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216         �          0    16442    filmovi 
   TABLE DATA           Q   COPY public.filmovi (id, naziv_filma, godina_filma, likes, dislikes) FROM stdin;
    public          postgres    false    216       4837.dat �           0    0    filmovi_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.filmovi_id_seq', 36, true);
          public          postgres    false    215         T           2606    16449    filmovi filmovi_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.filmovi
    ADD CONSTRAINT filmovi_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.filmovi DROP CONSTRAINT filmovi_pkey;
       public            postgres    false    216                                                                                                                                                                                                                                                                                                                                                     4837.dat                                                                                            0000600 0004000 0002000 00000000336 14646506415 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        33	Hit Man	2023	1	0
29	Missing	2023	10	0
30	Fresh	2022	5	0
31	You Are So Not Invited to My Bat Mitzvah	2023	2	1
32	Bob Marley: One Love	2024	2	1
34	Land of Bad	2024	1	0
35	Fast Charlie	2023	1	0
36	The Killer	2023	0	1
\.


                                                                                                                                                                                                                                                                                                  restore.sql                                                                                         0000600 0004000 0002000 00000005462 14646506415 0015406 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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

DROP DATABASE filmskanoc;
--
-- Name: filmskanoc; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE filmskanoc WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Croatian_Croatia.1250';


ALTER DATABASE filmskanoc OWNER TO postgres;

\connect filmskanoc

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
-- Name: filmovi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filmovi_id_seq OWNED BY public.filmovi.id;


--
-- Name: filmovi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filmovi ALTER COLUMN id SET DEFAULT nextval('public.filmovi_id_seq'::regclass);


--
-- Data for Name: filmovi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filmovi (id, naziv_filma, godina_filma, likes, dislikes) FROM stdin;
\.
COPY public.filmovi (id, naziv_filma, godina_filma, likes, dislikes) FROM '$$PATH$$/4837.dat';

--
-- Name: filmovi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filmovi_id_seq', 36, true);


--
-- Name: filmovi filmovi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filmovi
    ADD CONSTRAINT filmovi_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              