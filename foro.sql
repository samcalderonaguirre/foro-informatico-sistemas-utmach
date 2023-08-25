--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2020-02-19 13:39:56

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

SET default_with_oids = false;

--
-- TOC entry 213 (class 1259 OID 84637)
-- Name: accounts_userprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_userprofile (
    id integer NOT NULL,
    bio text NOT NULL,
    avatar character varying(200) NOT NULL,
    status character varying(16) NOT NULL,
    user_id integer NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public.accounts_userprofile OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 84635)
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_userprofile_id_seq OWNER TO postgres;

--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 212
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_userprofile_id_seq OWNED BY public.accounts_userprofile.id;


--
-- TOC entry 203 (class 1259 OID 84541)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 84539)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 205 (class 1259 OID 84551)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 84549)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 201 (class 1259 OID 84533)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 84531)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 207 (class 1259 OID 84559)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 84569)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 84567)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 206 (class 1259 OID 84557)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 211 (class 1259 OID 84577)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 84575)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 216 (class 1259 OID 84692)
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 84712)
-- Name: correo_correo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.correo_correo (
    id integer NOT NULL,
    correo character varying(254) NOT NULL
);


ALTER TABLE public.correo_correo OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 84710)
-- Name: correo_correo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.correo_correo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.correo_correo_id_seq OWNER TO postgres;

--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 217
-- Name: correo_correo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.correo_correo_id_seq OWNED BY public.correo_correo.id;


--
-- TOC entry 215 (class 1259 OID 84664)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 84662)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 214
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 199 (class 1259 OID 84523)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 84521)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 197 (class 1259 OID 84512)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 84510)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 225 (class 1259 OID 84789)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 84720)
-- Name: forums_forum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forums_forum (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.forums_forum OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 84718)
-- Name: forums_forum_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forums_forum_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forums_forum_id_seq OWNER TO postgres;

--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 219
-- Name: forums_forum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forums_forum_id_seq OWNED BY public.forums_forum.id;


--
-- TOC entry 224 (class 1259 OID 84763)
-- Name: posts_post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts_post (
    id integer NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    creator_id integer NOT NULL,
    thread_id integer NOT NULL
);


ALTER TABLE public.posts_post OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 84761)
-- Name: posts_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_post_id_seq OWNER TO postgres;

--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 223
-- Name: posts_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_post_id_seq OWNED BY public.posts_post.id;


--
-- TOC entry 222 (class 1259 OID 84740)
-- Name: threads_thread; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.threads_thread (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    pinned boolean NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    last_activity timestamp with time zone NOT NULL,
    creator_id integer NOT NULL,
    forum_id integer NOT NULL
);


ALTER TABLE public.threads_thread OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 84738)
-- Name: threads_thread_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.threads_thread_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.threads_thread_id_seq OWNER TO postgres;

--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 221
-- Name: threads_thread_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.threads_thread_id_seq OWNED BY public.threads_thread.id;


--
-- TOC entry 2786 (class 2604 OID 84640)
-- Name: accounts_userprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile ALTER COLUMN id SET DEFAULT nextval('public.accounts_userprofile_id_seq'::regclass);


--
-- TOC entry 2781 (class 2604 OID 84544)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2782 (class 2604 OID 84554)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2780 (class 2604 OID 84536)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2783 (class 2604 OID 84562)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2784 (class 2604 OID 84572)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2785 (class 2604 OID 84580)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2789 (class 2604 OID 84715)
-- Name: correo_correo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correo_correo ALTER COLUMN id SET DEFAULT nextval('public.correo_correo_id_seq'::regclass);


--
-- TOC entry 2787 (class 2604 OID 84667)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2779 (class 2604 OID 84526)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2778 (class 2604 OID 84515)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2790 (class 2604 OID 84723)
-- Name: forums_forum id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forums_forum ALTER COLUMN id SET DEFAULT nextval('public.forums_forum_id_seq'::regclass);


--
-- TOC entry 2792 (class 2604 OID 84766)
-- Name: posts_post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post ALTER COLUMN id SET DEFAULT nextval('public.posts_post_id_seq'::regclass);


--
-- TOC entry 2791 (class 2604 OID 84743)
-- Name: threads_thread id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.threads_thread ALTER COLUMN id SET DEFAULT nextval('public.threads_thread_id_seq'::regclass);


