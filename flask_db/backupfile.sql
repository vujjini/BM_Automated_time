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

--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    space_id integer,
    event_name character varying(100),
    start_time character varying(100),
    end_time character varying(100)
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.events_event_id_seq OWNER TO postgres;

--
-- Name: events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_event_id_seq OWNED BY public.events.id;


--
-- Name: spaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spaces (
    space_id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.spaces OWNER TO postgres;

--
-- Name: spaces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spaces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spaces_id_seq OWNER TO postgres;

--
-- Name: spaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spaces_id_seq OWNED BY public.spaces.space_id;


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_event_id_seq'::regclass);


--
-- Name: spaces space_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spaces ALTER COLUMN space_id SET DEFAULT nextval('public.spaces_id_seq'::regclass);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, space_id, event_name, start_time, end_time) FROM stdin;
59	31	2024 SPRING STUDY CENTERMSC OS MSC Bulls Patio 7:00 AM 12:00 AM	6:00 AM	1:00 AM
60	2	2024 SPRING STUDY CENTERMSC 2100 Prefunction 7:00 AM 12:00 AM	6:00 AM	1:00 AM
61	2	2024 SPRING STUDY CENTERMSC 2100 Prefunction 7:00 AM 12:00 AM	7:00 AM	12:00 AM
62	2	2024 SPRING STUDY CENTERMSC 2100ABC 7:00 AM 5:00 PM	7:00 AM	5:00 PM
63	1	2024 SPRING STUDY CENTERMSC 2500 Prefunction 7:00 AM 12:00 AM	7:00 AM	12:00 AM
64	9	QUIET STUDY ROOMMSC 2702 7:00 AM 12:00 AM	7:00 AM	12:00 AM
65	10	GROUP STUDY ROOMMSC 2703 7:00 AM 12:00 AM	7:00 AM	12:00 AM
66	11	GROUP STUDY ROOMMSC 2705 7:00 AM 12:00 AM	7:00 AM	12:00 AM
67	12	GROUP STUDY ROOMMSC 2706 7:00 AM 12:00 AM	7:00 AM	12:00 AM
68	13	QUIET STUDY ROOMMSC 2707 7:00 AM 12:00 AM	7:00 AM	12:00 AM
69	17	GROUP STUDY ROOMMSC 3701 7:00 AM 12:00 AM	7:00 AM	12:00 AM
70	18	2024 SPRING STUDY CENTERMSC 3702 7:00 AM 12:00 AM	7:00 AM	12:00 AM
71	19	QUIET STUDY ROOMMSC 3704 7:00 AM 12:00 AM	7:00 AM	12:00 AM
72	20	QUIET STUDY ROOMMSC 3705 7:00 AM 12:00 AM	7:00 AM	12:00 AM
73	21	QUIET STUDY ROOMMSC 3707 7:00 AM 12:00 AM	7:00 AM	12:00 AM
74	22	GROUP STUDY ROOMMSC 3708 7:00 AM 12:00 AM	7:00 AM	12:00 AM
75	23	GROUP STUDY ROOMMSC 3709 7:00 AM 12:00 AM	7:00 AM	12:00 AM
76	24	GROUP STUDY ROOMMSC 3711 7:00 AM 12:00 AM	7:00 AM	12:00 AM
77	25	QUIET STUDY ROOMMSC 3712 7:00 AM 12:00 AM	7:00 AM	12:00 AM
78	26	QUIET STUDY ROOMMSC 3713 7:00 AM 12:00 AM	7:00 AM	12:00 AM
79	27	2024 SPRING STUDY CENTERMSC 4200 7:00 AM 4:00 PM	7:00 AM	4:00 PM
80	32	2024 SPRING STUDY CENTERMSC MSC Atrium 7:00 AM 12:00 AM	7:00 AM	12:00 AM
81	41	2024 SPRING STUDY CENTERMSC OS Crsnt Hill Patio 7:00 AM 12:00 AM	7:00 AM	12:00 AM
82	41	2024 SPRING STUDY CENTERMSC OS Crsnt Hill Patio 7:00 AM 12:00 AM	7:00 AM	12:00 AM
83	42	2024 SPRING STUDY CENTERMSC OS MLK StageFount 7:00 AM 12:00 AM	7:00 AM	12:00 AM
84	42	2024 SPRING STUDY CENTERMSC OS MLK StageFount 7:00 AM 12:00 AM	7:00 AM	12:00 AM
85	33	2024 SPRING STUDY CENTERMSC OS MSC N Fire Lane 7:00 AM 11:45 AM	7:00 AM	12:00 AM
86	33	2024 SPRING STUDY CENTERMSC OS MSC N Fire Lane 7:00 AM 11:45 AM	7:00 AM	11:45 AM
87	34	2024 SPRING STUDY CENTERMSC OS MSC Plaza 7:00 AM 12:00 AM	7:00 AM	11:45 AM
88	34	2024 SPRING STUDY CENTERMSC OS MSC Plaza 7:00 AM 12:00 AM	7:00 AM	12:00 AM
89	36	2024 SPRING STUDY CENTERMSC OS North Entrance 7:00 AM 12:00 AM	7:00 AM	12:00 AM
90	36	2024 SPRING STUDY CENTERMSC OS North Entrance 7:00 AM 12:00 AM	7:00 AM	12:00 AM
91	37	2024 SPRING STUDY CENTERMSC Showcase Table E 7:00 AM 12:00 AM	7:00 AM	12:00 AM
92	37	2024 SPRING STUDY CENTERMSC Showcase Table E 7:00 AM 12:00 AM	7:00 AM	12:00 AM
93	38	2024 SPRING STUDY CENTERMSC Showcase Table N 7:00 AM 12:00 AM	7:00 AM	12:00 AM
94	1	BSC 2011 - BiodiversityMSC 2500 9:00 AM 10:30 AM	7:00 AM	12:00 AM
95	1	BSC 2011 - BiodiversityMSC 2500 9:00 AM 10:30 AM	8:30 AM	11:00 AM
96	15	SuccessMSC 2709 10:00 AM 2:30 PM	10:00 AM	2:30 PM
97	28	Destress for SuccessMSC OS MSC AMP 11:00 AM 2:00 PM	10:00 AM	2:30 PM
98	35	Staff SenateMSC Showcase Table M 10:00 AM 2:00 PM	10:00 AM	2:00 PM
99	16	SBS LuncheonMSC 3700 11:00 AM 2:00 PM	11:00 AM	2:00 PM
100	1	2024 SPRING STUDY CENTERMSC 2500 12:00 PM 12:00 AM	12:00 PM	12:00 AM
101	14	Chemistry 1 & 4MSC 2708 12:00 PM 4:00 PM	12:00 PM	4:00 PM
102	33	ReservationsMSC OS MSC N Fire Lane 12:00 PM 5:45 PM	12:00 PM	5:45 PM
103	16	2024 SPRING STUDY CENTERMSC 3700 2:00 PM 12:00 AM	12:00 PM	5:45 PM
104	16	2024 SPRING STUDY CENTERMSC 3700 2:00 PM 12:00 AM	2:00 PM	12:00 AM
105	15	GROUP STUDY ROOMMSC 2709 3:00 PM 12:00 AM	3:00 PM	12:00 AM
106	35	2024 SPRING STUDY CENTERMSC Showcase Table M 3:00 PM 12:00 AM	3:00 PM	12:00 AM
107	14	2024 SPRING STUDY CENTERMSC 2708 4:30 PM 12:00 AM	3:00 PM	12:00 AM
108	14	2024 SPRING STUDY CENTERMSC 2708 4:30 PM 12:00 AM	4:30 PM	12:00 AM
109	2	2024 SPRING STUDY CENTERMSC 2100ABC 5:00 PM 12:00 AM	5:00 PM	12:00 AM
110	27	SG Senate MeetingMSC 4200 5:00 PM 11:00 PM	5:00 PM	11:00 PM
111	43	2024 SPRING STUDY CENTERSLT MSC 3308 5:30 PM 11:00 PM	5:30 PM	11:00 PM
112	33	2024 SPRING STUDY CENTERMSC OS MSC N Fire Lane 6:00 PM 12:00 AM	6:00 PM	12:00 AM
113	28	FSL Photo ShootMSC OS MSC AMP 6:30 PM 8:00 PM	6:00 PM	12:00 AM
114	28	FSL Photo ShootMSC OS MSC AMP 6:30 PM 8:00 PM	6:30 PM	8:00 PM
\.


--
-- Data for Name: spaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spaces (space_id, name) FROM stdin;
1	2500
2	2100
3	2100A
4	2100AB
5	2100ABC
6	2100B
7	2100BC
8	2100C
9	2702
10	2703
11	2705
12	2706
13	2707
14	2708
15	2709
16	3700
17	3701
18	3702
19	3704
20	3705
21	3707
22	3708
23	3709
24	3711
25	3712
26	3713
27	4200
28	AMP
29	Crescent Hill
30	MLK Plaza
31	Bulls Patio
32	Atrium
33	MSC OS MSC N Fire Lane
34	Plaza
35	Showcase Table M
36	North Entrance
37	Showcase Table E
38	Showcase Table N
39	4111
40	Top of the Palms
41	Crsnt Hill
42	MLK Stage
43	3308
44	MSC Center Gallery
\.


--
-- Name: events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_event_id_seq', 114, true);


--
-- Name: spaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spaces_id_seq', 1000, false);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: spaces spaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spaces
    ADD CONSTRAINT spaces_pkey PRIMARY KEY (space_id);


--
-- Name: events events_space_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_space_id_fkey FOREIGN KEY (space_id) REFERENCES public.spaces(space_id);


--
-- PostgreSQL database dump complete
--

