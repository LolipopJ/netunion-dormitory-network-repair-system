toc.dat                                                                                             0000600 0004000 0002000 00000017261 13627204340 0014447 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       ,                    x            netunion_dnrs    11.7    11.7 !               0    0    ENCODING    ENCODING        SET client_encoding = 'GBK';
                       false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                    1262    16393    netunion_dnrs    DATABASE     k   CREATE DATABASE netunion_dnrs WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE netunion_dnrs;
             postgres    false         �            1259    16396    user    TABLE     �   CREATE TABLE public."user" (
    name character varying(20),
    telephone character varying(20),
    campus text,
    dormitory text,
    std_id character varying(20) NOT NULL,
    id integer NOT NULL,
    password character(32) NOT NULL
);
    DROP TABLE public."user";
       public         postgres    false                    0    0    TABLE "user"    COMMENT     8   COMMENT ON TABLE public."user" IS '���ӿƼ���ѧѧ����';
            public       postgres    false    196                    0    0    COLUMN "user".name    COMMENT     >   COMMENT ON COLUMN public."user".name IS '�洢�û���������Ϣ';
            public       postgres    false    196                    0    0    COLUMN "user".telephone    COMMENT     G   COMMENT ON COLUMN public."user".telephone IS '�洢�û�����ϵ��ʽ��Ϣ';
            public       postgres    false    196                    0    0    COLUMN "user".campus    COMMENT     {   COMMENT ON COLUMN public."user".campus IS '�洢�û���У����Ϣ��
Qingshuihe Campus����ˮ��У����
Shahe Campus��ɳ��У����';
            public       postgres    false    196                    0    0    COLUMN "user".dormitory    COMMENT     K   COMMENT ON COLUMN public."user".dormitory IS '�洢�û������ҵ�ַ�����ƺ�';
            public       postgres    false    196                    0    0    COLUMN "user".std_id    COMMENT     V   COMMENT ON COLUMN public."user".std_id IS '�洢�û���ѧ����Ϣ����Ϊ�û���¼���û���';
            public       postgres    false    196                    0    0    COLUMN "user".id    COMMENT     4   COMMENT ON COLUMN public."user".id IS '�û���ʶ��';
            public       postgres    false    196                    0    0    COLUMN "user".password    COMMENT     B   COMMENT ON COLUMN public."user".password IS '�洢�û��ĵ�½����';
            public       postgres    false    196         �            1259    24585    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public       postgres    false    196                    0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
            public       postgres    false    197         �            1259    24604    user_netunion    TABLE     m   CREATE TABLE public.user_netunion (
    intro text,
    service boolean NOT NULL
)
INHERITS (public."user");
 !   DROP TABLE public.user_netunion;
       public         postgres    false    196                    0    0    TABLE user_netunion    COMMENT     G   COMMENT ON TABLE public.user_netunion IS '���ӿƼ���ѧNetUnion��Ա��';
            public       postgres    false    198                    0    0    COLUMN user_netunion.intro    COMMENT     @   COMMENT ON COLUMN public.user_netunion.intro IS '��Ա�����Ϣ';
            public       postgres    false    198                    0    0    COLUMN user_netunion.service    COMMENT     N   COMMENT ON COLUMN public.user_netunion.service IS '��Ա�Ƿ��������ά�޷���';
            public       postgres    false    198         �            1259    24628 
   user_token    TABLE     �   CREATE TABLE public.user_token (
    token character(32) NOT NULL,
    expiration_date text NOT NULL,
    id integer NOT NULL
);
    DROP TABLE public.user_token;
       public         postgres    false                    0    0    TABLE user_token    COMMENT     �   COMMENT ON TABLE public.user_token IS '����û��ĵ�½���ƣ�
�����ú��ʱ���ȷ��ʴ˴���֤�û��ĵ�½״����
���Ƶ���Ч��Ϊ 1 �졣';
            public       postgres    false    199                     0    0    COLUMN user_token.token    COMMENT     9   COMMENT ON COLUMN public.user_token.token IS '�û�����';
            public       postgres    false    199         !           0    0 !   COLUMN user_token.expiration_date    COMMENT     M   COMMENT ON COLUMN public.user_token.expiration_date IS '�û����ƵĹ���ʱ��';
            public       postgres    false    199         "           0    0    COLUMN user_token.id    COMMENT     C   COMMENT ON COLUMN public.user_token.id IS '�û����ƶ�Ӧ���û� id';
            public       postgres    false    199         �
           2604    24587    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196         �
           2604    24607    user_netunion id    DEFAULT     k   ALTER TABLE ONLY public.user_netunion ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 ?   ALTER TABLE public.user_netunion ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    198         	          0    16396    user 
   TABLE DATA               Z   COPY public."user" (name, telephone, campus, dormitory, std_id, id, password) FROM stdin;
    public       postgres    false    196       2825.dat           0    24604    user_netunion 
   TABLE DATA               q   COPY public.user_netunion (name, telephone, campus, dormitory, std_id, id, intro, service, password) FROM stdin;
    public       postgres    false    198       2827.dat           0    24628 
   user_token 
   TABLE DATA               @   COPY public.user_token (token, expiration_date, id) FROM stdin;
    public       postgres    false    199       2828.dat #           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 1, false);
            public       postgres    false    197         �
           2606    24612     user_netunion user_netunion_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.user_netunion
    ADD CONSTRAINT user_netunion_pkey PRIMARY KEY (std_id, id);
 J   ALTER TABLE ONLY public.user_netunion DROP CONSTRAINT user_netunion_pkey;
       public         postgres    false    198    198         �
           2606    24603    user user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id, std_id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public         postgres    false    196    196         �
           2606    24637    user_token user_token_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.user_token
    ADD CONSTRAINT user_token_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.user_token DROP CONSTRAINT user_token_pkey;
       public         postgres    false    199                                                                                                                                                                                                                                                                                                                                                       2825.dat                                                                                            0000600 0004000 0002000 00000000153 13627204340 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        Lolipop	18980340000	ɳ��У��(Shahe Campus)	��2�� 233	2018091202000	1	42253fa978ca4bbf95668ec455e4844d
\.


                                                                                                                                                                                                                                                                                                                                                                                                                     2827.dat                                                                                            0000600 0004000 0002000 00000000005 13627204340 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2828.dat                                                                                            0000600 0004000 0002000 00000000066 13627204340 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        40ec64d6d8e781d7184be52120f4e5f9	1583241163795	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                          restore.sql                                                                                         0000600 0004000 0002000 00000015460 13627204341 0015374 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7
-- Dumped by pg_dump version 11.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'GBK';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE netunion_dnrs;
--
-- Name: netunion_dnrs; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE netunion_dnrs WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE netunion_dnrs OWNER TO postgres;

\connect netunion_dnrs

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'GBK';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    name character varying(20),
    telephone character varying(20),
    campus text,
    dormitory text,
    std_id character varying(20) NOT NULL,
    id integer NOT NULL,
    password character(32) NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: TABLE "user"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."user" IS '���ӿƼ���ѧѧ����';


--
-- Name: COLUMN "user".name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."user".name IS '�洢�û���������Ϣ';


--
-- Name: COLUMN "user".telephone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."user".telephone IS '�洢�û�����ϵ��ʽ��Ϣ';


--
-- Name: COLUMN "user".campus; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."user".campus IS '�洢�û���У����Ϣ��
Qingshuihe Campus����ˮ��У����
Shahe Campus��ɳ��У����';


--
-- Name: COLUMN "user".dormitory; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."user".dormitory IS '�洢�û������ҵ�ַ�����ƺ�';


--
-- Name: COLUMN "user".std_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."user".std_id IS '�洢�û���ѧ����Ϣ����Ϊ�û���¼���û���';


--
-- Name: COLUMN "user".id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."user".id IS '�û���ʶ��';


--
-- Name: COLUMN "user".password; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."user".password IS '�洢�û��ĵ�½����';


--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user_netunion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_netunion (
    intro text,
    service boolean NOT NULL
)
INHERITS (public."user");


ALTER TABLE public.user_netunion OWNER TO postgres;

--
-- Name: TABLE user_netunion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.user_netunion IS '���ӿƼ���ѧNetUnion��Ա��';


--
-- Name: COLUMN user_netunion.intro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.user_netunion.intro IS '��Ա�����Ϣ';


--
-- Name: COLUMN user_netunion.service; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.user_netunion.service IS '��Ա�Ƿ��������ά�޷���';


--
-- Name: user_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_token (
    token character(32) NOT NULL,
    expiration_date text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.user_token OWNER TO postgres;

--
-- Name: TABLE user_token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.user_token IS '����û��ĵ�½���ƣ�
�����ú��ʱ���ȷ��ʴ˴���֤�û��ĵ�½״����
���Ƶ���Ч��Ϊ 1 �졣';


--
-- Name: COLUMN user_token.token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.user_token.token IS '�û�����';


--
-- Name: COLUMN user_token.expiration_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.user_token.expiration_date IS '�û����ƵĹ���ʱ��';


--
-- Name: COLUMN user_token.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.user_token.id IS '�û����ƶ�Ӧ���û� id';


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: user_netunion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_netunion ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (name, telephone, campus, dormitory, std_id, id, password) FROM stdin;
\.
COPY public."user" (name, telephone, campus, dormitory, std_id, id, password) FROM '$$PATH$$/2825.dat';

--
-- Data for Name: user_netunion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_netunion (name, telephone, campus, dormitory, std_id, id, intro, service, password) FROM stdin;
\.
COPY public.user_netunion (name, telephone, campus, dormitory, std_id, id, intro, service, password) FROM '$$PATH$$/2827.dat';

--
-- Data for Name: user_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_token (token, expiration_date, id) FROM stdin;
\.
COPY public.user_token (token, expiration_date, id) FROM '$$PATH$$/2828.dat';

--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- Name: user_netunion user_netunion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_netunion
    ADD CONSTRAINT user_netunion_pkey PRIMARY KEY (std_id, id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id, std_id);


--
-- Name: user_token user_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_token
    ADD CONSTRAINT user_token_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                