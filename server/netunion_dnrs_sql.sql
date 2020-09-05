PGDMP     #    #                x            netunion_dnrs    9.5.21    12.4 ,    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16384    netunion_dnrs    DATABASE        CREATE DATABASE netunion_dnrs WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE netunion_dnrs;
                postgres    false            �           0    0    DATABASE netunion_dnrs    ACL       REVOKE ALL ON DATABASE netunion_dnrs FROM PUBLIC;
REVOKE ALL ON DATABASE netunion_dnrs FROM postgres;
GRANT ALL ON DATABASE netunion_dnrs TO postgres;
GRANT CONNECT,TEMPORARY ON DATABASE netunion_dnrs TO PUBLIC;
GRANT CONNECT ON DATABASE netunion_dnrs TO netunion_dnrs_visitor;
                   postgres    false    2186            �           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    6            �            1255    16447    set_default_account_password()    FUNCTION       CREATE FUNCTION public.set_default_account_password() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
	IF password != '42253fa978ca4bbf95668ec455e4844d' FROM account WHERE std_id = '2020091202000'
		THEN UPDATE account SET password = '42253fa978ca4bbf95668ec455e4844d' WHERE std_id = '2020091202000';
	ELSIF password != '42253fa978ca4bbf95668ec455e4844d' FROM account WHERE std_id = '2018091202000'
		THEN UPDATE account SET password = '42253fa978ca4bbf95668ec455e4844d' WHERE std_id = '2018091202000';
	END IF;
	RETURN NEW;
END;
$$;
 5   DROP FUNCTION public.set_default_account_password();
       public          postgres    false            �            1259    16387    account    TABLE     D  CREATE TABLE public.account (
    user_id integer NOT NULL,
    std_id text NOT NULL,
    password character(32) NOT NULL,
    role text NOT NULL,
    name character varying(20),
    telephone text,
    gender text,
    campus text,
    dormitory text,
    nickname character varying(30),
    intro character varying(50)
);
    DROP TABLE public.account;
       public            postgres    false            �           0    0    TABLE account    ACL     �   REVOKE ALL ON TABLE public.account FROM PUBLIC;
REVOKE ALL ON TABLE public.account FROM postgres;
GRANT ALL ON TABLE public.account TO postgres;
GRANT SELECT,INSERT,UPDATE ON TABLE public.account TO netunion_dnrs_visitor;
          public          postgres    false    182            �            1259    16385    account_id_seq    SEQUENCE     w   CREATE SEQUENCE public.account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.account_id_seq;
       public          postgres    false    182            �           0    0    account_id_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.account_id_seq OWNED BY public.account.user_id;
          public          postgres    false    181            �            1259    16403    order    TABLE     �  CREATE TABLE public."order" (
    order_id text NOT NULL,
    user_id integer,
    solver_id integer,
    order_status text NOT NULL,
    order_user_name character varying(20),
    order_user_gender text,
    order_user_telephone text,
    order_user_campus text NOT NULL,
    order_user_dormitory text NOT NULL,
    order_user_description text,
    order_solver_record text,
    order_notes text,
    create_date text NOT NULL,
    close_date text
);
    DROP TABLE public."order";
       public            postgres    false            �           0    0    TABLE "order"    ACL     �   REVOKE ALL ON TABLE public."order" FROM PUBLIC;
REVOKE ALL ON TABLE public."order" FROM postgres;
GRANT ALL ON TABLE public."order" TO postgres;
GRANT SELECT,INSERT,UPDATE ON TABLE public."order" TO netunion_dnrs_visitor;
          public          postgres    false    183            �            1259    16489    storage    TABLE     �   CREATE TABLE public.storage (
    storage_id integer NOT NULL,
    create_date text NOT NULL,
    key text NOT NULL,
    value text NOT NULL,
    expiration_date text
);
    DROP TABLE public.storage;
       public            postgres    false            �           0    0    TABLE storage    COMMENT     W   COMMENT ON TABLE public.storage IS '存储更新较少但频繁读取的缓存信息';
          public          postgres    false    186            �           0    0    TABLE storage    ACL     �   REVOKE ALL ON TABLE public.storage FROM PUBLIC;