--
-- TOC entry 3020 (class 0 OID 84637)
-- Dependencies: 213
-- Data for Name: accounts_userprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_userprofile (id, bio, avatar, status, user_id, name) FROM stdin;
2		https://res.cloudinary.com/rengorum/image/upload/v1581003654/zbogea0xxt8zeha2obdw.png		2	Jasson Torres
3		https://res.cloudinary.com/rengorum/image/upload/v1581003654/zbogea0xxt8zeha2obdw.png		3	Frank Narvaez
5		https://res.cloudinary.com/rengorum/image/upload/v1581003654/zbogea0xxt8zeha2obdw.png		5	Danny Ramirez
1	Estudiante de la UTMACH\nOctavo Semestre	https://res.cloudinary.com/rengorum/image/upload/v1581878951/dj0lovoyshlf3cmg0jy9.jpg	Programando	1	Darwin Calva
4	Estudiante UTMACH	https://res.cloudinary.com/rengorum/image/upload/v1581003654/zbogea0xxt8zeha2obdw.png	Estoy bien	4	Samuel Calderon
7		https://res.cloudinary.com/rengorum/image/upload/v1581003654/zbogea0xxt8zeha2obdw.png		7	Luis Vivanco
8		https://res.cloudinary.com/rengorum/image/upload/v1581003654/zbogea0xxt8zeha2obdw.png		8	Ricardo Ramon
9		https://res.cloudinary.com/rengorum/image/upload/v1581003654/zbogea0xxt8zeha2obdw.png		9	Yordan Solano
\.


--
-- TOC entry 3010 (class 0 OID 84541)
-- Dependencies: 203
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 84551)
-- Dependencies: 205
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 84533)
-- Dependencies: 201
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add Token	7	add_token
20	Can change Token	7	change_token
21	Can delete Token	7	delete_token
22	Can add user profile	8	add_userprofile
23	Can change user profile	8	change_userprofile
24	Can delete user profile	8	delete_userprofile
25	Can add forum	9	add_forum
26	Can change forum	9	change_forum
27	Can delete forum	9	delete_forum
28	Can add thread	10	add_thread
29	Can change thread	10	change_thread
30	Can delete thread	10	delete_thread
31	Can add post	11	add_post
32	Can change post	11	change_post
33	Can delete post	11	delete_post
34	Can add correo	12	add_correo
35	Can change correo	12	change_correo
36	Can delete correo	12	delete_correo
\.


--
-- TOC entry 3014 (class 0 OID 84559)
-- Dependencies: 207
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$100000$paxE72niJiKc$yuT2b37FJc7ZojTi7Hxkuk5GE4cio7QX7EwVm3JqY8M=	\N	f	jasson			jtorres3@utmachala.edu.ec	f	t	2020-02-14 10:04:17.99601-05
3	pbkdf2_sha256$100000$iU9nZupTMTQt$18ADgx/6CQNRl24hueSJIEanLraewxN0lWUFevKEhBQ=	\N	f	frank_n			fwnarvaez_est@utmachala.edu.ec	f	t	2020-02-14 10:11:05.64641-05
5	pbkdf2_sha256$100000$1iVT561pkHfd$+wP+0eCd9jmesuqjaIdDT6gOXFqIktPMzMBNZTQfhDU=	\N	f	daniux			daramirez_est@utmachala.edu.ec	f	t	2020-02-14 10:28:53.859256-05
1	pbkdf2_sha256$100000$COypQBe0ECb4$+0a4pC/3HYh7j8y6J+w6pfWWFgsv6r9b1kMDGA0D0jQ=	\N	f	darwin			dcalva3@utmachala.edu.ec	f	t	2020-02-14 03:20:55.089145-05
4	pbkdf2_sha256$100000$U8IdM0HgbJx8$e66d7R7+a66yo1TbYOKavfq/U+qUemnDH8YQ6uaLKYE=	\N	f	sam12			scalderon2@utmachala.edu.ec	f	t	2020-02-14 10:24:42.015446-05
7	pbkdf2_sha256$100000$9B306yYf7ysp$OUuYrVIMihcHeYfaMwcMmGW4CmOt/yPxReFhHhE/HTU=	\N	f	luis123			lavivanco_est@utmachala.edu.ec	f	t	2020-02-17 13:20:31.668888-05
8	pbkdf2_sha256$100000$29IzyjmeAIRy$D+uKuMhk9dV3mEje0/JTxd8tl2K8UD0jO5b47qtBryM=	\N	f	Ricardo			rramon2@utmachala.edu.ec	f	t	2020-02-19 11:31:06.726593-05
9	pbkdf2_sha256$100000$UovxojPcCNOe$6bzKGRd/3EtAOfnoXHNaGQScnXjAFaEZLGGpg4kk5g8=	\N	f	yordan			ysolano1@utmachala.edu.ec	f	t	2020-02-19 13:30:20.167031-05
\.


--
-- TOC entry 3016 (class 0 OID 84569)
-- Dependencies: 209
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 84577)
-- Dependencies: 211
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 84692)
-- Dependencies: 216
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 84712)
-- Dependencies: 218
-- Data for Name: correo_correo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.correo_correo (id, correo) FROM stdin;
1	scalderon2@utmachala.edu.ec
2	dcalva3@utmachala.edu.ec
4	daramirez_est@utmachala.edu.ec
5	dojeda_est@utmachala.edu
6	jtorres3@utmachala.edu.ec
7	eparedes3@utmachala.edu.ec
8	fwnarvaez_est@utmachala.edu.ec
9	rramon2@utmachala.edu.ec
10	lavivanco_est@utmachala.edu.ec
3	ysolano1@utmachala.edu.ec
\.


--
-- TOC entry 3022 (class 0 OID 84664)
-- Dependencies: 215
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 84523)
-- Dependencies: 199
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	authtoken	token
8	accounts	userprofile
9	forums	forum
10	threads	thread
11	posts	post
12	correo	correo
\.


--
-- TOC entry 3004 (class 0 OID 84512)
-- Dependencies: 197
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-02-14 03:10:59.533114-05
2	auth	0001_initial	2020-02-14 03:10:59.669216-05
3	accounts	0001_initial	2020-02-14 03:10:59.703153-05
4	accounts	0002_auto_20180404_0539	2020-02-14 03:10:59.710422-05
5	accounts	0003_userprofile_name	2020-02-14 03:10:59.719418-05
6	accounts	0004_auto_20180505_1611	2020-02-14 03:10:59.748415-05
7	admin	0001_initial	2020-02-14 03:10:59.780382-05
8	admin	0002_logentry_remove_auto_add	2020-02-14 03:10:59.791375-05
9	contenttypes	0002_remove_content_type_name	2020-02-14 03:10:59.810377-05
10	auth	0002_alter_permission_name_max_length	2020-02-14 03:10:59.817384-05
11	auth	0003_alter_user_email_max_length	2020-02-14 03:10:59.827855-05
12	auth	0004_alter_user_username_opts	2020-02-14 03:10:59.837853-05
13	auth	0005_alter_user_last_login_null	2020-02-14 03:10:59.856844-05
14	auth	0006_require_contenttypes_0002	2020-02-14 03:10:59.862838-05
15	auth	0007_alter_validators_add_error_messages	2020-02-14 03:10:59.874833-05
16	auth	0008_alter_user_username_max_length	2020-02-14 03:10:59.896818-05
17	auth	0009_alter_user_last_name_max_length	2020-02-14 03:10:59.91081-05
18	authtoken	0001_initial	2020-02-14 03:10:59.94479-05
19	authtoken	0002_auto_20160226_1747	2020-02-14 03:11:00.011752-05
20	correo	0001_initial	2020-02-14 03:11:00.025744-05
21	forums	0001_initial	2020-02-14 03:11:00.047735-05
22	forums	0002_forum_slug	2020-02-14 03:11:00.062726-05
23	forums	0003_auto_20180424_1650	2020-02-14 03:11:00.084718-05
24	forums	0004_auto_20200213_2358	2020-02-14 03:11:00.097586-05
25	threads	0001_initial	2020-02-14 03:11:00.143308-05
26	posts	0001_initial	2020-02-14 03:11:00.184429-05
27	posts	0002_auto_20180423_1708	2020-02-14 03:11:00.203413-05
28	posts	0003_auto_20180427_1400	2020-02-14 03:11:00.234396-05
29	posts	0004_auto_20180427_1512	2020-02-14 03:11:00.246388-05
30	sessions	0001_initial	2020-02-14 03:11:00.270376-05
31	threads	0002_auto_20180423_1708	2020-02-14 03:11:00.30036-05
32	threads	0003_auto_20180424_1650	2020-02-14 03:11:00.313369-05
33	threads	0004_auto_20180424_1654	2020-02-14 03:11:00.33034-05
34	threads	0005_auto_20180427_1512	2020-02-14 03:11:00.34833-05
35	threads	0006_auto_20180430_1612	2020-02-14 03:11:00.402302-05
36	threads	0007_auto_20180430_1617	2020-02-14 03:11:00.431282-05
37	threads	0008_auto_20180430_1625	2020-02-14 03:11:00.446275-05
\.