REVOKE ALL ON TABLE public.storage FROM postgres;
GRANT ALL ON TABLE public.storage TO postgres;
GRANT SELECT,INSERT,UPDATE ON TABLE public.storage TO netunion_dnrs_visitor;
          public          postgres    false    186            �            1259    16487    storage_storage_id_seq    SEQUENCE        CREATE SEQUENCE public.storage_storage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.storage_storage_id_seq;
       public          postgres    false    186            �           0    0    storage_storage_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.storage_storage_id_seq OWNED BY public.storage.storage_id;
          public          postgres    false    185            �            1259    16421    token    TABLE     �   CREATE TABLE public.token (
    expiration_date text NOT NULL,
    user_id integer NOT NULL,
    token character(32) NOT NULL
);
    DROP TABLE public.token;
       public            postgres    false            �           0    0    TABLE token    ACL     �   REVOKE ALL ON TABLE public.token FROM PUBLIC;
REVOKE ALL ON TABLE public.token FROM postgres;
GRANT ALL ON TABLE public.token TO postgres;
GRANT SELECT,INSERT,UPDATE ON TABLE public.token TO netunion_dnrs_visitor;
          public          postgres    false    184            �           2604    16390    account user_id    DEFAULT     m   ALTER TABLE ONLY public.account ALTER COLUMN user_id SET DEFAULT nextval('public.account_id_seq'::regclass);
 >   ALTER TABLE public.account ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    182    181    182            �           2604    16492    storage storage_id    DEFAULT     x   ALTER TABLE ONLY public.storage ALTER COLUMN storage_id SET DEFAULT nextval('public.storage_storage_id_seq'::regclass);
 A   ALTER TABLE public.storage ALTER COLUMN storage_id DROP DEFAULT;
       public          postgres    false    186    185    186            �          0    16387    account 
   TABLE DATA              COPY public.account (user_id, std_id, password, role, name, telephone, gender, campus, dormitory, nickname, intro) FROM stdin;
    public          postgres    false    182   �9       �          0    16403    order 
   TABLE DATA             COPY public."order" (order_id, user_id, solver_id, order_status, order_user_name, order_user_gender, order_user_telephone, order_user_campus, order_user_dormitory, order_user_description, order_solver_record, order_notes, create_date, close_date) FROM stdin;
    public          postgres    false    183   �:       �          0    16489    storage 
   TABLE DATA           W   COPY public.storage (storage_id, create_date, key, value, expiration_date) FROM stdin;
    public          postgres    false    186   +>       �          0    16421    token 
   TABLE DATA           @   COPY public.token (expiration_date, user_id, token) FROM stdin;
    public          postgres    false    184   H>       �           0    0    account_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.account_id_seq', 1, false);
          public          postgres    false    181            �           0    0    storage_storage_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.storage_storage_id_seq', 1, false);
          public          postgres    false    185            �           2606    16402    account account_campus_check    CHECK CONSTRAINT     �   ALTER TABLE public.account
    ADD CONSTRAINT account_campus_check CHECK (((campus = '清水河校区(Qingshuihe Campus)'::text) OR (campus = '沙河校区(Shahe Campus)'::text))) NOT VALID;
 A   ALTER TABLE public.account DROP CONSTRAINT account_campus_check;
       public          postgres    false    182    182            �           2606    16401    account account_gender_check    CHECK CONSTRAINT     �   ALTER TABLE public.account
    ADD CONSTRAINT account_gender_check CHECK (((gender = '男(Male)'::text) OR (gender = '女(Female)'::text))) NOT VALID;
 A   ALTER TABLE public.account DROP CONSTRAINT account_gender_check;
       public          postgres    false    182    182            �           2606    16397    account account_id_key 
   CONSTRAINT     T   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_id_key UNIQUE (user_id);
 @   ALTER TABLE ONLY public.account DROP CONSTRAINT account_id_key;
       public            postgres    false    182            �           2606    16395    account account_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (user_id, std_id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    182    182            �           2606    16400    account account_role_check    CHECK CONSTRAINT     �   ALTER TABLE public.account
    ADD CONSTRAINT account_role_check CHECK (((role = 'user'::text) OR (role = 'solver'::text) OR (role = 'admin'::text))) NOT VALID;
 ?   ALTER TABLE public.account DROP CONSTRAINT account_role_check;
       public          postgres    false    182    182                        2606    16399    account account_std_id_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_std_id_key UNIQUE (std_id);
 D   ALTER TABLE ONLY public.account DROP CONSTRAINT account_std_id_key;
       public            postgres    false    182            �           2606    16437 #   order order_order_user_campus_check    CHECK CONSTRAINT     �   ALTER TABLE public."order"
    ADD CONSTRAINT order_order_user_campus_check CHECK (((order_user_campus = '清水河校区(Qingshuihe Campus)'::text) OR (order_user_campus = '沙河校区(Shahe Campus)'::text))) NOT VALID;
 J   ALTER TABLE public."order" DROP CONSTRAINT order_order_user_campus_check;
       public          postgres    false    183    183            �           2606    16436 #   order order_order_user_gender_check    CHECK CONSTRAINT     �   ALTER TABLE public."order"
    ADD CONSTRAINT order_order_user_gender_check CHECK (((order_user_gender = '男(Male)'::text) OR (order_user_gender = '女(Female)'::text))) NOT VALID;
 J   ALTER TABLE public."order" DROP CONSTRAINT order_order_user_gender_check;
       public          postgres    false    183    183                       2606    16410    order order_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_pkey;
       public            postgres    false    183                       2606    16497    storage storage_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.storage
    ADD CONSTRAINT storage_pkey PRIMARY KEY (storage_id, key);
 >   ALTER TABLE ONLY public.storage DROP CONSTRAINT storage_pkey;
       public            postgres    false    186    186                       2606    16428    token token_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.token DROP CONSTRAINT token_pkey;
       public            postgres    false    184                       2606    16435    token token_user_id_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_user_id_key UNIQUE (user_id);
 A   ALTER TABLE ONLY public.token DROP CONSTRAINT token_user_id_key;
       public            postgres    false    184                       2620    16450 (   account set_default_account_info_trigger    TRIGGER     �   CREATE TRIGGER set_default_account_info_trigger AFTER UPDATE ON public.account FOR EACH ROW EXECUTE PROCEDURE public.set_default_account_password();
 A   DROP TRIGGER set_default_account_info_trigger ON public.account;
       public          postgres    false    182    187            
           2606    16416    order order_solver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_solver_id_fkey FOREIGN KEY (solver_id) REFERENCES public.account(user_id) NOT VALID;
 F   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_solver_id_fkey;
       public          postgres    false    2044    183    182            	           2606    16411    order order_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.account(user_id) NOT VALID;
 D   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_user_id_fkey;
       public          postgres    false    2044    182    183                       2606    16429    token token_user_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.account(user_id);
 B   ALTER TABLE ONLY public.token DROP CONSTRAINT token_user_id_fkey;
       public          postgres    false    184    182    2044            �   �   x�3�420�0�4420200�41225NK�4�HN4IJJ�453�HM615M5�01I�,��)K-�����,�/�su�8-,-���������9����6�|�i������H�HUpN�-(-����JḾd��b�̗�=�f�W�	)(r�8πL�!9� �q;Z�m؂p_`f^zqFi&NGb��DCN�ۈwbi1����w�=]?W����?�=... \�      �   y  x��]k�Xǯ�|�\V9�/ފ����Խ�3G'lLj2�xWE�"-��eU*��b,�����L2s�_�''�L2��)�W��r������1\kb0f�S
�]8�(�DAڶ-�O�����"�\^(߾�o��on�/_e����ѕ����;�_]�G�p�Y��m{�����]�zk�s�@��l���L�߱-��M/���6���{a��ZiJ�r�����h�
5�����������F���	�|ۯ@fov���L�%�i����xM?j�pN R���p.�dN�1��qr<�y:��x�Zdm4f�,�������������gk냭?[+�����{ܙAĚ*�N�a��uq(^�$TǏAX� �������.��l�G�q��͆/%W���W�)Е���u�:�5����/������.�^ܩ���>�~��íY�TR�9�;'B��d������ț�!�=�ɿҝ�D �A�_�N���I�(hz�����x~����f;����{�D;�|T&]f<�y�o��_p�;*F��ĉ"R	�"Кd�����--�MQ���ŧj���z����a�uve���vV����ʧ�OeRj�PB$��Ge&��p��e"`O�Kշ��Mﶰ�ăϢ��K뗜*��(REd�
�W��
0��$R`A��	c��GPO��ə�`7�_8�ɤ熉�h\F�	)~<�2��~�Z�^Ǧ�I�{�vb��N�	\�q"++Hϸ���~@7_�k�$z�28H7�O_�ki<`p{�C+���o�
�C���H��ƾH�'@{��������P�a�hRqf�!T���R��mf�C[r!����X�����n�n�
o��L�pU��q�X����ٮ�      �      x������ � �      �   o   x�5˻1�X*����ŉ@��K8'Nwf� H[�9t$�
���75ӹ��9UMF��E�/<,-���!*<��o�W\���P_d<d4���o��[������9_ͱ#�     