--
-- TOC entry 3032 (class 0 OID 84789)
-- Dependencies: 225
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 84720)
-- Dependencies: 220
-- Data for Name: forums_forum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forums_forum (id, name, description, slug) FROM stdin;
1	ADMINISTRACIÓN CENTROS DE CÓMPUTO	SEMESTRE -> 8vo	acc
2	PROGRAMACIÓN 6	SEMESTRE -> 8vo	programacion
3	EMPRENDIMIENTO	SEMESTRE -> 8vo	emprendimiento
4	SISTEMAS OPERATIVOS 2	SEMESTRE -> 8vo	so2
5	OPTATIVA 2	SEMESTRE -> 8vo	op2
6	BASE DE DATOS 3	SEMESTRE -> 7mo	bd3
\.


--
-- TOC entry 3031 (class 0 OID 84763)
-- Dependencies: 224
-- Data for Name: posts_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts_post (id, content, created_at, updated_at, creator_id, thread_id) FROM stdin;
1	{"blocks":[{"key":"c3f25","text":"Como remplazo de C#","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}	2020-02-14 10:05:28.571768-05	\N	1	1
2	{"blocks":[{"key":"32thv","text":"Es muy facil de usar","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}	2020-02-14 10:11:36.10037-05	\N	3	1
12	{"blocks":[{"key":"9umga","text":"No se jeje Saludos","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}	2020-02-19 11:32:53.093899-05	\N	8	4
13	{"blocks":[{"key":"2orgn","text":"Lee libros de Rodrigo Varela","type":"unstyled","depth":0,"inlineStyleRanges":[{"offset":0,"length":28,"style":"color-rgba(0,0,0,0.87)"},{"offset":0,"length":28,"style":"bgcolor-rgb(255,255,255)"},{"offset":0,"length":28,"style":"fontsize-14"},{"offset":0,"length":28,"style":"fontfamily-Lato, \\"Helvetica Neue\\", Arial, Helvetica, sans-serif"}],"entityRanges":[],"data":{}}],"entityMap":{}}	2020-02-19 12:00:33.84452-05	\N	5	3
\.


--
-- TOC entry 3029 (class 0 OID 84740)
-- Dependencies: 222
-- Data for Name: threads_thread; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.threads_thread (id, name, pinned, content, created_at, last_activity, creator_id, forum_id) FROM stdin;
1	Python	f	{"blocks":[{"key":"s0vb","text":"Porque usar Python?","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}	2020-02-14 10:04:53.620306-05	2020-02-14 10:11:36.10037-05	2	2
4	ITIL o COBIT	f	{"blocks":[{"key":"208ke","text":"Para que sirven ITIL y COBIT","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}	2020-02-16 14:21:43.692599-05	2020-02-19 11:32:53.093899-05	4	1
5	PostgreSQL	f	{"blocks":[{"key":"csqtn","text":"Que es una base de datos relacional🤔","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}	2020-02-19 11:35:09.660547-05	2020-02-19 11:35:09.660547-05	8	6
3	Libro de Emprendimiento	f	{"blocks":[{"key":"erajc","text":"Que libro me recomiendan leer?","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}	2020-02-16 13:56:12.934233-05	2020-02-19 12:00:33.84452-05	1	3
\.


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 212
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_userprofile_id_seq', 9, true);


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 9, true);


--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 217
-- Name: correo_correo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.correo_correo_id_seq', 1, false);


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 214
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 37, true);


--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 219
-- Name: forums_forum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forums_forum_id_seq', 1, false);


--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 223
-- Name: posts_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_post_id_seq', 13, true);


--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 221
-- Name: threads_thread_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.threads_thread_id_seq', 5, true);


--
-- TOC entry 2833 (class 2606 OID 84645)
-- Name: accounts_userprofile accounts_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 84647)
-- Name: accounts_userprofile accounts_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_key UNIQUE (user_id);


--
-- TOC entry 2806 (class 2606 OID 84548)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2811 (class 2606 OID 84603)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2814 (class 2606 OID 84556)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 84546)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 84589)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2803 (class 2606 OID 84538)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 84574)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2825 (class 2606 OID 84618)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2816 (class 2606 OID 84564)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 84582)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 84632)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2819 (class 2606 OID 84687)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2842 (class 2606 OID 84696)
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- TOC entry 2844 (class 2606 OID 84698)
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- TOC entry 2846 (class 2606 OID 84717)
-- Name: correo_correo correo_correo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correo_correo
    ADD CONSTRAINT correo_correo_pkey PRIMARY KEY (id);


--
-- TOC entry 2838 (class 2606 OID 84673)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 84530)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2798 (class 2606 OID 84528)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 84520)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 84796)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2849 (class 2606 OID 84736)
-- Name: forums_forum forums_forum_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forums_forum
    ADD CONSTRAINT forums_forum_name_key UNIQUE (name);


--
-- TOC entry 2851 (class 2606 OID 84725)
-- Name: forums_forum forums_forum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forums_forum
    ADD CONSTRAINT forums_forum_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 84733)
-- Name: forums_forum forums_forum_slug_1262ff97_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forums_forum
    ADD CONSTRAINT forums_forum_slug_1262ff97_uniq UNIQUE (slug);


--
-- TOC entry 2861 (class 2606 OID 84771)
-- Name: posts_post posts_post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post
    ADD CONSTRAINT posts_post_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 84748)
-- Name: threads_thread threads_thread_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.threads_thread
    ADD CONSTRAINT threads_thread_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 1259 OID 84591)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2809 (class 1259 OID 84604)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2812 (class 1259 OID 84605)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2799 (class 1259 OID 84590)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2820 (class 1259 OID 84620)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2823 (class 1259 OID 84619)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2826 (class 1259 OID 84634)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2829 (class 1259 OID 84633)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2817 (class 1259 OID 84688)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2840 (class 1259 OID 84704)
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- TOC entry 2836 (class 1259 OID 84684)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2839 (class 1259 OID 84685)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2863 (class 1259 OID 84798)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2866 (class 1259 OID 84797)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2847 (class 1259 OID 84737)
-- Name: forums_forum_name_8986eb62_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forums_forum_name_8986eb62_like ON public.forums_forum USING btree (name varchar_pattern_ops);


--
-- TOC entry 2852 (class 1259 OID 84734)
-- Name: forums_forum_slug_1262ff97_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forums_forum_slug_1262ff97_like ON public.forums_forum USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2859 (class 1259 OID 84782)
-- Name: posts_post_creator_id_a85958a8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_post_creator_id_a85958a8 ON public.posts_post USING btree (creator_id);


--
-- TOC entry 2862 (class 1259 OID 84783)
-- Name: posts_post_thread_id_bc111a44; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_post_thread_id_bc111a44 ON public.posts_post USING btree (thread_id);


--
-- TOC entry 2855 (class 1259 OID 84759)
-- Name: threads_thread_creator_id_9b3af66c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX threads_thread_creator_id_9b3af66c ON public.threads_thread USING btree (creator_id);


--
-- TOC entry 2856 (class 1259 OID 84760)
-- Name: threads_thread_forum_id_ada0513a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX threads_thread_forum_id_ada0513a ON public.threads_thread USING btree (forum_id);


--
-- TOC entry 2874 (class 2606 OID 84648)
-- Name: accounts_userprofile accounts_userprofile_user_id_92240672_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_92240672_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2869 (class 2606 OID 84597)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2868 (class 2606 OID 84592)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2867 (class 2606 OID 84583)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2871 (class 2606 OID 84612)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2870 (class 2606 OID 84607)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2873 (class 2606 OID 84626)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2872 (class 2606 OID 84621)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2877 (class 2606 OID 84705)
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2875 (class 2606 OID 84674)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2876 (class 2606 OID 84679)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2881 (class 2606 OID 84784)
-- Name: posts_post posts_post_creator_id_a85958a8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post
    ADD CONSTRAINT posts_post_creator_id_a85958a8_fk_auth_user_id FOREIGN KEY (creator_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2880 (class 2606 OID 84777)
-- Name: posts_post posts_post_thread_id_bc111a44_fk_threads_thread_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post
    ADD CONSTRAINT posts_post_thread_id_bc111a44_fk_threads_thread_id FOREIGN KEY (thread_id) REFERENCES public.threads_thread(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2879 (class 2606 OID 84799)
-- Name: threads_thread threads_thread_creator_id_9b3af66c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.threads_thread
    ADD CONSTRAINT threads_thread_creator_id_9b3af66c_fk_auth_user_id FOREIGN KEY (creator_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2878 (class 2606 OID 84754)
-- Name: threads_thread threads_thread_forum_id_ada0513a_fk_forums_forum_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.threads_thread
    ADD CONSTRAINT threads_thread_forum_id_ada0513a_fk_forums_forum_id FOREIGN KEY (forum_id) REFERENCES public.forums_forum(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2020-02-19 13:39:56

--
-- PostgreSQL database dump complete
--

