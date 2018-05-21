--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: comment; Type: TABLE; Schema: public; Owner: ismailmellouli
--

CREATE TABLE public.comment (
    id text NOT NULL,
    post text,
    type text,
    content text,
    text text,
    "user" text,
    upvotes double precision,
    downvotes double precision,
    parent text,
    __comment_parent_inverse text[] DEFAULT '{}'::text[] NOT NULL,
    "__commentVote_comment_inverse" text[] DEFAULT '{}'::text[] NOT NULL,
    "__postReport_comment_inverse" text[] DEFAULT '{}'::text[] NOT NULL
);


ALTER TABLE public.comment OWNER TO ismailmellouli;

--
-- Name: commentVote; Type: TABLE; Schema: public; Owner: ismailmellouli
--

CREATE TABLE public."commentVote" (
    id text NOT NULL,
    comment text,
    post text,
    "user" text,
    date timestamp without time zone,
    positive boolean
);


ALTER TABLE public."commentVote" OWNER TO ismailmellouli;

--
-- Name: facebook; Type: TABLE; Schema: public; Owner: ismailmellouli
--

CREATE TABLE public.facebook (
    id text NOT NULL,
    token text,
    facebook_id text,
    email text,
    display_name text,
    name text,
    "refreshToken" text
);


ALTER TABLE public.facebook OWNER TO ismailmellouli;

--
-- Name: post; Type: TABLE; Schema: public; Owner: ismailmellouli
--

CREATE TABLE public.post (
    id text NOT NULL,
    title text,
    "OC" boolean,
    "user" text,
    thumbnail text,
    score double precision,
    grade double precision,
    date timestamp without time zone,
    content text,
    type text,
    tags text[] DEFAULT '{}'::text[] NOT NULL,
    "__postTag_post_inverse" text[] DEFAULT '{}'::text[] NOT NULL,
    "__userVote_post_inverse" text[] DEFAULT '{}'::text[] NOT NULL,
    __comment_post_inverse text[] DEFAULT '{}'::text[] NOT NULL,
    "__commentVote_post_inverse" text[] DEFAULT '{}'::text[] NOT NULL,
    "__postReport_post_inverse" text[] DEFAULT '{}'::text[] NOT NULL,
    url text
);


ALTER TABLE public.post OWNER TO ismailmellouli;

--
-- Name: postReport; Type: TABLE; Schema: public; Owner: ismailmellouli
--

CREATE TABLE public."postReport" (
    id text NOT NULL,
    post text,
    "fromUser" text,
    "reportedUser" text,
    comment text,
    "reasonNotOC" boolean,
    "reasonIllegal" boolean,
    reason text
);


ALTER TABLE public."postReport" OWNER TO ismailmellouli;

--
-- Name: postTag; Type: TABLE; Schema: public; Owner: ismailmellouli
--

CREATE TABLE public."postTag" (
    id text NOT NULL,
    tag text,
    post text,
    upvotes double precision,
    downvotes double precision,
    date timestamp without time zone,
    __post_tags_inverse text[] DEFAULT '{}'::text[] NOT NULL
);


ALTER TABLE public."postTag" OWNER TO ismailmellouli;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: ismailmellouli
--

CREATE TABLE public.tag (
    id text NOT NULL,
    name text,
    "createdBy" text,
    "createdDate" timestamp without time zone,
    "__postTag_tag_inverse" text[] DEFAULT '{}'::text[] NOT NULL,
    "__userVote_tag_inverse" text[] DEFAULT '{}'::text[] NOT NULL
);


ALTER TABLE public.tag OWNER TO ismailmellouli;

--
-- Name: twitter; Type: TABLE; Schema: public; Owner: ismailmellouli
--

CREATE TABLE public.twitter (
    id text NOT NULL,
    token text,
    "refreshToken" text,
    email text,
    display_name text,
    twitter_id text,
    name text
);


ALTER TABLE public.twitter OWNER TO ismailmellouli;

--
-- Name: user; Type: TABLE; Schema: public; Owner: ismailmellouli
--

CREATE TABLE public."user" (
    id text NOT NULL,
    avatar text,
    balance double precision,
    subscription timestamp without time zone,
    contribution double precision,
    email text,
    username text,
    "accountConfirmed" boolean,
    password text,
    password_change_request_hash text,
    "lastLogin" timestamp without time zone,
    google_id text,
    token text,
    "refreshToken" text,
    __post_user_inverse text[] DEFAULT '{}'::text[] NOT NULL,
    "__tag_createdBy_inverse" text[] DEFAULT '{}'::text[] NOT NULL,
    "__userVote_user_inverse" text[] DEFAULT '{}'::text[] NOT NULL,
    "__commentVote_user_inverse" text[] DEFAULT '{}'::text[] NOT NULL,
    __comment_user_inverse text[] DEFAULT '{}'::text[] NOT NULL,
    "__postReport_fromUser_inverse" text[] DEFAULT '{}'::text[] NOT NULL,
    "__postReport_reportedUser_inverse" text[] DEFAULT '{}'::text[] NOT NULL
);


ALTER TABLE public."user" OWNER TO ismailmellouli;

--
-- Name: userVote; Type: TABLE; Schema: public; Owner: ismailmellouli
--

CREATE TABLE public."userVote" (
    id text NOT NULL,
    post text,
    tag text,
    "user" text,
    date timestamp without time zone,
    positive boolean
);


ALTER TABLE public."userVote" OWNER TO ismailmellouli;

--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: ismailmellouli
--

COPY public.comment (id, post, type, content, text, "user", upvotes, downvotes, parent, __comment_parent_inverse, "__commentVote_comment_inverse", "__postReport_comment_inverse") FROM stdin;
\.


--
-- Data for Name: commentVote; Type: TABLE DATA; Schema: public; Owner: ismailmellouli
--

COPY public."commentVote" (id, comment, post, "user", date, positive) FROM stdin;
\.


--
-- Data for Name: facebook; Type: TABLE DATA; Schema: public; Owner: ismailmellouli
--

COPY public.facebook (id, token, facebook_id, email, display_name, name, "refreshToken") FROM stdin;
\.


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: ismailmellouli
--

COPY public.post (id, title, "OC", "user", thumbnail, score, grade, date, content, type, tags, "__postTag_post_inverse", "__userVote_post_inverse", __comment_post_inverse, "__commentVote_post_inverse", "__postReport_post_inverse", url) FROM stdin;
RXfonBBi8eD0Gjipd4nV	Kief Catcher Closest Thing Man Has to Savings Account	f	\N	\N	0	\N	2018-05-02 15:50:50	\N	\N	{}	{+e9kDZhv1u0vAxgQLJ8n,HS6p+FeDoX8Zqenhm9jj}	{}	{}	{}	{}	post1
7WZeuD36gEL27pCNE/CK	A Foggy Night	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{yJ7fFW8d6yut1oeXl65b,DIP2moW02JP6UZtJRuEx}	{}	{}	{}	{}	post0
OTS756rcFuq0vI0/iK2F	Going commando on the street GIF	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{odg9sm6WtnTEncqjVQxQ,a8N00cWYU5dF2AMSLKkl,bB9B0j0Xr7lb6OJztend}	{}	{}	{}	{}	post1
ozuWyPOmCpafcarrJoPp	ELI5 Whats happening when you take a pill, but it feels like its caught in the back of your throat	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{bB4+/puWJyYHmbr0yppL,RDzYY6ByTjw3Ng1YY60Q}	{}	{}	{}	{}	post1
CxAO4biVw74/6D8mlRGY	When Link pauses to eat in battle, I imagine him holding up a finger ala Archer	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{gmoLH0lNmsp1zH06hJKV,EMjxsnsVkgkQ38b4Sr1W}	{}	{}	{}	{}	post1
hN3Y/AhQqtDWM/dUsNGe	MRW I sent a dick pic to a blind girl OC	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{jCNBcX1jHar74g8Cdy1V,wbzTyg7bDGy/erS/zGQT,0SF0C09OCIcZw0wTPjfh,0hYyKbys8hjRmbYiLRBz,7GoazaSf1Un3xuAjr9eJ}	{}	{}	{}	{}	post1
KlDHviOp+M9hNwpHzIHr	This B R A V E B O Y E dun first boop with vv big snoot cowpupper  13 weeks	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{tvVuNQVVTnNYUDF7i6kr,C59rso2+cIdGaDohkkzO,Eaos16NG0ghQVmvaohgA,G7z53Wb4jSSJOWH2FBZT,0jRhjm3rLwHaARFWR7v5}	{}	{}	{}	{}	post1
CHv+0CYlbIplUtmCCU7K	See what happens when you push me down in the dunk tank one too many times	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{qlmPIGJQZ1F6xVqkEpqd,LOLt7/KmUPWq66P0vEYw,5tOAjPvR0sWQJ6iT11AA}	{}	{}	{}	{}	post1
RvFUV4c61WMzWkEsqN9h	Amazing Android 18 fanart by sakimichan on deviantart	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{wRtS1a0t1fz/JfROdQf0,q75ooO0Rde11iLa7wgs3}	{}	{}	{}	{}	post1
PS7iBtlxeudq8edyQlEe	April Contest Egg ruins everything	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ob9G21RmpcfuQDzqU0Hg,EP2aOMhaK8xqumko+j19,SOS1Pe9/xmh3hDfX1KGL}	{}	{}	{}	{}	post1
rUnSDBKcEohBm52vsdAD	Did drawing of Master Chief digitally on my iPad	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{4/tlEjQfBC6+16BRBUWA,H40SE+3LdR7EBdOBY1hZ}	{}	{}	{}	{}	post1
9h1y3jT8QdTsJyWDBN9/	Breasttaking	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{VIYcBJNRp4TXD+hBWXkg,0ZBHJiBUNy3vLISw+UKz,6EWsfe9/o4HhEvk4Y2I1,G64LGfncjb+IKTtOMGH8,TE/ozbzDM5RmK5RT4BW9}	{}	{}	{}	{}	post1
xwE31xNhq7y8ZpE8xp74	Nice	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{+pVmoSjL++c0WZpk0VGY,EWt49IKaaO4xHAkHzUvz,qHqev84zbvJF+4XDFfBz,0yJOH5Nus2kocgyL9YnN}	{}	{}	{}	{}	post1
qzYWi0Fbdg6J4kFUUiTh	Aggressive Driver Karma  0119	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{5mzLg65fgyO7peIPpbB+,mYrssQBhzVAyIOkrv7IZ,Z/JNYb5Kk7oKrXPFBKsk,t6leReFPKsWVanGQNukr}	{}	{}	{}	{}	post1
VSW1UK99KY7AA/zDbtmz	New Pet	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{a6VuZA5WgH4sShur281y,atdKNRYRv13L/Jv8V16R,VMnD8HAZt5q3xYaOMrUq}	{}	{}	{}	{}	post1
MUCNoCy1Ntjza0U69Hcl	Hamox	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{LT2qUVBdrntTTHJQCpAN,qR3kBjQYnaYHk/8nmB+n}	{}	{}	{}	{}	post1
rEzlHP0CCqU32go9uLwG	Vem r du	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{LwKQkVXIP+2otgaclerD,ntfnYIwipxqe9UxMMVKU}	{}	{}	{}	{}	post1
10mZl57kD4OGn8jHDqkD	Monstrous	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{no6YfyM8r4wjwVzGgT53,oLyRz7E28m57J1/MowT/,j0nDCaMkbUvdDEYEJCl0}	{}	{}	{}	{}	post1
ipYmBwlB92y3YqJdgWNe	PsBattle Two mannequins posing awesomely	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{5scpCNOru3HOcKnLxuyo,13ODUC+tj+8KEKQzjkrA,OUQyemEpIRIuy4KC/g4N}	{}	{}	{}	{}	post1
v1rRQbhc0QjrTM9qLAhF	This image pretty much sums up the state of Linux 10 years ago	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{LmjpXox+nIENTlMbmRnR,VwyLSIegQC/smNMjRmZq,5q6OxfSsS9e+L3OgWF22,jNEh/Y9KOdti4AtwmVi8,lFfX31u1Alx9fNYYCspA}	{}	{}	{}	{}	post1
3WNHhJ3+oJHtmxcgQUt4	Maybe keeping your kids out of school will cause them to develop the same stupid opinions as yours	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{qoLPda1pJA9xrGLdfaVH,3XsuGVt6DIjrztyJRgS7,6zjYaEnV7AxCCShIEV44}	{}	{}	{}	{}	post1
phlzm1ueK3NjTse+7HWB	MiaRand as Triss Merigold	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{mYnZlng2ByJSw7PtMRgA,rBHjcjB/Q9GJcKYZzU6P}	{}	{}	{}	{}	post1
sN+vKOoDDgpfrDrBGB+2	Take the mic	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{msBdUUDO3EoZGD7dzpak,bnmvWDs64GCwRqvJ4Nrm,1xeB7XgJ158mIbQltCmR,BrqaJVLtgb6oE3M3JSTV,2tH5YIw0R4EBVNZ1cBHS}	{}	{}	{}	{}	post1
UKgeGGKcEPfMJbWrl/ea	States are moving to cut college costs by introducing opensource textbooks	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{mX9YeQNaAPwTicSFtkjj,jgmu2AQXqR1vI2jkeTBT,ykPfasOIdNzXpnrIbI4i,UmrqVxNpyrJu7BqMF/W8}	{}	{}	{}	{}	post1
6AYJ9KIBgzssNJKnehTE	Capitalism	f	\N	\N	0	\N	2018-04-12 15:50:50	\N	\N	{}	{AftL4RsJXfFJu7xgL76j,EN3Dqatollaxz1UVxdf7,cxIO90arIyOo5CVh5N4p,RW6h7PN8yJyT9G3MJCln,NLn4Q6ygW0JXdPNanhW5}	{}	{}	{}	{}	post1
nlMFl79kePKtL0ocrR+H	The James Webb Space Telescope would like to make a special shoutout to the coolest sub on reddit	f	\N	\N	0	\N	2018-05-13 15:50:50	\N	\N	{}	{Pt2gTMUkuhsFJQUrEaII,ketZXCkucf11zNgY6IqR}	{}	{}	{}	{}	post1
feoGtNEoQHfDYD4DA35O	Making a playlist for the PCMR Birthday Party this Saturday	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{IReW7fIyzlzkZ5vFYt8Z,P9xd3XK8HBHZSzICn4NR}	{}	{}	{}	{}	post1
TpswmmeORDk7x6YfjmgG	When Timmy came home from the playground and asked what flaccid meant, Brenda and Will struggled to come up with SFW visual aids	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{7YEtWg66n+SmrV36jNy7,DeNWI4zzsTIc6Ey+iKw4,FoZhZoGMS+B3zCK4jdOm,Me8nVRzTKOC0khHIIdGt}	{}	{}	{}	{}	post1
Am8ebcat/RSZisrFkz9H	Me and my hitachi IRL	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{jvqK14lXztC918YkVSxy,JO3NSV7jxaW+nIDFxMZa,D/pmz0t41p0DhxAO7Eg+}	{}	{}	{}	{}	post1
D028RZHGbY/vg6GxTF8g	Woman crossing the street	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{JfCkmBvnGPGICR+wqXCD,8rKoUYVwEdQXnZHIC6Bm,SCGDGS79CO301PIGsHzn,+QunQOJIIutnBZmWxfYm,icbxCxwjaS6WY3dYw1u/}	{}	{}	{}	{}	post1
fNii742XpZLFUrFrMjra	Teaching kids the harsh reality of life	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{cfVvue731ABWhfwwgvl0,RqrICVxU3DkKWITebaRd,fEa+e2pIqkh8eGslDK5p}	{}	{}	{}	{}	post1
OAj872OQpjpTQwsbaJUt	Taking Back Sunday  MakeDamnSure Punk Rock  0335	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{95xJJqqnEzNt0vXen2ab,81UJJrp5UK2zJmHT17wk,Yc4G/5qWynDG3fkz3PU8,H2whJDBxgKTjkE6EPiyI}	{}	{}	{}	{}	post1
yMhaF3jPG+xcBc6AWT1z	Rosario Dawson looks luscious	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{h2zaeCiLBxYeCBXIS129,brGhrePxenrQp1ij6omB,EO/mmVFesomDRWsM6B8j}	{}	{}	{}	{}	post1
r5hYJ4ncw8RlduUdaNQV	YOU VERSUS THE HUMAN SHE TOLD YOU NOT TO WORRY ABOUT	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{GJoElRheya/bw+IViX3S,uGgbNCa18MXYT3423jys,OH+cxmlQ1mwofID/nLUa,5sSfalNW7K3p1Aikdtqh}	{}	{}	{}	{}	post1
gTUQR1KB2GaOr+1lAKR2	My hats, past present and future	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{2o1zgQ0BPz1n8gj64gLc,B8N9de639ZzEymzDy/vT,/yGPfuwhZGTRgW5c+Eap}	{}	{}	{}	{}	post1
x8k7gwa028UtrRnWF8Ww	My crabapple right now	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{kLZZcaSLdnKLHCwMNG0s,WPxIMu+PVXezemm4Vw6I,MiQXG1PcHvTEoKVoLKQd,gw/+cjZc2bAummVo7Ns2}	{}	{}	{}	{}	post1
1ctb8YKUVQi5Zenj9Dk4	Anon witnesses weird shit	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{9UEDSbR6rXxdzMl+FTUS,M3IxykSXKomFjgeGJBJP,aXEDuYsrUurDknVTFfsY,nsTkOZT9ZLCvoX0L8+qr,qacq8eQIczCYUH4JMBa4}	{}	{}	{}	{}	post1
r/D+I2PRPOq/BdZsJPpv	waiting	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{a8PflIWtV3n7PO6mgmQ5,q6f99pQIPsJzbbJqKxd2}	{}	{}	{}	{}	post1
xrNVMKxPNxJUCayjMNYu	All life is precious	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{W0GYJrhov/hdDAPMagoZ,cjPMvAtcQUYSsykC2BXx}	{}	{}	{}	{}	post1
hQRuq8f/hgPLqc8AhKwS	Girl from Japan battles big handrail	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{pnwpXFmhviqQWiarnV7V,WyQfGPhJiQRDoyIQJOUj}	{}	{}	{}	{}	post1
wDRLWNMtGzfCRao1kUni	Sharks at Fingal Bay	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{mukYiitPbKfEcSAUlmpR,7i2e4TUmv+9IxGcROWrl,A8XEwKy3Mj+HmPwuRvYx}	{}	{}	{}	{}	post1
suaClrRcqF0t/3y6MPkz	Factorio 0150	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{MK/1T/RT5wsoLRdRlxzr,c4K7apCSDVDzsZFxAS2Y}	{}	{}	{}	{}	post1
1MA9fRHFqu3OlTUEtPrY	Self My Negan Cosplay for Awesome Con and New York Comic Con 2017	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Izlk/ztyclWz8BxqCEhd,rAojTvzh0pvzETqnim/E}	{}	{}	{}	{}	post1
90rzm8CmU5i6sQc09s7w	Morgan Reid	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{J6pSmbhrlhDD1rv1t3qz,/Brj0rFMMESlF76B6GKU,9rnLLuPNpqXqE10v3Fxg}	{}	{}	{}	{}	post1
epoKi5MTnaZX4epgkw10	One of those days	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{mDBhOi7LuCysduR7ZOYi,ugfsG6r3YHoxZO0PYXEu,YFltMHTQGb9FUOC7ROWj,L5hA7fES2fdRMHfOY620,PyO4c3HPMPGZQLL8THWV}	{}	{}	{}	{}	post1
FXBqK5/VD72osVdn9gTI	hmmm	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{u+cbb7AZdCqYEmn28has,LyGw1jcvB8M0eF2Fy7Yv,Ew2h3I5JsuC+OINUiaL0}	{}	{}	{}	{}	post1
/EhpeZGCZNebBG98d6+P	Respect my authority, puppy style	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{RUZhzaBenGf8a91qOcXT,4uunkzBh0+AvlX8wOB8M,pNwJATFryRCgmJEkw19+,eNZIxvo4iQrW+ffm9gDh,BhZWv5QjhiDIlEqz90eH}	{}	{}	{}	{}	post1
lbPRQGwEGVVX0tMaFqjK	Baby elephant Lia, helped by her aunt Kery	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{tyrLnjlvyiAn3l+RdttN,N6XKhMtxmFtu/jybEk/f,k+YrbMoeLkUsVhOqO/qw,K9rMKSeclgZcEY2Z+4ES}	{}	{}	{}	{}	post1
Rtk4hpi1RqA2quKlPW2G	Ad by swiss police	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{cleyhoS6cYhMc6Ndi7Dc,nw6Qs2znM1lqAmY4VUcL,VmmKOvHwoIZFDes/F+aO,jUaOeO7jRIZx4lt0JfgH}	{}	{}	{}	{}	post1
RmyzDGhFDnwb4qyN/AHA	One of those days	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{c6WZa/oL4+R7peKqwZHo,cO+4Al22Z4oMjpk0p7Lv}	{}	{}	{}	{}	post1
AmAEjgwBQXRIiSZgh5zl	If you want to face me, youll have to pass through my five underbosses	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{mz3NbHyyhsW0w0xee+ZF,HT3ZvfziZDLxH76qE49L,jPPbCGLKJrcTu2oZerx9,gZPPaC1PVUBccVdXOCtw,oL/yQIx4sNq4YnIzP9Al}	{}	{}	{}	{}	post1
IwmjgVG3LWbN7xiCvQMz	A completely accurate analogy	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{H0m0Yg2+nPcBGZ5W3bRY,e5ncY2in0xuaufewOwiY}	{}	{}	{}	{}	post1
4FmnQ8vDltvpfQAUAkPJ	People keep telling me I look like a librarian	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{j/umdhMUM8rmGDbBo2ru,249fUSyIu9oxY+tbgaGN}	{}	{}	{}	{}	post1
qNdc5CCjXwI+TaxPpsB3	Big Dick Treat For Hyper Cutie	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{MM6PtKAUVLR0Khg0Jths,+3Lor3ceoicDnKWBJHks,yUCpI5O40AIkk+mGp6JI,QwMDhV6D7ymbd/oF43Xc,0y5bywPtNtVHNZZHlB8S}	{}	{}	{}	{}	post1
CMN6Qx3UpF1diC7kH1ib	Met Alan Tudyk yesterday, he signed a watercolor I painted for my husband	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{KM9wGntchiV1TEdjYx8q,mCXOMv6RdHrmraAiwQLv,Aqr9yN2LvoYQUCv5KUbV,+XMn08wfyOslB3vjCIHj}	{}	{}	{}	{}	post1
3GyTGrhXYJ4CLn9V/LeN	Modern take on a rustic kitchen in this cabin located in Montana 2048  1360	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{FOm/XDD5cF5QNqCsjOho,+19rMElqncH6cynpKRK2,K9lkv+Q46PJ8KYgKpfYZ,zeQldJes1Iug17givdid}	{}	{}	{}	{}	post1
uAilmTb74J1YAhGlKvos	Lava hits the sea in Hawaii L	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{279WgqCMsv6+cBHMeQJX,cNJ7RVNIrwbt8ebpSufj,ipL1PS8c6FkHjdo0ck8+,meCOLulbg/wImdp33SVK}	{}	{}	{}	{}	post1
e4Zd4xL9xwgJasjMUO/8	My girlfriend sent me a picture of her client, Winston	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{tJK4sg5f4iRAkYjywPv7,Ca5sC0s6brgrZw5+af81,GRTiS9d1z2Gz+iQgiz3h,bj5+YQgIr+CiybXKR4mv,E+EIg1N483sZeIcsV7GM}	{}	{}	{}	{}	post1
iwKfni67D2UnHsByOeqk	Do it for Kerr	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{amdVb/GqbElptq2fd6Jr,I15W8CVit2ItxfoZeGHA,W3afwZu376Sp0o/+D2VG,AhucGW36EU489E8uo9Sz,fuO+x9atMcIHHj4YyjqZ}	{}	{}	{}	{}	post1
MELlCoAwXQXItCWmU0lE	Im sure its just a fluke	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{bsqnjlXUIu9/IcSV/QxF,1Qa8CWhmeuNVYRp5irOQ,H2MTz95t3nq9SyGQleHe,FTyT3YN5z8Lt0vhGYRQK,SNEHUVdrVbjj1/+Sc6vI}	{}	{}	{}	{}	post1
T/2Z1wdnNt21ziRUs22X	Milf step mom opens legs for step son	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Rjzct/ZKQmxLt3l0sDw+,1je8t9zjbcX2zkRuJI4l,SuZYprFulCHyPJeRNXZl,IkGwj0MMnVsmMdIlAqes,EG9C8CwpyZU9VP5sMOns}	{}	{}	{}	{}	post1
bhfRylm3eEYyXnEBV0Kj	Watch Until The End  1258	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ksz49huJOglsvvkCeF/R,cSyhCAnIJbQA6mIGNNbc}	{}	{}	{}	{}	post1
37Q7vBju5j4p/Qiby/3g	Attack commences in 30 seconds	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{M53XBHQqLRd+HB/CKV+w,h36KXivOhkDARB5rtq2k,eZu4QTWFFUcZVyXDgTyJ,gdeyz/KXufnXgQyBgLr0,Ge+m311k8vpSZsJMm3ON}	{}	{}	{}	{}	post1
DzUOlUNYsszexYbX9Tlm	USAOC The Ultimate Reverse of Shame  0149	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{SiQn9UPd7DhB0YsQBUrF,mgcEOb2uefKmHm1GJVMK,vdyOXkydoJi0/y+pp7yT,fEYfhO5OJblZXMjwwiK9}	{}	{}	{}	{}	post1
DpgdwnfeSqk6jVDEr46c	Oh, you	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{IZZnsKXIJW6zMVEjc5NZ,6gZRdgkSLQ22CP8bnoGJ,8lpqKYpcai2pxFa85MQb,UtKLeUs/mpSlwY/eZNrl,U2FaFips6fXqxzclp/oM}	{}	{}	{}	{}	post1
Rc9Pokueco+DyFjhkPpq	Lilly Ford Takes Massive Cock	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Kg/boDy4oV2jNkmkDfRD,7ETzTYmF8cQzJRPkjrC6,EQSsTKgGGWAdzTJxmV5l}	{}	{}	{}	{}	post1
lVg1zcAhUcbs0gLpcXpt	Riverbank in Limerick, Ireland OC 4000 x 4000	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{HmnCV9SgaoH6eUfStpfH,B3ucaGd/7/peTnMjriF4,DjC6oXH8UiidBIZhtIFO}	{}	{}	{}	{}	post1
+YM7zAEystclHZhUHI+W	Congratulations, rTheOcho You are Subreddit of the Day	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{xgd3TcOfcytnmZesLssg,zp7R+pmwbKZFfr64C/pI,tFlAQxOwubnt5UrQTvOK,eYLcbcEJ0O2JkJr/Xddu}	{}	{}	{}	{}	post1
BSlm/K3brY9BOBRVln7A	During the 16 season, DOnta Foreman experienced an unimaginable loss The passing of his son, DOnta Jr	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{R0W0RZijUt7exNzwkP1n,2lwFgyNcPzgv912XQ82X,pKKqBFjaZiTvuEd1pkvn}	{}	{}	{}	{}	post1
SBsVotrtu66V9CMdy4dd	Fluttering Faye	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{pd/tHqgK/UQIGmtHjD3C,gLShda+o+pHSzK6WyGTL,00gPgchm6nml6J+KznmT,WjKFj5/5coCo0/rHy+uy}	{}	{}	{}	{}	post1
8IfFd4SDQn7BEJNlcmAV	Michael Phelps	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{xdTKXBv2ahe2gH5NWItD,TzdYaGWI+iyBobo9nnw0,0iBqa/esqQ54KxBtjvYk}	{}	{}	{}	{}	post1
rqCjkOwXvXstTuKXITz6	Unrollme head heartbroken that users found out it grew up fertilized in the UK is promoting MaraLago on its website	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{FieZYYNtRcYxBQkzwQDO,i1HibY0XbOcnhqrt6O0K,rZcfZO7SJjxytMQ9Hadz,iv66p0Csb0fI1th/39rL,lywM0t49YsLQYAh3K0pb}	{}	{}	{}	{}	post1
30BwIBEo+MscPUXx1bId	Funhaus dressed up as their Wwe characters	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{RWMSEKGeUuXTJefsyWWj,i5u1Yei68/sYmiRZ+68V,H7t1CJu6S+Rfe2Z4ccw9,uwvLAE1foAPnX8SJHw2+}	{}	{}	{}	{}	post1
MNKD+ha4kRIlVB4KZg3e	New Android Messages adds ability to add people midchat	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{VHMhTJTIO+PO0zqDe5h0,FrowV8nRkYZ7zBA/n+jq,OX3D+KfDO6DSKEeiJNsI}	{}	{}	{}	{}	post1
fCFXuni4r3phDfQtGE9e	When Reynad counters the quest	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{A3JCZifpYKa7dRCieU0w,0vEJ0UT14/Y5IY60zjtd,wKkCTmUTHSz/6jfCuGxb,OM8k/ngM5gBYRdYLWTZZ}	{}	{}	{}	{}	post1
pSI0Aq8pGfn+3ovvusbW	News Pangu Jailbreak iOS 1031 on iPhone 7	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{+r/20GCkhl9qnDEvb7ci,jBljRod8UgtJ+IKl6cQo,u3saLpvfE6mS7xNhQrGb,0qvg5nHjv+SVhd/hQ9hp,GZ/6C6O0Nd2XLR0Af//q}	{}	{}	{}	{}	post1
F5R6Nlcc8dIbuOtHLmAl	I forgot to buy bread 	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{GSC2bTOiURjDG6QRIf/C,n3T3Ss/c/yFzyi3EnwQw,bKi5O3uf7CJWAW5/H3hK,Whm5Oj0OprzyNwRODvE7}	{}	{}	{}	{}	post1
Pi1WJRlck0B2Uu3WV5mt	Its confederate memorial day Lets celebrate with the only confederate flag that matters	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{8kHwXKzmUKEEuoM+ocvF,wYdnHvMfXeySj+MuuAfw}	{}	{}	{}	{}	post1
1Fuuc0ItfmiFbsZcYc//	Does a beer in the bath still count NSFW	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{6NhtISJgAz9HexsaTKuv,i6JEUXaQYRmdmly43kqs,u8PIl9K2Ga0pCydIihpj,xO0aGp+rfUbcCEwnVbCT}	{}	{}	{}	{}	post1
W25X3lW9EAIv9MtQh4me	I made a GIF to compare the world map of Zelda Breath of the Wild to Skyrim and some other maps Based on data by uHylianWarrior	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{blDtIkqhPxTveQk7CJFy,/BXTTD93A+Sjen9UUJxl,xuhz9re4boGnnbeukj8Q,4MYnE772QHhlNl1SySyQ,uBVWtQ+s/qIycn+Z6/lv}	{}	{}	{}	{}	post1
ypLy0yfg7xspHcFe+aCq	Member when you saw this and actually thought you were doing something wrong	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{7eoEOX70nUvPrvWcpI/L,G20bWvM2iy8dOTvVkkBa,P0Nr4FjS/JcWcTpB27EG,E2f/Xnxib2+/L9gmbYft}	{}	{}	{}	{}	post1
G/02ZcW33qaWaxiM5+Fm	My sunflower tattoo done by Rodd Diaz from Lucky Bird Tattoo in Annapolis, Maryland	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{uS7Xvx5BVRWpf1ZZ+XJE,/7+Hdtdx138U72PWNt6x,aCJe2Ri2pr3pdSR/uydf}	{}	{}	{}	{}	post1
vAZkS8QPrcDtMw5o1MS9		f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{e7UBspuOcPNpJPRaFheI,9I/O1W4sxc2naKIEPE0K,OWacP1mcp9OVfnKIygxs}	{}	{}	{}	{}	post1
5ne/hkZN9VlPEonrPwYc	Blizzard Is Currently Working on 3 New Maps for Overwatch	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{PGbsKOqfuUnpTBz20m5/,3wR/EMeRZ1k4kdou6Nll}	{}	{}	{}	{}	post1
0y7YnwAXjiXk8HUdHw1E	Let me give you a hand	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{a5HoudDrpJiLCF+ge0iu,gl6wi0iKppAWsgfqPN7X,c0gqM2J2B6w9WdHgmV6b,hFYqPcZ3yAbqmYHjHXEv,AENbpHdWlJdqZWzqo0uB}	{}	{}	{}	{}	post1
B7fAevV3J5shq9LZU80N	Someone at work kept touching my stuff, so I left a note	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{imPyKMa4t0EN4BSIgVl/,jqscksc935GNAR+6yD27,lmwRuBurWm+2DtAo7Fsw}	{}	{}	{}	{}	post1
ke61s5CpqYjIIWAOeW5i	Creaming Hard	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ok4ts1vE0bVPMsaDQcbw,Xf2agETEswlbgvToI/ID}	{}	{}	{}	{}	post1
5hGREKNihF2KzXWq+HWi	Velour	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{60Ufp4zRFMS586RCNDjd,1g5I4ZjhAg/4sncqkLrh,nLunMCqu09b/uuvLsitv}	{}	{}	{}	{}	post1
Gdl0Z2TWZxlFoa5Hivrm	woof irl	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{zrlOkV9GaNoCoSM2vrt3,hl8R4O8RtfUzPuKS8/TN,NXTo5VQzJmmD4ki01sZM}	{}	{}	{}	{}	post1
5TfY0LRjZ2+LNXGrf0j4	Boobs are fun	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{X2fc6ssB9wJIsy4rtH1M,8TO/gP6ewNo6zhfoaZnz,BxPggWTjxabGzttrQFYv}	{}	{}	{}	{}	post1
RNjg4BGiEg3yQri5yh54	Nichole Bloom Shamless	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{wYoxZAqA1qFBlWHM2b73,jto/uyOK++1u1Bb/AOQh}	{}	{}	{}	{}	post1
7lMCD7HY0vYTGgaUV2Lr	One both cant what	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{d9eKWswu7sLwYcbYD2ki,sDIuWGSzW5IT9/eHO7nP}	{}	{}	{}	{}	post1
oV8VM2b8XUdz1PKYUnh/	Before After	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{03R+/W7jJSW1f55koRze,st08o+92Yxo8b1FKApEq}	{}	{}	{}	{}	post1
noJgLUV1hnfx/0t3gvaP	Goddamnit Barry	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{nxEo+kYxDdt84G2U8H60,ZucfFYSkLUclJfdIf3/0}	{}	{}	{}	{}	post1
WEnpWBr7Km73V19/xU6n	We out here boys	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{G8GJLhz+Fhrgd4lDFB2E,SbfJqPVEfC6KQRXXUECk}	{}	{}	{}	{}	post1
Pcw/1YKdUzzJGCF6I5wD	After 15 years of hoarding fish I present the Fish Museum	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{8yULJzBC5tcjnc2/mi/s,sx8TRCQUz9DMNaaMzPER,xvBK9kXO2v/3+ft9Hl3J}	{}	{}	{}	{}	post1
r7re5G873EEj5mt21Uoe	Angiogram showing damageddecreased vascular tissue in the index finger of a yoyo master	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{c/tgZiwLnU96NAhJpiMX,cowfUk9jZGzxo38SE1EM,AP92xxfVYtt3G5vpb2km,BvH8pobQbEsuuZUZVzFi,rLjFCflZLsKB+bUUoHbf}	{}	{}	{}	{}	post1
3wL1s1/Ku8HE5CgISX7O	When I was your age I only made 6hour	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{2ZzWsN2ncHKg2vh5hHnC,eDw+eNuJrpV4goHTmJKc,8ExwU9xCISNnan4FXeNt,V0iIZGG+BPGggX9F+Q2g}	{}	{}	{}	{}	post1
It9+V9XyWP0DUQQAmDGz	John Get the cement truck	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{TOfq81ZnKmESa1/9ONVC,qAUuU7NjGqU1+RHK17Rn}	{}	{}	{}	{}	post1
9Lm4ehC9uq+z4PHZoPGl	Also can i see your boobs	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{4k5SBpeWliKHhknEVT52,Q99n7s69verREMB1FRjr,a4I8N5jxumrCG/YEdhb8}	{}	{}	{}	{}	post1
GdsuYQmmf+KF1Qk2zFVM	HMB while I finish this Wrestling match	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{66n80Nypxd4ZDF7W1OjJ,BAyuM5S3rYEfAouSoT2O,AzRNC+tdskzCcZJo2u5F}	{}	{}	{}	{}	post1
OcSENzY89YL/kaVxjVm8	US Gremlins 1984 A man brings home a cute creature as a Christmas present for his son that spawns a horrifying army of devilish  and dangerous  little beasts	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{5TlcjLnWHbcH04sHeuo3,IR/NzV0xsoPKU4aI7A5f}	{}	{}	{}	{}	post1
SOn/5UePJyI9tFyw0dY2	RutHlEsS OwNEr RiPS TOngUe FrOM PoOR caT	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{40aGpsf1L2t15ZxfSxH0,hRX9yrsR2rDaw0l7Y0DF,joTzJWjqHmRWVN9B02Hq}	{}	{}	{}	{}	post1
iYlqVN7/0PCnWNeaT/nL	A weird place I found while exploring the forest near my city 2448 x 3264 OC	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{1l7HJO8uU02CYc7lzCvO,ctY7MCoXFLDkT/2PvYnV,tv8bGkBRxCj8kOaoBQvZ,Zn1QuytZmX/RtYb8JBH+}	{}	{}	{}	{}	post1
w6immwaZ9hsNUWRE2z16	Attending to an annoying cellmate	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{97dCQ5JaSLgN7rht+w20,V43r/V+RXn+PRWJHS8YN}	{}	{}	{}	{}	post1
dS5zsb0zLP6rbksyOwp0	Trump boasts of highest TV ratings since the World Trade Center came down	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{fEXcJY3LTpK7U3OOxmoG,aJBugS05d+xaNQsLTCzA,2TYt3qFT+srVtWSlseFa}	{}	{}	{}	{}	post1
tcah/OliB/nPR/KU/FFk	 Just a lit touch	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{DsWn/RZBJyYng+TJAHst,A4xoScnSCsJi6F1Y/tUi,xjRDACsg8B01l9tYieyr,dthREtcRGo/jV4VTiMyP,DB93bWP1qLAsrzCHcotd}	{}	{}	{}	{}	post1
J78Y5U2YyfU9Kgw+3m3+	Open shirt	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{99ro3dX6s0WRFC9HkjgD,jy/DJYx5d67N/bcLYIYp,waPsxP2PdGFR9VA1TXKq,xjuQ+e1FHtsLYSHA9SFM,mbXxfKFipwEpLZbhEkoA}	{}	{}	{}	{}	post1
rOMcnQ6NHOL6jLI4ksP5	Chef told one of our pizza cooks he could paint the walk in door, this was the result	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{BTLz0B2MDfq+WydSu4Cz,ENSSRxpMRBK8gYrM7+to,BszlR5bSQg+R4GwX+d1s,na6I7Rq9SF487elP7CIa,SFUnWcC8nAKnPTOFje9V}	{}	{}	{}	{}	post1
qSYZk+T+UUvdsPGqZKA6	Scalloped corn with snake	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{GV9HiZq0ofqW87OiJ4/n,LWT8as8uyjvanJzKS4xd}	{}	{}	{}	{}	post1
oW+uHFo+0wBrztV7u5yu	First time posting here, hope you enjoy this clip from last night	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{1RKocMk+b8ScOGTd5ISy,j2xuvBN8/AaBy5aVF403}	{}	{}	{}	{}	post1
4cepSjfZZjoPZ7XoBhHP	Took 3 refugees to Disneyland, story in the comments	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{dOyI0aPtg470Q1lE7+Lo,90uPnOKKl0IohIQ89xu4,yyZV3q6+6NFwws2P0KXv,LyVDTDNzJugvR5NS6TOP,92IL6c2vEZU0ah9bbHlK}	{}	{}	{}	{}	post1
jDaJkPoABLYpc2XoZOSS	SUGGESTION Players who knocked down the enemy should get the kill, Not the player who finished it	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{jKpvPijSXftRFMqa4cR6,mYIdqV3PMI7Fg93T4cVU,ecVHhk/hV39wlXv5Gbh2,5CMwKuQGlh6Y/TeTfy4D,ezQs6Kid3mQzMTtxY4bP}	{}	{}	{}	{}	post1
Gu6rmhUDAvOXySQ1i99+	Salmon Cannon Xpost from Gifs	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{RESvqQnefhAkKpY3nBs6,8XHCX7KYar68LkfQA422}	{}	{}	{}	{}	post1
opiv+xPgg6MFq2FCVGFl	For honor new map leak	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{cBsS9l4VTFg6wzCHtb7/,xhjyliEfKCsOy6J1ga3I,FaLsWSqlBkGO4TFIWsPO,K9n9Q6DsF5msiA/kHQQr}	{}	{}	{}	{}	post1
kjiMj23AWZv3MZpaZ+GV	Noticed a peculiar coincidence about Frances election map 708 x 473	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{GeANBrWa91kEvwL/DpFl,68k9HXV8xZddYQwAI9LL,j9DhrpJO74JAzZSivUQv,VLWzLNNP+X9xQXIBtHMm}	{}	{}	{}	{}	post1
qO2DCoUGcx4T46CYX3Hf	f On and off	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{OsDDIp/KEpgMNxhiBxAV,KMUY+ewH8hrlztY7xvAA,5KaQpjVRv1oRog3YSreY}	{}	{}	{}	{}	post1
im68qDXZnQxfTNTAb0cg	Wax worms can eat and break down one of the most common plastics, polyethylene Their digestive process breaks the plastics chemical bond, producing an organic compound	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{VBefTCLRv2Pltr104uXo,1Rb4kn64WDRWcQ6rZYuj,TpsAT2JnQqPZvnXiGZT/}	{}	{}	{}	{}	post1
PzUQaEXjTuyK6HhipV7O	I got banned from laser tag today	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{A1MrB47vhCaL+Q12tnEk,FjWnB6a4Jna/stRrNUVS}	{}	{}	{}	{}	post1
4PynPgsyCEAiE1BGjGmE	The meal for kings	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{L6v1ujgMfvs24pTCpza4,+WX59z5S9pjpcVzGUbix,JMqtn8Qr7l3Np1qzxMu1,WkjJDPy7j/IjJoubY43s}	{}	{}	{}	{}	post1
Dl+3gibdyaFA9M5jcc3+	Saoirse Ronan	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{XF1ogCDk+3cqLk06UX31,wWtC/eu5iJNWejzL/GBT,MhXMfkotgy4W7aRiRqHS,PoVnWrTqybzWV/1B3DeK,vyaAM14LNPM6KCLLKc2g}	{}	{}	{}	{}	post1
RCNHGWVzNUypSWbbMc4v	BotW Animation comparing the world map of Breath of the Wild to some other games	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{OHNdWHWMvFIFSLqf2yAr,weh7WBH1VYohhGPK3mNA,ffJ5BYMp326zeMPHy9KQ,rD/LxL8J3mRp7M70iXBE,T+ZwcUIxtXZm0gLqEG7+}	{}	{}	{}	{}	post1
kBmTBAtF04d018cSOd6V	Amidst Backlash, Ivanka Trump Clothing Is Secretly Relabelled as Adrienne Vittadini	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{TR0aXBXlx/XfVXUoxHCz,w/xkPN7oVVxfFqflHuge,F+M3ckBq81eY3LO1TDQN,hEhXN49n8Murw1GvFRrr,Lfnmx/ZrEAciZziTuqVC}	{}	{}	{}	{}	post1
epToVAs65GfRK5IPM87T	Modpost NMD Lanyard GIVEAWAY	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{1zZFol5Rb6fNBc9sSZ0N,pM6MgOAQuUglnj0MWm4v}	{}	{}	{}	{}	post1
MLqhPcFbAe8nEIC7jcTK	OT One of the most beautiful racecars ever The Bentley Speed 8	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{/Mdavxj5tvY2KeD5UjDS,K8aNtz2i9EWJ7295IaCl,UrlZgNjgeaXJfP7Eaz0I,kJMi0W3ic8oweGoWH6R0}	{}	{}	{}	{}	post1
E7LTtGDjrbMV2na8Xf7r	WHO LIVES IN A TEUFORT UNDER THE SEA	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{FfugyRtQlBIjTEcDXesI,ehUiOH7VeCohMgRxkEhU}	{}	{}	{}	{}	post1
3cmZYcR+hE74XsfWiNjU	I LOVE THIS SITE	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{6ge29s4ibHFeD3RtPG4K,iE/EW/A49HBWo2dz9QhA,wYT4pLQTKHlGKL7QT8xl,n1IVa8fzp/4Az+zAncHK}	{}	{}	{}	{}	post1
/yHf7kZgBtaeYkpRauVK	Delicious goodness	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{qg5B1xuurbs0p9+0gU6A,ohlVCLGOsb0UTLlQB8D6,YPTlNJrppp5sRnInz5NK,TU6ZyAuNOwHShLiTbqD6,egjvugGSd2FQ6G98KZRx}	{}	{}	{}	{}	post1
rI/ioSq1692GF+II7QJT	Arin, you gotta cut that hair back down, brother Look at this sex machine	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ksMSd3BKZer1/VVJSpPs,IMSUIkDxSlXXj6uSsMjA}	{}	{}	{}	{}	post1
7fpAjnqgvgim9uOUCpOM	Do you want ants Cause thats how you get ants	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{L1S8PkMt7qpC4Sdp4zC+,4HNPHIX8hOep08putKE+,ZYyurWhVnBCbSNQ7f6Tc,gcmgpkjaM6wMZZsbimJE}	{}	{}	{}	{}	post1
OUXekNWDkMDjn6VidOCj	So accurate	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{4zCNOcV+63YyZaueLtd5,WpCObqxyifIVEsaIg8uP,UnW9Qsg9kICdC46En3sh,CCTl4XjdeXkzZj140072,9fiIjD8vVHbddD6DNa7y}	{}	{}	{}	{}	post1
H31SnYmpYR/rlIAJoton	What song do you listen to, to check the quality of new headphones	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{P9+xTKZD3O0CI3DIAqKE,GvvMIAfZ9PqudNPHxfFk,99GmrXpY8JIKLu2lfse2,41RUGvRA0vEP+ery2Bde}	{}	{}	{}	{}	post1
3hkeSfHvHoeuiXEbbppA	Lava hits the sea in Hawaii	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{3qI7pyKcbgTpFih7fjZD,oXl/48dZHs7ba1BnfMmB,Y8ZRRstSseJATFuX+5zP}	{}	{}	{}	{}	post1
Efn0ZXmQQHM2csE7lT2L	Hot Latin girl and her amazing body get dicked	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{nAHe8fnQTki9gg6o5+u+,mZq7/hviUw/GuwDTlayD,mxd7mcVXXUiImbMwWG5/,7NgM4BUNIqbrVEGbj2Sv,yxySx4481lDgOhQzNOvr}	{}	{}	{}	{}	post1
nX9Dl0ZeyLiXiKO7EYdE	Someone thought this ramp was a good idea	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{tZRZOYWgkXaMuFEpcO4S,phq69E4pj6/BiA7E3I3Z,3uETbZz9bkE5qiKQkhf6,rLcCBg1O/n385RB+9AAT}	{}	{}	{}	{}	post1
iw1PYpVdDWJhaYFiUfmJ	Im not in TEST, but I crocheted a uCymek dino	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Bs3vELuPBCoQjCGd1JDR,qlRSTVJeAZKennOmnRIE}	{}	{}	{}	{}	post1
oJwS+ChHV31ZxmnvRyLH	Indian style	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{7srZTVYFxWKvFnYKGXZ6,c9Z+ss7CGff0PSZcR/bU}	{}	{}	{}	{}	post1
G4VGkYaV7birSYRbEZkt	Former Mrs Orange County pleads guilty to possessing child pornography	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{q7k3Ve0NcalOLshNujNU,tnzdAS/32acJsgjM3KIU}	{}	{}	{}	{}	post1
Il8B8/6HlXYzQkk7c4oi	really really real	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{M+K0G7oZ8vr7opo1DKr2,/A/T4/xtsfacQ5m0S+SY,LV5yMKvQWcjnODkXkKRV}	{}	{}	{}	{}	post1
SHGmDrxzSZN0bxGqjWrP	Got this just in time for Kiev Go big blue	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{9LrSbnaaTz1gvsnK1zeo,ogi2cJ3pYHWPiKdumow2,p16SCufiUkcaDpup+zoY}	{}	{}	{}	{}	post1
zir3Xihafv6fFOgN+7oS	CINMIL Eric Thames hits home run 10 His 7th against the Reds alone	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{LJzpNxmFToD98u6Z6xU7,EAZnNtKDjVentYd8pF5N,YcR7KuKznRYVzoUSlf9j,iEjVUSFgV1GlaVk5g5L3}	{}	{}	{}	{}	post1
wly1tmIwh3MnlmyBkVWn	me irl	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{1KWPKYDzASCRdcreLhHg,VXKTIF4ew/XhYBYAzkAb,Tc0+oopUhj4dtIJbSmyq}	{}	{}	{}	{}	post1
rMyid2BKanhr6Ip04p4f	Blue Eyes	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{BzGn0rDTddjRXs/S7eo3,FS3oPfTYYTcMZG3SjzDu,BVQ7k3AlMbtl0T2G0AKZ}	{}	{}	{}	{}	post1
cdgMRFBTHjh2+YQA5K0C	More GOP politicians have been arrested for sexual misconduct in bathrooms than trans people	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{+VGswIN5YjvriB7txgKN,XWJMgfw2eQd59x8gr5ha,UxY9WO6tn0Q9RgMAiTNX,jxJnR2ytY9JIwuv4aMBM,jFsRAWKzrsnpERxpBA73}	{}	{}	{}	{}	post1
TBfShKrtDSTpdWtjzaHX	Maud	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{MmCcHVC6yusnlzLNWv1K,BCgoxJfOiWKGuK/q+Yah,kXPUs3aLSca80EQ8xBST,cDSw4FwwL254QukEOeRz}	{}	{}	{}	{}	post1
kbB/H9iyJ0aFOlYXnFjm	I gave masking a try what do you guys think	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{1dQgmWJGX8EyXvzJv1pn,FnRy8aayGyOJfDuHO9pb}	{}	{}	{}	{}	post1
8y4BTF9k9ge6fZOBU/fX	LPT Always let a dog sniff your fist first before trying to pet him, then scratch under the chin and on the sides Never reach or stand over a dog Reaching over top a dogs head can be threatening	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{AGDYZObtLnp3LbQXcYZ3,E2+/x8RvXyZs/AIA462C,v8PFe4/bN/+zQMupaOC3}	{}	{}	{}	{}	post1
MHV2N45I5170tCyqF8VH	Ask Jeeves	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{KJeOY43n2JFVf7cEejvt,RyRp3gxxAAEjTcvWYmLR,8xpBxUMm3iJeodP6zrRX,ZZ23+HZWVml9UATHfSuC}	{}	{}	{}	{}	post1
JXXjP3p9+2zvuRLVjrS1	Dont vaccinate your kids, you will save money when they dont live long enough to go to college	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ldxyxlAMxepH0Udq0Q4r,277t4lkD3bdaoIjhGzaY,f2e6tDbswQdJGA/f61Mn}	{}	{}	{}	{}	post1
mFbNmViDpjR/kFfiC0mL	Anya amp Aaliyah	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{d4GS3e94yUBaHBUT0G5I,XE4iN3pB98wF2FmXZMIQ,yR9KYRDm8DVRh7EVHXUm,s5QTR6GNm5MfLRljndBy,nyQ5a9sr71HtTuaYveEx}	{}	{}	{}	{}	post1
fZABmEr1loM+9UGJHfjP	Ashley Alban  A Few Inches At A Time	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{L43LBDL2D5C7duuLMmiG,3/hrdy89h89qEojK2/7R,KMHRoVnN3AQXDAVzytC4,/eQAWK2DPbFzv2ogtkA2,dnS5C05I9bNU/yXLmNVG}	{}	{}	{}	{}	post1
rQjQbYVt6R9tq9q33Kh0	Getting Split Roasted By My Boyfriend And His Virgin Friend	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{uuJ8qZsKq/V+ROUVtUJw,DnGcg4/GO8yE9MVy41j3,mrWolIKPdpp2ISU8RFQH}	{}	{}	{}	{}	post1
XpNf5i0UcdaaBXIKEhcT	Yes, why dont I upvote every post in rfunny	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{A6cbWYtulUsW/OFbtmp3,FOF8DtNuXngOfe3N6Uif}	{}	{}	{}	{}	post1
CSjeSw4nrRJMO9QqYohD	Be careful who you call ugly in middle school	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{y+u3kxvACeuZpXxaGykQ,hLUYisr1jLFBn2abqW/u,DfMZbqkV5Od8JzjaD4lT,2DwqP3sFLZva2/phOHS3}	{}	{}	{}	{}	post1
vicnrIDeZ+S3BmlRRf4O	When you get stuck in barbed wire on Battlefield 1	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{am39DRZpaBph8jvxAdKa,Rv/Nd6BJQbMjPi1GAt4R}	{}	{}	{}	{}	post1
ukZPrMn23AA30qryOIlR	My first attempt at Unicorn Cupcakes	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{G3FhLIWDVxWoQybr/EAN,+Jeh6DTRkyy+75Ny8uY3,55XbUP0mMejPNbS51AJk,BuLVVzxfTndZnTW50oMM,Df/rxZx7xnZITTryLQlz}	{}	{}	{}	{}	post1
QNefNh8nB6OjhGAjgmv1	overwhelming response with the last one, heres another Brach aircancel	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{tp+ptio4x1+SvnzMaJKh,MyRb9AUamQvV5oOB3s1A}	{}	{}	{}	{}	post1
MCFnBgsCJuoIGwB5BfNy	toomeirlformeirl	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{sXxiLhRgJNRx1PwbaoTO,Bkpx/Xpu1daTnt4JH0hL,8H63DhGEXlREZZU2sG2h}	{}	{}	{}	{}	post1
ONSFH3XJ408919tyRHQE	Got drunk Stole a random street sign	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Hxdi0TpcAgUczKmbkUJp,pRNb56gbzHSUE8piJTjP}	{}	{}	{}	{}	post1
5P9K7aBmAS6CUeb0m2kb	Looks like somebodys got a case of the Mondays	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{KqV4vc/RUZlPe/4ej+jK,E0w6M5ktSfh0I5F1/Ls3,HFAIa70pbF/bAl92ScI2}	{}	{}	{}	{}	post1
zqw5IrJpj+TXw2e0kIrl	Beautiful Orgasm	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{+OMe9eFauDYuSZMFaalH,xER08Vpbbjx0WMJrxjVL,xAhlg2t+c56VzC1P2eYy,q6j4cp0862/87bdYriEJ}	{}	{}	{}	{}	post1
NHpdc/KZjW9u2yHp9hT+	Uber cloaked its spying and all it got from Apple was a slap on the wrist	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{7vDmvtdwqkc1Tzgy2QAx,nW/VHjRbvxfPzXv4vGtR,ZL/yX1BsdYmInZ+cKQWo,rfGkjpcZtG2/TsruQ/PV}	{}	{}	{}	{}	post1
CssMNy8lEi+icRqGdWTJ	Thinking of you guys over the creek in NZ today From an Aussie	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{yn676hamd78RQQhXJxFI,17ZLqKiwOnVCsshw8o6O,cXiHw3UmH0ubaPA2EvZO,OhXElES/8PFvCUSdC/Zm,RyJguKhCVjwRY20z8Cex}	{}	{}	{}	{}	post1
/aJCdRh0I4xfGr90oNhM	Selfproclaimed sociopath and sex god	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{JLWjwy/Usr4stYHaDk3n,Ia7oTqulU/m60K+1G2RY,oIGZ+WyfWECymaJDYSjE,wvq+Xm8vi2dAro/E6jMH}	{}	{}	{}	{}	post1
gFACGkEeaEUSsxE5uNT2	The most intelligent man on LinkedIn is looking for an equally smart partner xpost rIAmVerySmart	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{wx57xHzY/co7lLl73zRo,1KSh8cZ3T7YyaecOCReo}	{}	{}	{}	{}	post1
+qvxrpY4NjzEfB1iABFA	63 pics in album My Korean War colour album WARNING NSFW	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{4qZuKxKn29XGlEtVKK8G,P6Bjjd5PM2p5DiM93YL2,i+CGvcziT+zq6aKryYfp}	{}	{}	{}	{}	post1
lRXokT5Q5bNbg3sUf56u	Never change, Nick	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{gBmxvQAMCLqL8o3ZbkbV,AtbfswLYhz/Bjblok6wx,6S0SSo5gPu/SWHfHQctQ,6CGZi/F7QX4TnhHl0x8z,64eRZ8su7iehh3RrkiRU}	{}	{}	{}	{}	post1
KFw81jBVeKzOHvQyZ+jX	Why	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{sLJ887kkeQ3mtsrbKwnW,S8/eH5TbrFXTqru6KkwH,1ZSH/hVMjkjcBLdGnEfL,S4HVsNUmlO+Ftx+MKkz8}	{}	{}	{}	{}	post1
6mBCso8hB9II4KLPgmi9	DONT CHALLENGE TIPPA BECAUSE YOULL NEVER WIN	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{AgTezsZYtmWc521+dGCV,YNL4I3qUuoAqiP3iH7ks}	{}	{}	{}	{}	post1
hvT2qrj67N55lyujGU5r	The worlds first vaccine against malaria will be introduced in three countries  Ghana, Kenya and Malawi  starting in 2018	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{VuIZb6GB9Qsn+T4ZLIha,kWyPL3skTdbkLtGC50nx,zdVfcjtTdqgGm6KiHtrI,+9nMCmQ+fJ1ctkrWZ3IU,pgEyl/2BiTNoXipZq2nX}	{}	{}	{}	{}	post1
mkHADJK7ssgDeFTAlffW	lt number of people who want to see h3H3 open their Patreon back up so we can support the hell out of them in this trying time	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{F8B14s7ULzXMeNJen3c8,3tzLAiy+AyewIXha7xlx}	{}	{}	{}	{}	post1
1K9NI6uOrHNs2V9QSz4K	Heath Ledgers sister clears up rumour linking Joker role to actors death at I Am Heath Ledger premiere	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{b7fmmFi4+HdFl2Qm7RAE,lnICVHsXzSIuzLQXPXyV,QpLja7nJSTraBpX1AOBI,z4WT4Uk/RgV258cxv3jT,5I4pPAfrWogUk/8I7POZ}	{}	{}	{}	{}	post1
NzSnKMGSe1qFW+fFfrMI	When you already know that youre going to get another Emmy	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{C0d/ZQK20RAo+R6AA8k5,iXJiokRpVKCEaA79Nya6,ZGdw6vqVe34UoaJzgW/p,mAHAvXmCfJXb0qFNFqPz,nt/64cVRyVqibvTXLueE}	{}	{}	{}	{}	post1
qc3VP65iUopl/UIGI42i	Flying is a skill which comes natural to snow leopards	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{dswnDRHd9p8Lw+/FxGeu,kl46q3oSJMn6e5FYqmF+,9TS5+K9XxkL4oxsWgAqb,yoKTLjD/4kNlZ/7wtTPo,QBL5kK/gfdWzB02Msxo8}	{}	{}	{}	{}	post1
Ub/sXysP22nn+MDXBePE	She wont let it touch the ground	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{bHEtV5DdeV02Ftzestc/,0WZZZj2FS0grN15wLx4v,D7TmbpFH2lvkeOl85bT3}	{}	{}	{}	{}	post1
VyiEGsnkNytK4YW7dF1c	The Worlds Best Chicago Comic Con Costume In The World	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{P7HDttWgobPjqBekn7uj,Fislm00k3IFHwhPwQmn0,6rqF2hw1FZCEGxYpVLRC,66xgF645AOrrW72URtvm}	{}	{}	{}	{}	post1
Nt1n/jGh+g9CSFVeZFwt	Coming down the stairs with his prom date	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{M1Ol8JeLqexQ8aAO4blp,mCSNu6zJHsiPUbxqYHWJ,zpw+kOfvGVc7Tk5Ajhvs,otHMVM4QxbDKdCL4Zd/w,n8SltPgyMiQS5zSp7FyN}	{}	{}	{}	{}	post1
KcxbhjqNxwK3sDm7fNDD	Meowirl	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{cJHibq/XatV/fWOXn6+b,4QicQYlgqAG0N0m5YvU+,vfbsdY1OUeqXVHbZJ24X,yx2WnItnKTmlrSJkOn+W}	{}	{}	{}	{}	post1
smn3EXH1b3UgW30PEXIS	Weed legalization in Canada	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{TBFmC4p+6ix8r8GKMdeT,WuM2FBDK4jiu1weJEHwI,WdMRWo1kvOw78DOK0kc4,V4Xz3fSFweEQhEDNL4ZN,djB68y//1Hiv2+QLyRJE}	{}	{}	{}	{}	post1
rMCVBZsp/pS2KB+aHHoM	The mad bartender xpost from rMorrowind	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{YxfyRUk64g0gCxj6Bcsi,WnIBBdvQkU32mqxmkj72,GL+cIWJjkmNDCIDUgy+K}	{}	{}	{}	{}	post1
MJ0LwHcCTowW4jJbBAfF	Massdrop trolled me again I think	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{qkIV47ZzEeBTuAZqRTqR,ZoDcNiy5PHQfuPUCxeim,prZfgCN1dbQsT7kyEKHi,DIw2SkSkvskeurenVmJL}	{}	{}	{}	{}	post1
VBHlcHQF4aYRjQ1CCYo+	Train Wreck In Paris, France  1895	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{r9Ouhd940Dchdmq31xxj,92Twq62mVi5qa+19qjid,SwjB0q/J+LI4nfmdTnbD,J+lVv/GddCXlMoIyo0/r,anNdZYr3I3mDOVHJgjQH}	{}	{}	{}	{}	post1
Hnc6d1cgHlwRPkHJzm+L	Irrelephant title	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{0JHAFjZlAhs3p+KBAgWr,sty0zVyq27pk97NcAXeV,EkN2w+MeLev8m35Jg2vD,lPQc1bT8sCRKotXEISWJ,rJiThynoNC4mUj0tVM5D}	{}	{}	{}	{}	post1
oqH7I/342a8ecO0ty6fR	Fuck Tammy	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{/aWjvBXcABtWsvE9Xs4F,IH0kgWaOL9LhS9JZVgW7,KZ2afDsB5Gs9PWVXV09C}	{}	{}	{}	{}	post1
GkgxT5AlO55VPbcQ74CW	I actually agree with this one	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{9gjCs7lLPsIHQ8t0DL8B,ahL3ahwtzka50muOcJQE,fIVtJbgizoqJ28UYyTcx,BVMCR2Pt/peXCSfG3a29,PXd+Ed78AFe16snxsEZu}	{}	{}	{}	{}	post1
fgitB1bKB2fA2EOY/0oz	12 day old beans	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{v5QyYXuqSqCGAQnHmGXn,Qd4C22kLl8GTyZ+9phpr,jKBRoww4qEftIUTQmzR8,uYpDoXMuSpZUVRI0o36g}	{}	{}	{}	{}	post1
eoTUy32lA5l+k2+QZfQQ	A clean, modern, interactive periodic table	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{5GSSUTf+ZsUd8XER6U+W,QUisy0ixR/qlHwDOrPb3}	{}	{}	{}	{}	post1
bbV0S9TaH41W5cUUc/xR	R6SiegeBroken Legs	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{z2059fSKJAovxNJV/guG,XE6HNTivgPk9rmrOSeHE,imENEQ67XCsKmFCH1xHG,14Zf77gVmGCZLLw402E7}	{}	{}	{}	{}	post1
ReAH5yJ/ylOvxgZ+wV0+	Showgirls Play Chess Backstage at the Latin Quarter Nightclub Gordon Parks, 1958	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{X0Zt6iRymSPf+qfRXIKg,TUzDNqpfERuxkWngZJ/d,S63WwGMd4oflktVUPhNG}	{}	{}	{}	{}	post1
TFeRXPL2Pikrpj0xB6lG	Register the  symbol as a trade mark sit back and count the money from lawsuits	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{teq6kgdUE7+P8GEorHwJ,I+bcA+jAE3j4m8MAbCUu,ipMmePeYpxeJQvgHFkpo}	{}	{}	{}	{}	post1
o+xN3I/a5Hv0i7ik4bDY	Begging for it	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{wu3seuF5ybnm9fQxD8Zw,NL/bjsm7XRmapQMK3X+4,erQJUQoTTTzhljbkDuz5,zfaHT5+dEgRCNchTvA5/,6VvTJt2LNHJWETgXZpjw}	{}	{}	{}	{}	post1
qI2FtRNCwudROWOOJZlq	Chef who is a fan of Chos fixes her a free meal	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{JSkd4wBZou7u3vd/E5/q,YxsVcpcjumQiZ9YjFG6C,oesU9wrt0Bzj/IfQFcvU,7SL/APVlsuQ494dvrPPf}	{}	{}	{}	{}	post1
6L/5GjyMuNKl9DMghK9+	Please dont recruit anyone Explanation inside	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{kj4h3XszW6oFzgxuCOIl,fLLo2Xhjm59mUFZChWxr,iqAKg/pZHEQErmZ5x4ry,Ky/l7cVCSsik8WvaDk/L,zOQCMwsdpYWxny5wPUWe}	{}	{}	{}	{}	post1
8M+uHwKEP9zUbXSEbjrM	Girlfriend wants to show off some more What would you do to her	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{21h+cjPpXcXc1v6HOGjw,tqiy/b5DBv9QFOXZsa8B,CAIYnfUZ2LWaJqQ7VWF7,CX8/aTYNlL08n06iQ2q8,13IstolT0oGrMaZ0MexX}	{}	{}	{}	{}	post1
Cm2dJYfpJkrJw4SKD3dO	Heart shaped pupils	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{MJvBg+2uqvpcP7Ptvv8b,kAqjTl9XZqwz/0o0gCui}	{}	{}	{}	{}	post1
fdzah3/A9olQ1GKFPVue	Blep	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{9SsdYWwUGS21HmQ/n/gB,RcaIlxgmfTylWdbBqEtn,RgehqDCDE+teH5uA8VoQ,o21Ct3f44Pq+zOjU86yM,CNOJVDQssAPx0AVF2jzE}	{}	{}	{}	{}	post1
KDJhMSnr1eiypx8bJOQY	Package from Xbox Design Lab came in, introduced it to the fam	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{pQ0YwzU2e/bqBOcweH1X,gIQR5aiI6euhbdFFLEqG,fwrRMhuKswWKbFX9RIe+,BQ+TDMqgD90VE3R2cXZg,vgAFPz8C/M6CLpE6tWVe}	{}	{}	{}	{}	post1
LODAslONfvPu2wITGZoJ	Saw this in house listing What kind of refrigerator is this	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{0zQWzrvMdpdznKzsHTmQ,mjmOYsEO80qztYQS8F78,ySWO9TfnTy5tVY7AMyt6}	{}	{}	{}	{}	post1
UI2CoZVy16uWrilGL82b	Thanks EA	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{xexUnP4CNmzWsOwU1ynJ,adxRJisiG+jn7xbk2giI,Qqkv4upBeaJpTWuye2Kr}	{}	{}	{}	{}	post1
4T2/FEU1rk9EBkOM4WS/	Tims Saving Kuku	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{8Toe4omRUqyQDaQLFZ1i,WD7Z7l7uf0qr34YFm+m9,tGC+fb0USYpbQx9jl2HX}	{}	{}	{}	{}	post1
wwzNXoLPLuKAWezxNBlD	My fiance has kept this for 22 years and will finally redeem it this weekend	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{yCZgn34mWs+XjW2b27cQ,rS9M2APRyUpoDrJkE2sJ}	{}	{}	{}	{}	post1
teHOEl79foxJD3bAW7yN	Perfection	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{VPL9Stw9HGu52mCgk+zm,tiIwNPn2qH9ucjbqqiD1,4uONNdA/6CCejwE727LL,8Jk05XMgfu9Z5KyxNbrK}	{}	{}	{}	{}	post1
SlhDoNTgLWqltUSr4Mw/	Caribbean Jerk Chicken with pineapple on Jasmine rice in a pineapple bowl for your Monday Homemade	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{J03dMvZuxzoNaHurJTGq,04lYKlyfVLngflVpPBAJ,/L9c0L7fG4BqapheHPQa}	{}	{}	{}	{}	post1
VXcjJXfnlk7KKrAAVuuu	534 days and counting Astronaut Peggy Whitson breaks US space record	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{FWRYeMs1pM2LvarbP8R2,MaaBamBpEWFh740wiXv6}	{}	{}	{}	{}	post1
BWY0/0m06DzvXxK+8k1Q	Bills declined to match twoyear, 64 million offer sheet that RB Mike Gillislee signed with Patriots, per source Gillislee now a Pat	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{UFp7MikhNcRs/SFv4FBv,hCeVxGK75oR8Az9R5BV1,7eA/SNVPkzifbReZKXiQ,eOuR3ggHUjA4nVi+7Uzd,NWvDOY0Ou0jKGxq01Lou}	{}	{}	{}	{}	post1
/oUY19a2GQFVOwBcOhKX	Hot Pink	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{dqiP5HbY+epQaFpoNLQz,Wkjnm3nJ4smZXO7xkGz0,XqQnJrYxxopnAGgGmQjo,V851Us+79ZDRMuMGG38F}	{}	{}	{}	{}	post1
ws7Gu4Z4ogyANRcR/Pqu	MRW Im the only person in the choir that didnt know we were going to sing in a higher pitch than usual	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{FO5qiWd7YjpYLTxPHEqm,p8Ssr1cSzKjIDZXuGlva,yZNODBpoIrkg98BHx1GR}	{}	{}	{}	{}	post1
kGFlLfdoEcyBGmUjYl2B	Update A classmate of my daughter 13 sent her an extremely sexually aggressive and inappropriate message via facebook messenger and I need some advice	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{UZPUQRjOEevwjBCaJ0ga,1PWC/ohDc2H5gWss99Ij,sjKt/5+CGDxPKXVMgK7W,CaVQI50oxBu3ruOEUjZ+}	{}	{}	{}	{}	post1
pSCawuMEdLKVs1vFuSzb	Eliza Dushku To Star In The Black Company Series Adaptation In Works By IM Global amp David Goyer	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{OFDtLQzpxxhotQz9UXKq,QyfYLS/ZaeMTG8TNvpbE}	{}	{}	{}	{}	post1
7pZJtQXHPm1RcCN7zNdR	animeirl	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ZjpbWSfztAn05wX/NBg2,G8/BDHM9GX3xuV4T7X51}	{}	{}	{}	{}	post2
JFyRiRsMtvSDilgBvCJH	MoTHEr oF ChILD FiNDs a mORbId GoRe muRDer sitE aND LOveS It	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{W5vzJOZwUtJmXcJOnX/z,yYlEgwaoZFS294yjNogs}	{}	{}	{}	{}	post1
z1RXieIeobPEinZ0UBIE	Miranda Kerr	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{JWrUbIHsjHv6hFGTinEb,nLi5kD2skOARd4IHfjDe}	{}	{}	{}	{}	post1
vig5tN7rbCDvgPyZmJ99	A mod of rCringeAnarchy and a user get into a plugta about a Jewish scientist That mans name Albert Einstein	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{lGyl+JEVd9bcHGm93o6P,e07PU1VFZ7BTOJgBu2ON,ise5Yx7G9mN4JMFcYe8a}	{}	{}	{}	{}	post1
HjTXXwBTFx8XPyM1k1jt	Making fluorescent nylon	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{vIg9uGR65h8RQy/x6guJ,STTcxWewAXZtqohBvMhU,PANTzdQFpbL4/Se8l8h/}	{}	{}	{}	{}	post1
KRQ4GarJX8r+Hr0vT+QP	In 13 hours we will find out which nations have qualified for the Overwatch World Cup	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{SFYNLMoNQfd4GSH4hyXQ,DYPKg48U8plIFgB3Txyr,GxfI7t5kgAXf9ohTodj7,UskYsA2kR0Zt6MOwSYvP}	{}	{}	{}	{}	post1
YQzTnDdAtc6eW+V5kNlM	Karina Elle	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{gwxnV9hL9yhY2IJH77RY,bxhTbO0j2WgH9r1/U2J5,XzEgzA9XSDHEFPXeQP5S,BBu/prdpsEoH8k0xw1mn,3yszyvj9/ATEGo2JxmZm}	{}	{}	{}	{}	post1
g3E7JHmvJBhrStjDU6Kg	My thick wife	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{r4u+7IZTgQXyFp7ztxBg,p/CqfBu+DisIv1oItLbo,AKng5V6nDH3wN48xHA74}	{}	{}	{}	{}	post1
uPo+ls/nuLTv/aiymjpc	Rohit Sharmas midrun tantrum costing him his wicket  IPL 2016	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{BwBnbiDnmQOvXgrYpLx4,l1Y0FFgw9bncPUFupO9s,At940wg0BcYk3f5tJh2K,qY2LMOCJACdOVNv8T8xC,CLjHJKeQqoWzGE6xAG50}	{}	{}	{}	{}	post1
8DaPh3gvcQcTmLjQw6lz	I found an EVIL planet Extreme, lethal atmosphere, covered in giant predators More pics if you want em	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{WmhJOeXRkWZhKyLIpWEq,074ur2ZBH7VydKiuG3Y9,pNnpiWcYBIKl2cnKq7lV,maK7XmSJzf+ClBLuuATn}	{}	{}	{}	{}	post1
xFpV4IKIb2U1avAPgBEw	Bom Dia PE	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{SN1QzRhPCjbzxd4pxV9/,4ob87P9YAZrOQSzxpAEc,JOz9+pRfD5YFP8VAC+xD,g6V8dhyh7pdLZyGj0gFU}	{}	{}	{}	{}	post1
/C0qISaxJZxIMn5rVJKD	Quite a lineup	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{k6XPpx1lnTOXRqMlofHI,JvvioL+962Om/I/cESVZ,mTXrswnWZVweyQVwYs1F,SETIBUc9CJjV/t0EcD9r,/3UiGa1aPzTyKu5eUO4c}	{}	{}	{}	{}	post1
pAicfBcVhCd/NLtWSuOC	Still one of my favorites	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{TlcaeT/HdwLXVOwnBgSt,Hh5ybQr+O6LhSDtamfMC}	{}	{}	{}	{}	post1
GCLUq70/kcl8o7wTECso	A chicken gets to fulfill her dream of flying  0108	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Rd+lZtrFkL+bh+8m8pEw,8DkaLaBqQI3hrU0kcWEQ,DQxh91JHBdcZEYGSKFQY}	{}	{}	{}	{}	post1
Rb+4vnuEzJHMz4oK5SlP	Anyone else getting suspicious about Raw Spoilers	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{uYtNCni1s6deG0SbRHhc,cj0sWgzk0N/jVQ5UyN2L,TLDmHlIChd2Te4vTzXQC,9UsnGLuIRzDzgcD9XdIS,rkfR3k2TJRm7ykk9AKja}	{}	{}	{}	{}	post1
D2KQneMYD4jvQu4rhiVU	TIL that angry Birds are quadrapedal	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{K18Le7hA7MWnJgj1julw,oDFDa32AP2N/Hr+m5In8}	{}	{}	{}	{}	post1
ymsMzngU1IQvcDZCCQto	Countrystyle gatekeeping xpost rpussypassdenied	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{qXSWLRkRdn09jui0QxRB,ZJkNyyPAKKLlYzIgkSX8,ORJZnelYsmxmG6smZWhD}	{}	{}	{}	{}	post1
JiKphT9AsRwm42Va3OvS	KONO OZYMANDIO DA	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{N68EP7xLF9zX6x//WHpt,KKPWa26cQzqp2ayUSsBk}	{}	{}	{}	{}	post1
V2J9ZI7uUSGISvPAjYfO	Hitdog professional displays his skill to an unaccustomed target	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{PYy3cNl6qRI0wWtXCU+x,Jb9VDQJ4InkFkqx6djZc}	{}	{}	{}	{}	post1
pUZS6bfzCplu36OTqd9B	Poetry How to start a protest at UC Berkeley  0022	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{XfRqCvAIy2ZYGOK86+AH,q1XX6KqjY/A3qb7dvTLe,uhsrlgp3tNhVSUmmMx5i}	{}	{}	{}	{}	post1
WRHsfc/gnVgXyDsEdIOn	Generous servings	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{O0L3pEiS0dAlgnw76sPs,U4nImHbH6x6VtFekvYeo,xB9azM5I5F3ygUvRVc96,8/G+GLyk60yd3NxmPLiY}	{}	{}	{}	{}	post1
FJ5r92gjvOd2d0iUhZJM	Something really strange happened to me in pools at CEO Dreamland	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{MMCszdOlYGrQU1kHJuG4,TSs4McmKRxJ98JddUQac,HJMm8eJnCZNbIEzhG9in}	{}	{}	{}	{}	post1
SUG1SDEbNmeTtzMYgIiy	Building a Dobsonian telescope with John Dobson himself 12830  012831	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{bRAY1H9hpZak4V6F3iQE,niR4GDi52A3sewnNlUYr}	{}	{}	{}	{}	post1
a50pTP8E49XAQh5LJUUl	Used my Green Painted Endo as a Green screen	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{8/q4q0SupxldItzsIRcJ,bx0GzyxvT7WdE0wBhvLT,DTCQsmqXC1EFBmJN0rdi,iOxp5U2ZU3PnOPx7ECFl}	{}	{}	{}	{}	post1
WL8anNOZoBM6m6mQAXZU	Salmon cannon	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{zY4Vh4++cYh4o3WTiT0B,6JWmIBPYt6SQR/0tGsUS,hA1jeHIMolY4+fhSMAkW}	{}	{}	{}	{}	post1
2qz1cQ23UnhdcEBw5KiS	For the Love of God, no one cares if you were Banned from rSocialism or rConservative	f	\N	\N	0	\N	2018-04-12 15:50:50	\N	\N	{}	{oNIAMXlITBJDt+mC2lrY,XWYotYa9W1/Jzzq3h0MJ,EmL2xU6bINKMIxGyvtU6}	{}	{}	{}	{}	post1
1qE101biu++LikStH2No	Jimmy Wales goes after fake news with Wikitribune  a crowdfunded site for reporters	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{TyX7L9AFPEsXVpgebpjO,P7Ovu19TVJLliABdABfQ}	{}	{}	{}	{}	post1
clX6Pr6Dseqcg6rG6R+p	Cute title that catches your attention F	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{rcPZhr4ZmnW6gZA9SK0V,gpsbHsmV173rUMPpG+Hw,KZxoUBoCsg/7/3Hcblmh,XWD8FfhQ6oOZ6ggGHxLN,7RZz/1kZzf8JGNx+xzGr}	{}	{}	{}	{}	post1
hqQHXHKP5BkW4sO5RoSV	perfect boobs	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{f1W1D5RTNUTxq/tH53MW,rkMrIGThO1N2s/eCGuFQ,qfFS78Xvv/eA/USycNRc,hKpzmS8Uv5fOl9TB1XYP}	{}	{}	{}	{}	post1
b7mt8ZygJxJImA1Jjov9	Mike Bloomberg, Carl Pope say jobs come from clean energy, not coal	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{PsNhPDC6U/U3Hqk2PK7j,hns3N+LwqXCT9DssGuHO,B7Oz4ffXUK7TyZAqr9MO,o9ZteWGVNOILvwbXkypR,ctXcZ04xwdEVyb7vTQey}	{}	{}	{}	{}	post1
R3+Kafw3nB64d6cNtz6p	Hearing Is Set for Sanders Supporters Suing DNC	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{GaHV461K0yzy6fKSRi3h,VCsyob9lsAGHxZn3qAQh,9o/hpnxsqFOleCbAm3tu}	{}	{}	{}	{}	post1
NVXJ778lSXzucIhJdTQn	Star Child, Part 13	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{PA6AU50NqKZTV/2Fy0e0,HNA0NfkpUaddB7jM5wgb,nJiAcXTSVhf771yk6t76}	{}	{}	{}	{}	post1
xpU0XMNhwEaGm+pal9hc	Science AMA Series Im Beau Lotto, a neuroscientist who specializes in the biology and psychology of perception I just wrote a book called DEVIATE about the science of seeing differently and am here to talk about it AMA	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{sy9gxemBv0a4fEiLx4KY,RJqiWr189mBkTFW/JQ4y,hpj1m+5wszKBTa3MbfOt,1pr4eXQTKvkcYYaXg14F}	{}	{}	{}	{}	post1
vAJ8Et17IvumOjMTusA1	Fernando Torres  Five years ago today	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ITWJEfRk02MAiFYwLCrv,DKhKqoQRCnXgC81kVl7U}	{}	{}	{}	{}	post1
KlH3+Uce7khqB0/Nmq1W	unsubs	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{hjEftvYaKpMYx/FzQtyH,r0+NIWHHYsnALDORI2vH,hmbxE3ROb31ZjoacjyQ1,rml+DbJjfz7lhB65lail,I3ckAna1ePkGW0D+4rE1}	{}	{}	{}	{}	post1
BdY4jNLot5Qg/el9YDzg	When the pets are just too good	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{DOCTiMMLNhhoeCIhTtIW,l4MT8svpZYMrqlgb4vnO,s0OCSeVeTAq+a99qeZbN}	{}	{}	{}	{}	post1
FuFsrNIyD5fyc3cn5roA	Noras New Style Mojojoj	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Lxt7IgJkaBrVcASvMIv/,hwMkSivmBgjDaEZrF4Fw,93I1/qnKAFqO8oSp65sn,jPb6rhAIUkVlkEuXljsa,3zd5GrvQ2zJ1zD+pg3Qc}	{}	{}	{}	{}	post1
3Y2+ssPUZIBhL3DLNgtV	Testify	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{QdUrmCm3wH9ZEni5kwNH,9Me4yWquWcaOf9z+s106}	{}	{}	{}	{}	post1
bLFa4S8BjWZFHzr/ii8E	THE END	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{4/G13aeC21kGV3HSCtsP,J1biS3NASb3pFxhWK61v,uSSBP23Ni14w9q3wZhGk}	{}	{}	{}	{}	post1
Gu4LTbW72m9jLkrtyTKP	Classic lmao 	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{QjwPhrpfhxzHF21aHCSU,ucA586R9+4hmaUaa/4KJ,42wDRSwkyX+r6ALCYoHD}	{}	{}	{}	{}	post1
ocmBghNxWckrZ4fTlhuk	Its nice to know the Glorious Fire Nation is using the superior siege engine	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{/9iGILcGgXVihi0E+S/E,oFjT7NBUxsCoWGd6uAvA,eZE9wVxCuoP8OaNtVkRt,Gv4ksRNhX+pi3RIiM0V6,z9g293HjzewpDOY1QlYN}	{}	{}	{}	{}	post1
WJZehi9wbya5WdtJ6jmi	Eleven OC	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{418aRkkDbESRmkC+ij8a,SvklrR/69h1NEcxeJBPg,qkrhB2/YvaEsvpmbDW0I}	{}	{}	{}	{}	post1
2CdS4rjMjTjxvr5jDXk+	My Nama Je	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{yob82uQtzbfzeIp7VZEq,6eAysucKzkCY6BSPhUP0,PC/+Mshf2rMu74+QB9qD}	{}	{}	{}	{}	post1
Ce3gHT/m1USeJFR0EeyX	The guy that pretended to be my father	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{h0D3gsCM60zC6A+VXo9p,kA3mStSA8Qv6qihlMjjM}	{}	{}	{}	{}	post1
BTHuAqP0IFDIVsnnrF30	Hot Wendys girl NSFW	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{2c039bstyNfpFcn3Q5j2,sO6Hri2OUyFWg6eQP4Nt}	{}	{}	{}	{}	post1
4hbbUkuC/FIrOMWSLs6A	Alexa Pearl	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{lrmpz17P4P4Xh63mtrxC,+EEQR0tXSKuhneb/PkKh}	{}	{}	{}	{}	post1
Xg63oCrDld8T7hrSPaIr	someone come snuggle	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{xjGBb3eM5RCizi4ZMRZa,7dL4QpILy6/cSzZlDSG+,hsMf0v5XPdhiKRC2+hIn,FdeQovOCBNsHYmspMRm0,gpHLhe42rm3DwPN7IpEN}	{}	{}	{}	{}	post1
e75r6knrluXB5FEMmWvj	MeanwhileIn Malenas Bedroom	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ONnYpRl+V/zWd1bhEpIk,uht0dkm1DJfLXz2gwFwK,q89s8KJtdlVY1WmqSVuh,QmFhxXyLVjplLcqjLf1a,5LJ1c/v13h9M46OtH6i2}	{}	{}	{}	{}	post1
PULCBb6TKbdhkz3E++On	Opwillem voor dit chocoladebeeld van onze almachtige koning	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{iMrlku9LPSHTiyFsaPsL,U9i6DnAyJKxtPWXtcpk8}	{}	{}	{}	{}	post1
nb4xmYvuBqr33jCsuFiF	Alicia Napoleon, Professional Boxer	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{mBAAFxp4nA5QTL3zYMNs,Ir2Rd+2GiCF7mNt+OTm4,yFNfHZ9cnJnu2BZxKyLe,rzjsN5dlCaPzX1lcF/MC}	{}	{}	{}	{}	post1
+MwnavUgUpUHkc8af6R5	I made a friend in the garden the other day	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{K55d3wyBVVZwUEXnbImw,9q9vUStzjkWIBskx8rFr,M47lr6TKu2bJWc/G82tN,S0VHZmm3hTSk0VFu0T8C}	{}	{}	{}	{}	post1
nC2CV6ncpAx1FtfkAR4c	Despite Hype, VR Investment Fades In Q1 2017	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{5CZ7I0Jh3Lm080/NJXXG,58w/wDxp+DFB6vKIGE6h}	{}	{}	{}	{}	post1
pW/6IftIOg2Yxz/0lIqn	Making Copies	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{nGtQTxYUsptjT7KRXa5v,vKyY4X+AefGh7mK/bp1b,BONd+wxQ7yfhIa2tlq0n,8FDdXcBg2To7YwBrvmV0}	{}	{}	{}	{}	post1
77Gx6+xBsHiXz2UMbrGQ	5050 Until Dawn cosplay babes touch each others asses for fun semiNSFW  Gruesome leg break on trampoline NSFL	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{0XgHrsi928Eiu9Oj7Y/G,wYwRqnNbEkdodRcg3CdD}	{}	{}	{}	{}	post1
y2hro2q54RQ2b1WIX5xN	1 life down, 8 left to go	f	\N	\N	11	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{fckFhAcEimvjdMJVYmkH,Orpe1P5tcfallIFjNAN9,e3SHICDe7TDzQzURNPiQ}	{}	{}	{}	{}	post3
RruT5++9Eso47ZM6jnyW	Photo of an enthusiastic Adolf Hitler, taken moments before ending his 6 million killstreak on Call of Duty 1945, colorized	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{WAa04hLTHGW3Suc1mter,2DsgSyjWigZ5zpd6i0We}	{}	{}	{}	{}	post1
JNCUf59fexGE2RtFdeFl	is fashionable scarf no is fashionable snek	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{FEHUX8qEV28tB+OXjU3u,6u/VT2Xjym8rxgJteyCD,e+etIBr3hA4qzOTH1wBT,irg8OzmlOzRvwWh0FowE}	{}	{}	{}	{}	post1
wr8mAVWTJaU3yB8njUzX	title	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{9iIsG0O02l3GPbXaJpeQ,nkP5Sua+3p/SJhZpU1Lm}	{}	{}	{}	{}	post1
FNAtzuIkfq9ApkrdeNFM	Taking her seat	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{f8TEvXCtfXjksaiFNk4h,90zUckMJe+YTw3fGz5kx,P9ISNBkaGHExlhNJ73fK,ibGN/GezgXhusXQyTTXa,bsiZPRBuglMUihS3eLHF}	{}	{}	{}	{}	post1
sjjZCufqioecHEPOpKIP	Tight amp Tanned	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{jUGOQ1ewZKFlNf9A6Fzm,9ZlxsojwjKSlR+oUCooT,2r03VyZotGqD0Fd2PJvV,apU/nSewBT/zqVVM1slU,z3VyZeOwzKB1cNHHlinA}	{}	{}	{}	{}	post1
hMU/P36hWfY/xbtIpumu	Your balls are showing	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{QOHlia/KqNNxPWgriv+o,21yNlg73AVJd02LAZk4v,bvQ9u1+AweLtB6ODd/nT}	{}	{}	{}	{}	post1
hTGMbTZe/Oalm1bkZ9nT	They say you are what you eat	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{a5TwSAlS5RIAX7z5UsYj,rAatndV83x5qVqHExxD2,94AFH7vh1shuAeiL4OqG,s++RbWknl4HbUu5i32ds,P/1eOG8HVgnh7AeMmcnz}	{}	{}	{}	{}	post1
Vhi0Pgnt0f/iJYVVqlDV	HYUKOH  Wanli  0513	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{PcFYljdapiKLr11f/Jn3,CFTpt/6r4oON8DGjg/1s,/nBscHVIxVRfSR7uTpdb,wkR9tJYNMWAdfGM5uEjC}	{}	{}	{}	{}	post1
+YahB8dn45dWgxbQKPo2	Why bang doesnt have any new disciple	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{QNXbkeax/Zfe8G0ob+6I,10RH8v0vjg1b4PGv93lM,z7CMt3ZtXdAFIU9cY2wo}	{}	{}	{}	{}	post1
iYBjNh82z2SK5H9M/YPK	Cookiezi  supercell  My Dearest Last Love Yukiyos ver HDDT 9839 FC  675pp 1	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{d81d0nrT3HV5DqmTY3JR,CbQvZp8+z+gubsMdb1Kg}	{}	{}	{}	{}	post1
jwiW/EMbj3+22e/vuJBF	DVa getting fucked in the arcade Yeero	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{YnAJyFiQOTvo2lWg5UWq,uyxcTPyJRLPSd32bOnzT}	{}	{}	{}	{}	post1
mFOIH3P8dCL9gFunJoMP	Lest We Forget	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ET6boKxJ1+KlCbCEr/2U,DLk3YJMfthA1U5lYPsoW}	{}	{}	{}	{}	post1
oP/r2lZmgfki6Ta0nW5V	Texas is such a better city than Detroit and heres why	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{BIE/kkIRWDGEapBJL6Ti,NP2RZNuVG6EszHwlfOlq}	{}	{}	{}	{}	post1
TmA60eUk/eSPAxliVWvu	PH My dads house is being taken away this July due to being unable to pay the mortgage He is unemployed and does not have any form of income	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{KdxoCbnNMwnWIPAy10JN,VHKHhG0VnzDYCMNbLOlx,NH7j0lr7labfux7NmPa6}	{}	{}	{}	{}	post1
Ej1dsATXZFPrH1nNKhSh	Custom Westworld cameo in new commercial  0031	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{V50OejEa+ioY0WXHLTPI,X6qUTsOM/V7+JWCTCJnX,X+BvZol0rqVPnLtjWrM9,W+dlNnaUdIgwERfmyFhc,qwUZvxmPy2xkR1gMJqR1}	{}	{}	{}	{}	post1
oIkMyoKnCCuqeejyR3Ww	How do they feel	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Z2dqrTLoYt4e7UhuIuNK,KT4WSvddbY6w0dbYkIJT,KRzy5SbcLagHmXKE8lT1,NLNJp6SpMw3woAIawknI}	{}	{}	{}	{}	post1
USG2aFuCA3eXVKAwFdSB	TCG Exclusive XYZ Tornado Dragon	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{U1M4i7Pso6AgvDolr4tQ,HooGajsaO0ykx1bUbVBg}	{}	{}	{}	{}	post1
9yF0Ru6Q+EqjJF3Btl1F	CNN Opinion Berkeley has become the most intolerant place in America	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{cVbGW5a2Todam35EHjeU,rWdb822KVZ33mYg6mUN+}	{}	{}	{}	{}	post1
bfNEf7WaxhTBCSyrYFGF	petite body under huge scrubs	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{afuIG147ottGoBLZZINR,aUxdtFfuzCRT45qXXNe4,5VMsPbiv2uEoEzduNzwS,Gyc2SacZzsuSNZrkjNNs}	{}	{}	{}	{}	post1
Brm3g5xATmBROWbeDzev	P120 Malakhit Target amp 3S90E Shtil	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{bT4JCcUTFviCTfAIGRFH,ZpfFx8HNgYDogoUBmD05}	{}	{}	{}	{}	post1
kt6cc6Pmh7UZGMv19kTY	So I saw someone get arrested today	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{lcpm3USmoWQeObeT2CbS,s7psg3ZRieTeMBNwlpAq,OBIxGY7/lV8n08kZyg3M,rIgF/YdFztQKpfQT2WPo,EMDAfc+JmEzQnlSXTmr0}	{}	{}	{}	{}	post1
iB1yVx7wL7vUVWntNT0O	Im going to steal my roommates cat	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Ljib1LGaiyCOo+Mz5TlH,3/XF5GTCWXXiTOvzon2E}	{}	{}	{}	{}	post1
IEaNOQ0FdwgajKVrJ/pt	DeMarcus Ware Ceremonially ReSigns With Cowboys To Retire in Dallas	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{AcKPHlK7QFBDbyPzRFPX,cepjIsMLZ/Y+Z6UsvntO,pJvb7Ymr9F6Uor8e2U5o}	{}	{}	{}	{}	post1
kOfIDrxpMkehDzg6h/Qy	Im 31 and wasnt allowed dogs when I grew up Meet my first puppy, Broly	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{3RuBApCvDZhMRkHpOzDM,AeFJ/Bf6ShAoDPwztkbj,ShaoHdKyBb8pkormKhpo,10CBlCwuyMwFRQ2d/UdD,5kXBUGLC4sNBMyo9Ju91}	{}	{}	{}	{}	post1
eSP4HEKPd6KnUKdXNgi+	Lana	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Ggt3tzlTUCy2Es4gOoEJ,B18YDi8yiZsrcE2frUBo}	{}	{}	{}	{}	post1
n3TJfYvA/O91macTa+aZ	IU	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Aee5Rsl+I3DX1VU9/SJT,vL8H3zUg1T7X7yR2BroH}	{}	{}	{}	{}	post1
J9/bsP6mcTr4HIaK8KJC	At 23, Ive fulfilled a life goal by purchasing my first PC	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{F9uLYH6kgI5p1nz6UYBg,YpLMxctTzhq3V0afc9fg,L7TzGJGVeyQlbeTReCLY}	{}	{}	{}	{}	post1
VJxONa44CnuLblOXSHHA	Portland Trail Blazers Appreciation Thread	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Kz8LbkykR9g4zMlp/xZa,a7xwzs2EH0jTy3zn1F07}	{}	{}	{}	{}	post1
zaG+gDxF5/Dqy1LKpOsH	Theres no way, right	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Qe6fV2j6eGbxqkeLAkYK,Bxh5QzhCa9xQ7XKTwU2E}	{}	{}	{}	{}	post1
A9NvltJJdnsQMPuPbtT5	Tight ass For spanking, long hair for pulling	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{tAeulETDjzWigBlkzCfT,fRKs7NTe2ha6qilNS3D9,YLfMPf3tJc4nLdkz0wfX}	{}	{}	{}	{}	post1
uFBXmkHI0ztcqHAecY/i	Donald Trump announces 20 per cent tariff on Canadian softwood lumber	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{8sjodg1cLSnvW7aJ7c62,wwl1N4fJ3iyEo8iG02nU}	{}	{}	{}	{}	post1
O2wDntI78tu+T7NYV35b	Mayor Kenney Pa should legalize marijuana like Colorado	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{lEYB1CE6Lu44i650sS6w,Nygt/1g3cbQk1V0YKnJ2,dhdYxCFuGLXD0e4UWoRv}	{}	{}	{}	{}	post1
at2Ldk9Pzrwqgc4PXVdk	Found this day one when the game came out, still relevant 4 years later	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{6Yl5rKwc2APM6rq1M+ey,EBG9o3m2yt203qB/8jEI,2kS+jDra/pXo2PQIBNCZ}	{}	{}	{}	{}	post1
35DOZvz03Fh9/vhxaZ6h	42 Yards No problem	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Xd4UJ8B/zaUNUysH3a4Z,WS8R8Gpzz1GL4JGc0Nfb,jUcAeBvRtriegyvz5oCB,dYG2WwxzGmuqCUjITfwc,5eH136Q69TcyBicWlrRc}	{}	{}	{}	{}	post1
i2RB16CZOdxMbDrWP8JC	Ronnie OSullivan asks referee what the prize money for a 147 break is after potting just two balls He then goes on to make the 147 in spectacular fashion  0856	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{T5q73CPMEjI4DcybkfNs,rsO4kQSYUpj3xfOcgIHM,QrkbOzE0t1UpvQLjRH86,wHhYbFHxP6uklR0ueZmi,M3t6xiiS6rbgfSWej+IS}	{}	{}	{}	{}	post1
+KFq6H5gE2G3XNzN0WFF	China, India Become Climate Leaders as West Falters	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{I+FfR92Ug3IcbXMyufRM,xu0DRQKAfRV9uHhywsI3}	{}	{}	{}	{}	post1
9iLudLiowiDb3PU6lfMN	MRW Im joining the military because I have no idea what to do with my life and I realise what a stereotype I am	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{iSEkICHj8DCiiAODXwnB,By8aFUynwEV0QiXV7ry9,S7xzCvI1dAChQne+HzGg,wPXbAbSisHpGkT94gvz/,UpfSJ27ZAIV0UVT6QIBC}	{}	{}	{}	{}	post1
B3S8oAKMAM59czAQM9Qq	Cum valley	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{E4WHAfR9IkjvaTpbvJJY,HUHLiv07UIDyliZjJHLQ,psGp2K5JhBhpmYhVwQzb,tkHnPX7O16E4dm4WSK7g}	{}	{}	{}	{}	post1
vWIB+YBZMNy4/vxnNCQI	What were you doing the day you realized you needed to buy a strapon	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{DDt2Wax1i+e8LI6J6qG+,lwGV/m3fe5RcBuEhzVwm,WZ/Dp89842GDRlx4AcAI}	{}	{}	{}	{}	post1
jthlSSB+N6sxxq0WFj6i	Old Man Casper loves his dad	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Aq8IWqIDZHLq01DwaTvW,E/0pxpc+e/cwB1PDkA39,bJCw8kSWDsS9YBU+bSE8,4WMecNd5FNEEbFAGCwRr}	{}	{}	{}	{}	post1
Aue0ZMRucYCvc9Nc+DwM	Every parent should be so cool the world would be a better place	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{eDy8Wm4/5SdkWIIY+W4A,7Dv0HZ9ZMakLQgoiS3X+}	{}	{}	{}	{}	post1
bFdyWo+XvwHOl7sZINqH	Visto en rpoliticalhumor	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{koT10A2q0ZWxYQa3SBp/,tU3OXYCqE5DG+IEMDk/k}	{}	{}	{}	{}	post1
r8nUQ7i1nq4g5JCxBAV7	Unexpected item in Wilko this weekend	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{rSz87Cy2fANvAKlgsm3k,xbDXhTWOkp9gTpj93Fdc,twFxjuZELM8tCGmnVkLJ,Mv0fnug11gVestI0lnkI,aPAQp+a7TBaU6bdIFCY+}	{}	{}	{}	{}	post1
va+dgTyi0kL3dIcgn48J	Nico Faye is red hot	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{u9bMXX2y1u+hKlMxEv6X,VWZYOywfq/pSc6DyTzxD,ikOGP8a3oNafww6/c615}	{}	{}	{}	{}	post1
N2m0kYjYefC5EaE1TKyU	R2D2 is almost here	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{k4aMhN6A1MYOkJihSaNL,Ee7uLDfG3IKf7WX7cZJh,cXrwIoBhpSSVpp7j02Hk,leHQSRXCRt7gyu0XJsTa}	{}	{}	{}	{}	post1
VOc28aaxQDAYO8y6JV6h	Thats just brutal	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Sz4zmSk/twLDkEEeR576,YAc9x0tHU7PagwDPMYV6,qxiq6QbKAzWN/2Cxu2i8,wEMEMwwvWVUZCJEzJtrj}	{}	{}	{}	{}	post1
tkYXKYurS41iKLPnU7i7	ccc	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{sIZQ0em4Ej21hn5iXIBr,NSY4GtB3XY68GNrfT9q/}	{}	{}	{}	{}	post1
ZP1GPC+i2CXZVnl9GYb7	I made the Honey Garlic Chicken from the showing off thread 	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{VZSSh8EMf5mxQG+UdO70,cZy89KDf0ixulmgYmEuR,tISq781VUkW2bBHFI4wi,CgODMBpaV3/U8tt1B7Qw,o8CnMYhs+S/31eHy3axr}	{}	{}	{}	{}	post1
g53TbiDOJdJAkfVV7Dq3	Looking For Friends Konosuba xpost rKonosuba	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{rhXzZVxBUayDBOXs2Y5h,QX2dadDnHp/pEcM0OpyL,E0n4B/1+u53pEzdqaxy1,/+fHtFELpUU/ncad5Hi+}	{}	{}	{}	{}	post1
nRY4oQ6FO1/1QeJfD9SQ	Newcastle Utd Have Been Promoted to the Premier League for the 201718 Season	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{qAr/nVZM4ntmvQ5Vei6Q,UhcM7SSBaKPmTZiUzFOq,J2ESdIGUsgOBiwYOK4Uu,Oy+6/GIIdKUfGNofOvUO}	{}	{}	{}	{}	post1
C/RqIpnX/pI2SotfrOxl	Whenever I get a stack of resumes, I throw half of them in the trash	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{CgZOVEgXS+CefMhgVRLb,yacv8qgL0twqPXR6VH1q,58HDNiwNMNoMnTvqov6+,Cymr12U2xvVWskfpDUqx,ezbTcyb44/DQS1ppDUuT}	{}	{}	{}	{}	post1
XYAd5Zh/y3KFUVrfBaMV	This is so funny	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{unnuTF2yO8mnASnVfTVy,3yZuDdZzXIyRkbuHU+Nr,xSRfNSU1vHNtf+N5H7ZB}	{}	{}	{}	{}	post1
H3dO1NtpTiVl0L67Aagh	The year my father got my mother a hoover for Christmas 1984	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ud4eCMQtbN/Um0HbAO2Y,mqeEhHPz5EtZvtCc4Kfn,uBIVh2G2keoyr9iNCb+2}	{}	{}	{}	{}	post1
TYQ80BLHc6zh1O3t6boZ	Rocket turning into a shuttle while in orbit	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{WZkalwao6lsC6czoGFt5,d+LhIJhImbpbbRnOm4xf}	{}	{}	{}	{}	post1
Loc5UWpBwKw20QipAxO/	This Toronto Maple Leafs fan knows what its all about	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{xR7UfS4h8Q3Lk14/YE96,TwExszu8ov5jGZKz4a9c,2v4yEbMSA2Lz7UtFR0e7,+SH8/vnENB74H5H0+1Xc}	{}	{}	{}	{}	post1
gRGZ7MezXg5x1YTQ+kv6	Having fun bouncing in this lingerie	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{tLa+iCcUF16EEb8r/EYE,A7/HzTquDsX4cDOocr7+,0MxFaKl8b7GgfNiRCNCE}	{}	{}	{}	{}	post1
tuwIwDTcWMij5Lsn+dF2	Denver marijuana shops have won permission to stay open until 10 pm	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ZfKuumpajTqDQT2WCdIN,9M0e72YdxuxS/CcGa3pZ,fpxe/sicAlUAng6JMYUH,KlTAQ5/NS+4NefLX8FNs}	{}	{}	{}	{}	post1
v0/uFtYnnfnaglP4uUwh	Weird for its time The 2004 Lotus Espirit, the last mass produced car to feature pop up headlights	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{9TMNs6r2pzAMPZi8s7VH,qLkGO3usrIay9CwIU3Kl}	{}	{}	{}	{}	post1
s3TECC9coOAQ/4HdlxJm	Austrian farmer finally fulfills chickens dream of flying  0108	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{KfLA2+BGR3/MluTI7DSH,+QXDStr/JAfS4n5iHKgy}	{}	{}	{}	{}	post1
5u/NfExwO9ef6eA1PTE7	A Floating Market	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{iKyalZi9lc565m193Y/e,AWKND0GmWq4ngcklpVxL,RiLtYxlB5yP/036zskCN}	{}	{}	{}	{}	post1
J1rgIY5aLoqOR48jl7YH	Hercules beetle pupa	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{U7d+21awLvjgCKjh5VHN,xA6O7DZxW+gzQb9lBdLa,Kyo34Kdjzfgl42Oy66sL,f9DBB0PMbPfwd8zeDl73}	{}	{}	{}	{}	post1
kiFFetKW04Yrhp6Cg7iM	I did a thing	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{0N6Ui6rCeFNOC/ZJQXsO,S5cFP5q/YbOR/fFvoPfa,Xc8yRq1cQa7oTf6YpXW9,ycBVjD6VWo6L4rhhkwXR}	{}	{}	{}	{}	post1
MbThFCstiI1CO3Q1TbWX	SariaSkella	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{+WF9ECLgTW/bKmRY9jno,ceZupAITXmrvEBUGC8Ss}	{}	{}	{}	{}	post1
KJNoh/ej84YWQnnLAjFM	I wander the streets of Toronto at night, looking for cinematic moments This is what I found	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{VTruii24aaQ9PKXLcn6Q,aG2t3HVCwHi8zymfl0gQ}	{}	{}	{}	{}	post1
WqxeqRscZU3eI/V+vJ4+	Legendary armor concept art any weight	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{EUJgrxb0iMYuWOTl6hfU,yzXk0wSxu0lmgoM9DldH,/2oMztuDMST4lSJW39it,S+r9HODtlRfPRn82uAUH,bnX3ZH5VEDFNBqbmMnUz}	{}	{}	{}	{}	post1
ix3Mcp8lFcbaIc6cSCGn	We werent imagining it we just lived through Seattles wettest FallWinter period on record	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{GIzR+EC6CqsRuAB/TgYS,4Tf/1oaEOjwotdmlbLjz,s86/A+XHULH6davlcsjp,WDh0W/FdfoNpfhExM8Ub,A9/cuZ9/YldLoFshtkOo}	{}	{}	{}	{}	post1
Dr9TrSfvVOPKA9Ox26vE	Ladies 	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{BXqaKD9/wBisfS0ymHzJ,gpfRCPd4APaoDKHN61xo,JqVR6LfYiexHsWJKbaZW,qRx1lBu05CnHQOL8W7VK,VYLK89J8kSkZo/deoeDy}	{}	{}	{}	{}	post1
OPNrxs7dPLp93Ln6aBuI	Confident	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{lPT/qnqbxGp51Y55rQFd,k1IYAId/W0oAbyI45qvF}	{}	{}	{}	{}	post1
qObZJrbC7EQyCGBsAfSy	Superb owls are frens, not food	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{CLgfuLRviiXXcLcqs14m,Z5o48F7P85BbTevnaKTK,SpCKX/0pN87QvkupBy5C,wiZF7Bz1A4emvvUhH/nF}	{}	{}	{}	{}	post1
zXEeqbW5cEtrjIaq6+p/	Lake Marie	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{s9uAudTRNYlCZoU+fsyw,g6H1P9uygZnlQwD2qYrM,F9Z7reXqceioXC3DHt+k}	{}	{}	{}	{}	post1
3CDA1FGas2GwfOxvLQ5c	Humour Even the nicest of people have limits	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{UEZuMAO6W0rclb4ZVR+0,NdKmUoYFLLyRV0D1fWWX,h5TBBx0v6NjBCGAHsbJb,u1vHLslXCx28hWi+s/bv}	{}	{}	{}	{}	post1
3hEaa4dPEkZwl84fWsPS	The reason Nina turned around	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{C/yMOrr/VUjpNIcyshw5,ACMZkkP+aBuAPhxyZ+87,QQZlI/VKzeVrrM5luDnl,NFisB3UoCj36iMVjGEbQ,RZgfv369S3QbKnDnBnaa}	{}	{}	{}	{}	post1
JQYRDAWAk45nGnhLSWhx	Its treason then	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{M04qEmoCis6+SXcwHypn,/urOh8/AeoKNUct41TWb}	{}	{}	{}	{}	post1
9AJwBZiro266QvZF51YF	Yuudachi Bikini KanColle	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ql++m4ohcmvgMMNAe24q,01XltaJzB4MF8cy93QR+}	{}	{}	{}	{}	post1
xqEIFcKtrs79V1GvCfjM	Life Support	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{XrJwRp6BI8U1h6jmNlC8,cSHiw8064nGhCpEZ8zgf,Svk0+WCWBpIsDNIrx2Sx}	{}	{}	{}	{}	post1
Y0TBa3XlrlJ+sF6zkX8k	Pair statue of Ptahkhenuwy and his wife, Egyptian, Old Kingdom, 24652323 BC 1212x1600	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{85UOJ82eQX4XJXPrz0QP,ZvLB0mJNVsVIeeU0ZcRs}	{}	{}	{}	{}	post1
/1JN4ijVNKPJTcmz/Idf	The merge of LLVM 40 into Rust has finally happened	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{BpXLBwQ5sNXSdjj0LMAG,AUjLNIdP5MfvWHxG9Qsa,c7j4KhGxc5pBELCpBRG3,MFSyVYTrrk3fy7BCfv2b,XT+G4X5Eex+AU9MjAzCF}	{}	{}	{}	{}	post1
Tk2nWZkvlXcO9xwqydL/	Good Morning	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{dK/tGRJQmY6QUAMlojxW,IqjwysjY8xccH5SBjblc}	{}	{}	{}	{}	post1
/GjBU0I+Dv+u/j6p+M9p	This mlem is the best mlem	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{oorR39mZY6khEOQ84Hms,zTAtmQfAy7/ovMZ6/jNh,jSeiNYSJRXRhsTXeNn3U,cXtLZZdxXo0QR5WYlcox}	{}	{}	{}	{}	post1
6wmjE3uwTSZINRaOFRFO	China bans religious names for Muslim babies in Xinjiang List of banned baby names released amid ongoing crackdown on religion that includes law against veils and beards	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{fZkC24gjAXhqRB7ksJxc,m7/kaaQAte9GB4h9xkEg}	{}	{}	{}	{}	post1
z95tJp4X5L9vBJKb0lWY	My brand new camping tattoo	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{CQncjL8kIUS7jUofa/Cn,ItRcikw/HhtN7OjS5pQd,0BSHIcHXT2AmFZA3+Sfl,tzRd/GsvuKJyZupOXUVO,r/z1YfbXyxHDz+zlhszW}	{}	{}	{}	{}	post1
gFPwbWaaERQNQmSSysVg	2000year old olive tree in Bar, Montenegro	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{bpgfWBgVNn5klCVON9pA,huFHDQ0m4jp9UMTHp3jX}	{}	{}	{}	{}	post1
wXA7apJ37w4JqdlwN65J	hmmm	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{9/oQ1QuPoJwDVbBBkJuM,zjP/xQIdzDIkDrKCJM1w,a0jLxDKONxbeK9AYbaz/,vTyQYAZcHFn3Cf+WaQBz,RVl6658vWcWnrmXvlyVa}	{}	{}	{}	{}	post1
bKeGlGsiR36OnvQt6Jv8	This is 8 week old Gracie after her first bath	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{iQ511GpHOccFVeQkBAYA,8jlu+E8z0CtdvkkCY/E9,NHkdmqqo7+3nVvQTuQPP}	{}	{}	{}	{}	post1
U6e6GfiWUUgXR2x1KG69	This cozy openair bedroom at an eco lodge in KenyaOS4146x2705	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{S7yYKIaqqQwTBGNl9BZi,adeI4odOY2eWcYf3eAa5,BtobJac4f3oH98EtUW9H,JAtGSHX4zyEtdqeNfPaz,s+hfJJS7qseqvTzYFuSU}	{}	{}	{}	{}	post1
D2JhHQi0jZGFKUXdbOCA	What if unlocked doors had no player collision	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{vnLyKTwaqNs7pXBEl1uP,N5pxkc5Sf0+KIpO6MnJe}	{}	{}	{}	{}	post1
d8lZQ0RqfLctcs9Jhdau	2B in Vks	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{/18Y17ojj30/ZjiCEtft,7cV9r79H4dGUMBRIBCAY,quxiXHb8wiXdKDpfue9W,mj6K3o9mxS4srCAuITSe}	{}	{}	{}	{}	post1
uvXBVW6xJcavNKmEBIVY	She can fuck my ass anytime	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{qscFRwPfPfkOgwO/nza/,MFvIvGnsBvItXRiRrS2w}	{}	{}	{}	{}	post1
xQbnGD+4He+bN9YhT1j7	This titles pretty unoriginal but my comment will be better	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Eps1+ed16nJjN8Skobuv,HbV24DsEaJVj5uOg6Esb}	{}	{}	{}	{}	post1
a/e+iAXp5yJd5e4NZZsF	New York a few years from now  1881	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{TMa6uwlgQ4f1dz2CWlVN,0rxUvalwrPkaMjkaKrIE,gskVN9rMOoJcv/Vu5Lnm}	{}	{}	{}	{}	post1
I1BqKwsQft8m3T75pDo6	British afternoon tea, delicately served on a miniature picnic table	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{1x8t9bRJqvAP9UeCULsB,HbELcGUrwpTyyAVgZe3G,aKQJLhpIpgh4UlQ4j/77,Ws93gnSkYiwXffRy7MJ8}	{}	{}	{}	{}	post1
r49mnatyGyT1FMKiWajG	Gummy bear pyramid	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{3Dk54ZQF/w5L5sAiOWXq,T8xtrTnrisW31TskQnnR,S3wfReyOmfCSrByhEAXh,Ogq1npLtNTJNxNRY0do9}	{}	{}	{}	{}	post1
kOvJqxyTC0T/kuk1vZZ3	image this hedgehog is cheering for you , because you can do it	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{MSEP2cgyHZxiacufP3Yd,l0hY2CLAv5Tb6iQO5ax5,QhsVioNTSV9tWf9NVmGh,VfUJ3XErAXCLYBtC3VnV,OGeb/zJbpUKKr1W66xdE}	{}	{}	{}	{}	post1
zUhgyYpKavBCzYUkWUl1	UKIPs controversial FGM policyproposed by Diane Abbott in 2014	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{fnAKr4wm3dSJm49QT/8E,vzSeRfj+c4b/C1JVRviE}	{}	{}	{}	{}	post1
ilxDp6qJGfsCKDWvoJK9	HMRB its bobsled time	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{MMcrRztBzmhmx/PDEWLh,M5VUw6AEPfjRFN3TcEaN}	{}	{}	{}	{}	post1
09n6j6bCEnQcNZWCXXw3	BART takeover robbery 50 to 60 teens swarm train, rob weekend riders	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{18KwmgiNtSyueaCMg7k6,M0SWk+Eyha3qbWP47d9Y}	{}	{}	{}	{}	post1
ZeUgcf1m5S8cal6hpxHD	Work of the great Pawel Kuczynski	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{5jWOcRYnjsBEigMQVBrU,MtnayRGl5G77OlpVFdSi,kakZsAp6XvjpVN1ky7Wd,RzC4VLZ/fm0JG1QWrJXj}	{}	{}	{}	{}	post1
aQJTOyQtMaQ7mGwL4VtH	Motor monday	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Kbmd4uxwaA7ZLcOp9OeN,QFFTv6kBmPULZnUKZhbp,H0U1vCbld9ysaBet+Ryj,R2mZ3M+XFZ971JfHh4bl}	{}	{}	{}	{}	post1
YZ5KjVTkfycwHcGhfhLm	Dont let her selfrape her sin cave	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{jtxsyY+vGePR7oF2ucmP,fXnW3G4khTIOXDNhIajT}	{}	{}	{}	{}	post1
6KryoSrWf5AvjQH8ogqs	Theres nothing fucking interesting about this photo	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ohxfHSXW3SdNGKxQYDU3,PWL3hLl+65Lw3BMWwKeC,9O6WYk2J2vLJ7knXdnBr,4tLIv/V8Fbq4sWBD0t+X}	{}	{}	{}	{}	post1
IVVV+EyyVp8CIr8dh3Xa	Spotted in Penticton, BC	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{T/sdFJzKNCWU+00Vq5+B,ilGvR3xKuzWl8OXDPf10,FWhMSI8JO5wgT0Fa2yb3,sOpfwJaeXCB+j/w8+3QU,P6X/na4VhdqLR5DdPqD0}	{}	{}	{}	{}	post1
0YD41fg1u2CfSRn7oJZF	Some rope and cuff fun	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{3DGgOFAT2yRyFQPbk5QF,HFjcrEHaeLJaMQKlC6Rf,Ny6g4r8Qwy5kvFEISqrw,a1WPDZORLz81X6TYGdUL}	{}	{}	{}	{}	post1
rxTyOSplpcn8dnjo/adk	7 years practice part 3	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{CNiU0H+A1i98uprx1zoB,2GnS1tmdDlp1yDfLw0go,eCRDjMGAUzGDKA7BmfpI}	{}	{}	{}	{}	post1
V93rLTKY6/1L/wxxOsQW	Cameron Canela 89 pounds of fun	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{UcsDRx5raaCQ0JKUzTNC,oNziVebdx6gHVzs+mYbz,EwhuUOh9tXXKRXXooS/l,BtQNBEkxkVpy9MKxBv33}	{}	{}	{}	{}	post1
fx5FF+vvMjCD3PLsxHfl	Pretty blonde	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ExSlGdcCn6+M/sge5U0m,D6nwCxtEaQIoe1iuHwCu}	{}	{}	{}	{}	post4
BBuNp8/PWPaNiWTxKcVf	64 or 32 bit Thats none of your bitness	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{/gZ1KyT7NhKVlzpTwWuC,Tb95+HbofrmyHdXkLLtb,lwd9HURmG8BPwENt9yCf,sM7X2FtBbf2s2VMOk+tv}	{}	{}	{}	{}	post1
+kexVvlwST2wwazO3f3H	wiggle wiggle	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{wxuf24/jKXhQucL0YL0D,A2J99yxtCFM1cFEmfBQK,iZWc8csTVgyNgaiwjU8O,WN9tI2kcq1q0lTrAOlSk}	{}	{}	{}	{}	post1
Q1Gj1Hi1QW9kUnL1LDjm	Hair Pull	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{mjEpoe76b6YC0fXeVF7H,dr5SzWAyZiWRNyQfjfxT,QhVeeaIDEPOziCFAFQ2r,mbXH8DTrSQstbSC/2NT0}	{}	{}	{}	{}	post1
/aEGoMsAJBEZd1eAC49Q	Ryukos smile	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{QLFdel8khMNjueE5Jc8H,tpW/ZcsP0ncIKLuydYqk}	{}	{}	{}	{}	post1
2+UmcV9zVHRLeLIOJUax	Getting ready for the needed shave	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{m9549uqaYrHKaLVfTrTy,36bN33YRXfCZvum9Ag0l,IW+OB9RPpBPdulkmM0Y3,ScLYQyaSFU3JDoPAUGc4}	{}	{}	{}	{}	post1
SV5CDRbHSDGYqHBoS/68	Kirara   ct16041  ct16031 Electronic 2017  0746	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{MTx2eTpx3tBAMq/z6XTL,w+SbvS8doYAtCizEiVJJ,KWifaIt4MkRt1CZUl8rI}	{}	{}	{}	{}	post1
5rijO1bcavruwQBEQBf4	They havent even begun to peak	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{GjpM2JH1lPCrAX2jMHrd,RHBamBozYqPWL0fAXHNR,b6McgMJCAPjg/A7L1x8d}	{}	{}	{}	{}	post1
S6pi7OB5BtVRAL3ZHWkP	Made my girlfriend a playlist	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{m5JXI25hovbFa8q1BPif,29g5wD7QAOv87TUZZb+a,a7fkCIgBHaVQQ0Y466cX,TL6syJjShG/hL1cn9jBI,3HJYcS+doKzg2ynfMUmr}	{}	{}	{}	{}	post1
wanLuELmYXk0dlqpCrnm	One reason I dont do risky activities is because, if I die, my dogs wont understand why I never come back	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Kysa2WbUXyNT7o5KMCT/,X//SiOsCtLE1GwKi1fl9}	{}	{}	{}	{}	post1
qMFZsSGuDNq3oy3gCZL5	Me irl	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{MOAlQ/MV/H0mgBkKZD8W,BBlEvHbtYAjWpE9Fa0FK,ybctBVHA3JnHlm28jgHl,WHoKhDzb/cbpRZEwLp9g}	{}	{}	{}	{}	post1
GNaBls/CdmguX5G+wFpR	A study break that went on for too long	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{p/xyuZh2p6RlOsfN5C4U,ZRSRyV1sJdHD2gyrqVuP}	{}	{}	{}	{}	post1
i4KuehPwIdOPVlnK62/m	Outlast 2CODEX	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{p/P4IxhyzdjrWDFdRw31,OwjKvnbFO6G+5GzKPrPA}	{}	{}	{}	{}	post1
2AEKfg3ssjqyP2C+KQNv	Blonde in the style of DAMN by Kendrick Lamar	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{faCPoT5Dq0DQGq/SWMx1,P0V8/8x56njx3ZPDFRjN,vskFxi+tpEyK2bXyTkiB}	{}	{}	{}	{}	post1
78BpQ96O/0R7pCLmRz4Z	Just roll with it	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{nK0nNNY7bJkYZwEqEa8j,mr7+5lITcXy1HkuClblZ,UG5UgV0yWNkU9NmJ6FIO,dD05j6bbkpZ0+rIQZDin}	{}	{}	{}	{}	post1
5Kv9b9sp0ewEEA2Jotp9	Thats some serious eye contact	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{iqdmXMsAN7lnuUc/kdv3,GcujcKmVZvmdPXAshCx2}	{}	{}	{}	{}	post1
LZF8bDICD49czTO3Gxf6	Salmon Cannon	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{0zORxIPQbQGjxy39LJvT,6jWvmkVsIFJgMpzGxefM,d5eTxc7A9tkMCy0vBjkz}	{}	{}	{}	{}	post1
h2C9W42cJMJ73ezGdKnt	Mount Splashmore	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{xd4VMtd55HRD2/Adgbev,OK7r3hahE7sb7XUYEbiV,h0HyEKbMGNJmGvxSXQXa,Jra3OJUgbKEy/mISAMkB}	{}	{}	{}	{}	post1
FIPgIz6+PVM3ICFEO8kO	the end	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{b1r5JIvPNmcP0nllojvL,1jDdQZYgEk8j8OsrWo6+}	{}	{}	{}	{}	post1
H9Q2R8p6dXw4oaM4IInr	I thought he just liked cutoffs	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{MVFNhpY3N/zLYNRAnhX8,qLHY7lniPOYIW+GPwLCq,fdeOJGuI7GqOJSrvJzND,sCn92PaSNKk34mvgANkB}	{}	{}	{}	{}	post1
sge5E1P9u7v28OFLSozh	Comaron the Hedgehog	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{YRCbxMF+YTNi+UCcxbQq,VmqYVaNmOrC5BkO4pEQo}	{}	{}	{}	{}	post1
n7phjrCsh4CyJbGgKSCX	Rachel McAdams	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{k9d3HO9BsU7rovdf3Rjw,0LwzhgQInqgtX/VtqhpH,2m9shy4L5vkg+/NJNIZk,ndz11dDDmiodLr838Fcn}	{}	{}	{}	{}	post1
aTbM4pk52ewkV1/qc5gK	The Soyuz MS04 rocket launches from the Baikonur Cosmodrome in Kazakhstan on Thursday, April 20, 2017 carrying NASA astronaut Jack Fischer and cosmonaut Fyodor Yurchikhin into orbit to begin their four and a half month mission on the International Space Station 1041  929	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{jqC8gTBNz3CRN/yuMR/d,IvfbyWnUqvWsxBRPUifZ}	{}	{}	{}	{}	post1
CqGjJBwbWkjE5oMYKrLy	Girlfriends Engaged Friend MF	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{OKvePzOLim0EO1928lOC,m2CIb3vJw2HOtvLSUONE}	{}	{}	{}	{}	post1
HxTHbWpz0MehysCOZaIG	Backside	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{0F0ihcNe6DOo0vWUBhxB,SBr4jUAMxwayu85nUf/L,cJPX+sh1T1Y/E8ZtYCyT}	{}	{}	{}	{}	post1
W0Teu68RKPemEd7RKqwK	verification	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{/FsXbaza/m9wflAVw2+E,XqCi/K4f4RAm6zuaeqKd,q7Z3O2wDR7xli00Ui7S/,F5+PGJYRAGFi4E9tk52b}	{}	{}	{}	{}	post1
FcKQiYsCLVt0izrAdZ+d	Zoe Clark Hits a high note	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Jq83nv6BQWaQLwTYr6cf,y+wdS+MGjmYR6FZj4X0V}	{}	{}	{}	{}	post1
udwb9uTzL6YtMXS/NpAa	18 year old Polina Malinovskaya	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{syzHXk1TPBjY5XwCec9W,hWPF7M6aG2J0zYJj7OvM}	{}	{}	{}	{}	post1
VzZiHeFCGvYUJ7df+fbx	rtheDonald At the moment	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{7kLxfgppSteCcnfscbkV,UdQOCV11nj2RIIxBODhn,vfiNcjWh3HCnAdD1yOpB,Repmak1AQd/7HBUqLxmN,t+Ez3TsoCA1wmBmpQIMM}	{}	{}	{}	{}	post1
khTzxLcoSrgIAqFnJUMx	Just getting a drink from the vending machine	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{8RIso1hKd6K/Uvue0p76,n39953MMCR4OmbnBS8iF,QlJTLqwjhP+qh2rg8uFZ}	{}	{}	{}	{}	post1
S1pcWcVe117zsHh1815B	It would be a shame if everyone was reminded on Armenian genocide remembrance day that the young Turks is named after a regime that killed 15 million Armenians and the owner cenk is a vocal Armenian genocide denier	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{9W5pPgbs89cbF8+6ToMd,ahnSP3aNesA8eu2fE5qR,ErJoYWgBPwEso5ytAw07}	{}	{}	{}	{}	post1
RjdqlasVWKM8vUS0X2Zs	Donald Cerrone goes Super Saiyan	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{rxskj3lJUTLbSIDNrZpW,AD3ZAVao9HJF6iYZvxEf,y2M89K7Hdf3mn1/zChQk,B6wULGEIGNyBqH7+JCk4,x8PLUviGFK9HpJtuQ/zN}	{}	{}	{}	{}	post1
crAyoDt3d4KdsZJMv2lG	Der Portalwerfer	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{3bXcAb8rEb2cpK2b4ZBz,jFFNXPAq+wFJmbMJxHYT,2G4akPD6oQITqGN2tJ8Y,zBghaeQVmXC2kv+3mW5Y,TSGMDEv3miKBSmVYWX+f}	{}	{}	{}	{}	post1
IhfEeC2JKYv3JWjUicxq	Took Reddits advice and tried to reboot my pup	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{HI7+ftJKEZUUS+FXZPRh,IgRYfpHgESQwOm3W54Nq,4V0yvZN54bC2iNvQFFMp,0Y4f3TO+WWTw8ad0fSoe}	{}	{}	{}	{}	post1
aydaNJLMKvW4daL5Q0aW	The FTM equivalent of touching your HRT given boobs	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{AOPHysHS4x8KWm2Nf5F0,AGGRWuJGnTvhOObQAj0F}	{}	{}	{}	{}	post1
AT6koPGycncpKqZbF3zU	Kingsman The Golden Circle  Official Trailer  0158	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ydEg1HhAupwkWkRn/hbo,i67XN37IMevo0lM3h/bX,/4LTAWtFSDbyCYxRmp4w,q+7tZGvSbNHBj9W40wrE,yvCaZw1MdHf7huBrSZ7S}	{}	{}	{}	{}	post1
BCE0eoqwclbd+w5uI2fo	Roses are red, everyone needs a friend,	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{yllelzRILRNEnAnYePyU,ws/lJ4RdtVLEX95mhoYe,VkQwxTF2z6FqmTZMfKuV}	{}	{}	{}	{}	post1
G/YgcyfRCYJvINjaZbG8	It seems in your anger, you killed her	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{W4KYV09HSfmy5FMA5jCI,w/jNy0SoOSccJgIdXbJE,JFGjR+Vw2xJfbweU2tmX}	{}	{}	{}	{}	post1
AX9YStrv9GHPbBb3bV9y	Zero fucks Volibear  0044	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{e/Z5BVRVpyY7MVrCcy7b,5d/V5F1GWDzcI8Cn9Df/,V5PONSP9Ljf5MaEz3PH8,5hv+TgghWCjy/NFEHrnE}	{}	{}	{}	{}	post1
b/sbbIZpDDXLnZcIkYng	hello, world	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{l4FmJVzWBUEnQWcP9fpv,yA6QiAuO3otZBvREuOHt,bi9VHdP6KMs8+RFozTQY,kx1RAaakywaotFPKC7VX}	{}	{}	{}	{}	post1
DcOnrIMRsbI5JV52lTdD	Its a trap	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{lftCqmDeAR3cEpZHBxqS,oTuTlNKm8lHOD57ThYra,+i66BNYYWmzf1Z07DNE0,ukcP4LK/hXMVsO/Zbe0c,xpU9G0wF8V1LUctwGFom}	{}	{}	{}	{}	post1
NiRtPkH7fyIw3cVBi1sk	Unrepentant	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{g8pvlLOOCp/jG1jywyxo,Lkf1UrbxpXTNzi9bnnah,HxU8PlO7ZAnVSBzjJpsO,l5YDuzG0ejtrdw255j49,2X9UMoZFvUlPeoaUqLjI}	{}	{}	{}	{}	post1
Vlh+JLRe6pvf2v02I4RP	hello, world	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{qGYgATDEtWkchma+UZyn,840mIztM451G1VZ+TikH,8lQyC4uT6pnqhqKdCrtD,c/N/srNX4KsoAP3Qd1Vi}	{}	{}	{}	{}	post1
lkv6woKCFngQTIZWDy2m	hello, world	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{1COGGnoAjwtmfe/NlS4h,gVZdHPaBRJi73arX1b9P,cvr2IdbMl0phLUObT63j,x0FsrcHBTwjDiw22O8p4,yDCK9bvVz+OPyKphMJqf}	{}	{}	{}	{}	post1
bcIP9xWQa69qDOkrnVpc	The only American Idol I have ever remembered  0150	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{FotVOb/61xdCaDkdsmLk,D0iddSDHUZo3MTqdsYQ4,IIykoRvNZMzH+hSLY+5p,HNyASO/PxL5NUVx/+Ath}	{}	{}	{}	{}	post1
2y16Q/VUmEGJzr3ebb/F	hello, world	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{rtQ7Zcxs301QEuS6TdcR,ay+pQlTwW/BkePjLZ4dS,8o7Z4vSJA8AwNZBE+k/e}	{}	{}	{}	{}	post1
1Gb8x9fhMgTrzkV6Wh/a	hello, world	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{zvzXgpVIcj9nEMiVbc/o,nYparSdXxCQCu09J8HdB,78HAdTWU4wmiYoVNE/l1}	{}	{}	{}	{}	post1
456lXnYsAfnaYI7d9PUI	Police Reports Blame United Passenger for Injuries he Sustained While Dragged Off Flight	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{NMK45mNTTsJnEnILrjqj,dBCVGa6YNvzlbtmn3HQ/}	{}	{}	{}	{}	post1
Ri/hB9AjcGrRGQhQYeE4	You know youre an awful president when the Carter Library trolls you for being a failure	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{DgPPV/MJrDnBpe0QMcoU,FXihow3gbBrp1OunJ64g}	{}	{}	{}	{}	post1
Zc7A16wuZIpqcfgGRi9e	Want a me	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{XaUTfQWCJcBhU7Piv61F,RCGLZcO4J7g+YWshDjpA}	{}	{}	{}	{}	post1
9NAJAUdB/fRIvdS1Bekq	Zen And The Art of Motorcycle Maintenance Author Robert M Pirsig Dies At 88	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{TNHeu1I4nqem6d3Wssnd,NwiIO8rbnHchDtB9lMkL}	{}	{}	{}	{}	post1
nOmrI/dXJU7Nu/9hMep/	If you go to Walmart and you dont see any weird people, does that make YOU the weird person	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{A8KvLO6mCCOgzJezOP3k,zS79Z2zIILIvTwZgHkdw,2PU9tgspxy0hwG8BRt8M,kAgmJ7iEkHOT/10qQ6G/,ivAHtUhHOpF8LJhUVKbD}	{}	{}	{}	{}	post1
Wl5H14SxxtlMduGDei9P	Should be fine	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{QFiogeInFAVAFs7zwXAW,xb2cjB1wOrg6k7Btrs7B,yrvT5VjRPa+RRSKxnVIO}	{}	{}	{}	{}	post1
RuA19x3fDp1ZeEz7sw0Y	Tiger Woods exwife used to be hot in the 90s, but what does she look like now  Shes still quite attractive Saved you 60 clicks Seriously 60	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{hhQPB//8ih8/Zm8gQEiG,lb3ZcPYj+BkWCKuR4mKH,SpPx4EuF4SnZPguPQkGq,hyrt6IOKgY42V7jSDFLL,tSu/nwFElVH3RfLG+j/7}	{}	{}	{}	{}	post1
eXk1zNQOV2RTSC3v6qAR	My daughter is four and thinks I can fix anything	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{5jXxDPihIp2KgDUiA5xh,AaBlc3dX4RAbRBgUyB7m,UdVm1MGiumWxVIBj8Ydx,KysVDUESh6mCALF5nQAh,kIJnZusp7WA0B0PctWDn}	{}	{}	{}	{}	post1
ps9KFHZQWJhlTPKjoREV	Grand Canyon lit only by the moon OC3000x2000	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{OQoFerCp/TW8gUsLvLbz,pj9Gd6O6LGl6kXF52CeF}	{}	{}	{}	{}	post1
2T5dn6zTS+8MoYIPR6UI	lt Number of people who want Le Pen to lose	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{9vodf2AtYjTibg7COroK,KBQwpt7NHIpMGYKUd9ip,veaYYudcbl6todN1USuw}	{}	{}	{}	{}	post1
g4s6X1h2ULwJiaetj7E2	Think youre too old Think again Left is day 1  right almost 3 years later some makeup and a small color correction wfilter  lovingmylife	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{xYhzsxreiBnhRxOvV7Gc,5hjEuy7zWypaEJZgqXsO}	{}	{}	{}	{}	post1
z0xTIPxxhGCO0mjcjQ9z	Ermmight as well suck it I guess	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{6moDcX71qN3G2wukU8NT,Oll3jsYTeDK91hugPL4t}	{}	{}	{}	{}	post1
oOi90UWp1RUxmEV27qcb	So atmospheric CO2 levels just reached 410 ppm, first time in 3 million years its been that high What happened 3 million years ago	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{SHZbcCNtLPF0hHaICoMe,zK9CnDHoekpT0laF+Wah,+9dwiUvgiFr9NjCRSzy8,LQ2etiLN+WvuUIPMwsLX}	{}	{}	{}	{}	post1
DmsPTclCfjOyoh2xW5WR	Come at me BtCH	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{mpupbOPWbJgyhKB3i7sE,dIcR2kNwKlIwHR/dQm3P,z/kuTIx/QSfqNAPOgAgO}	{}	{}	{}	{}	post1
7oKb3eotaOIq/6fH21SB	Ribs amp Fries 1080x1349	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{5rsMAKEdf/SJfDw9nd1Y,4170uzElE0lBIIWgU40A,nwnAzuc1A8lCtUNSZcxy,6tjTvcrJw1zhTra4LeUP,tbLYjP/qwSKGfiL0OViC}	{}	{}	{}	{}	post1
h/3xVKiMhgdDiOgrhXOr	SORRY MFERS I DONT HAVE ANY PHOTOSHOP SKILLS SO THIS IS HOW I DELIVER	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{icXFybfNPgYPjscLh2Lj,7s08R9ug4jhLnlQ7cN8x,UlCnZVUzTXjBT3W1euom,2vYpG4JSNjTLlxBcgf0C,E/s+Bjdrk3GF6EHasSFv}	{}	{}	{}	{}	post1
baiq5qJo7QmIq8bne25s	Five top Game Of Thrones cast members to pocket 2million per episode in season seven and eight	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{YxrgwXWJJGIxANfsTx3y,4JOFMRy9xrJrYn+1Tx5/,FhOhc9FJiHXRzkozTaYB,fjfkG4/yYYsSJHiXP/N1,gejXPQq1U1vAIJ9NPQtT}	{}	{}	{}	{}	post1
FK8oH09U2URGASVqs1RX	White Dragon, Kousyuuya, Painting, 2012	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{MPPx8pzgKUSheNIQ3E7W,5HF/1wJQEbD4CiF6+JOw,aNO+eHKJ3SZ8TLpw6227}	{}	{}	{}	{}	post1
F2WTu+/aHLxxFKLjqkGx	Corporate Lobbyists turned BC Liberal candidates	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{NKOUG5zLSZb8i+QZMng3,UCFraL7oo0gjuJSjQFnX,OdOe2DgNQPLUYvQ4vSjW,VbPY64XP98RkhjY7G0lM,0yD85VTr3Ry7KGGOUGBh}	{}	{}	{}	{}	post1
iiSfUTrIANPu+59NPq25	NA Legacy Client Now Retired	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ZoE8WgmmG6FY7epdsVMG,k2/6cEYhNHKDM7JDWsjb}	{}	{}	{}	{}	post1
zh36n/IfyyGSoI9mzFpR	Here comes the child bride	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{MgPZCIlmfJbnDHl52DIt,q5WwNC6CLdIgdW8QD3P7,C+S/fVJ1Q98HVBm1XGTP}	{}	{}	{}	{}	post1
2z3DhxYYYpAcRZFMlLyY	Internet Archive announces will ignore robotstxt	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{aaOv7Xic8a6+V/sLrP3C,S5vbiZf3/NJ3QFwXVNnR,LpyHEdZ/rxfuHw2Hucmu,qXmLlO0dyiKdSjA/za1u,3aWjWGj08aL3f/2T62gp}	{}	{}	{}	{}	post1
uCzXZ/h+0lceva5eoAFl	In light of a possible US government shutdown	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{weTQ/fGFjo5xTN07nPjJ,3xplDBKPuNkPwfCshuK/,wsBXfPlDtLW6V2QR2TX4,MLC4hy5mlemw/LoQkOmS,U39PBuAUIoDWNJ5p28VL}	{}	{}	{}	{}	post1
ikQRmU/RpuZLermu3Kr4	Looking for a rich boy to support my expensive drug habit	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{56q8bL0fVVfnePL+Ujxv,SOQZWETNqoI5gAYelrFl,ScT2iQPMLXCVKvSTtaH+,7YA325B8dqEe6aOlEeJF}	{}	{}	{}	{}	post1
LT+/mL3LeaKodL6O2fEj	The US Embassy in the UK is promoting MaraLago on its website While Trump spends his time golfing or watching cable news, the State Department is advertising for Trumps private club in Florida Your taxpayer dollars are paying for this This is not acceptable Call your representatives	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{uvAr4SO7niV0tNS1YhX1,yhUe7vkwD3ToTa9JDjFd,DGtyci6pz7Fa8YuF+LqI}	{}	{}	{}	{}	post1
pfGZBb7Quxu5lc2opSX1	Hecarim by Dante Liu	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{q3HgRPE7bTPM2ffQBur0,AM9n+9SEYjJ797OxqOpJ,6MlertoPApBryPOpAO10}	{}	{}	{}	{}	post1
eQYdo0lwWg/0maBPX6Ky	Cats have a special purr that they use with their caretaker when they want food It has a higher pitched component than other purrs	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{DiHcNtStgSuV/8SnhpCi,bwPJOHWc8SFh27JAKu0F,yR49OdBApQgCJ1oJSJXp,sIKxp22SC/5lM0nWBq7O}	{}	{}	{}	{}	post1
ouZZDeCDdH2/AqrDIz3K	What does 80 year old vagina taste like	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{TYu602UJHt806wBHTH8x,Rg0A2K35VF+cGUy2f/BZ,EUgKaHh2u+uVQzGu6NqJ,LPli8IFdN8ojM7I9RC1g}	{}	{}	{}	{}	post1
F0eUSMIjeOV7xXRhc8/V	New meme template, has a lot of controversial potential, BLSH	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{DkjYTnIXLHw523WsbC7T,Z5Y9Ircgs6RQA76ZCG7b,xYVnkwsuwXIjCEebZOKS}	{}	{}	{}	{}	post1
9et4NqcYlzqX3h6U2ote	Mesmerised boopstroke	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{h6EAdSTgn805GEvGE7/p,I2MM789EMTgAklPf0Th8,WEj9fOREUS7PcEg/hXSq}	{}	{}	{}	{}	post1
jz5nWB/ep4b/Gbk8fezU	Painting my R3 matte white	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{+UEaj7XHyWe2uXRXlXtt,ZZzZcMuSWCz9BLV9C/g+}	{}	{}	{}	{}	post1
D5HmQl9D2u9DEcoKhcuR	A response to the selfie debate prior to professional shoot	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{d0zx1RNd9nGXqrOcExyt,JIlsKq7J/N46zGVrYiji,rcgLhBhDQF5B7bSdIDl5,JBDLxHDbyUqlbQvRB8UV}	{}	{}	{}	{}	post1
A7uTJsWcGv90N9jqq2aX	When your SO combines two of your favourite pastimes Got me all Sanjid up in appreciation	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{iFjzJSs0uGkg7JfZiOL/,VQKAfEm5MbKTMvYHdrxx,NvvTRxDCIl063mo6/SUe,hwj7NfyW5hGaoXqTJR9u}	{}	{}	{}	{}	post1
uPEFdvhuU7uBHnFA1i5Z	One of those days	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{LL6bVRRt4STRreHJWcTh,5EdKEjae1PA0wJtRZ0z5,R6ybe0eH8hfyu403KYh2}	{}	{}	{}	{}	post1
ONpyMpB5ZczG/tqTb0qH	Miranda Kerr	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{hB5bLz6t3j8z+J7KeImm,u9CMl6soRBLt18ddq8vo,Xl70F8x9m97Fqf4NS+cQ,IHm5pY8mDJ91m2AE/rGa}	{}	{}	{}	{}	post1
yqs2NjrEc5urGA2MDjCW	This is why I Bitcoin	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{bRgi95vHV0il85C7Wr4P,AuhlVrVgf6HOBTurNcIB,03PVts0FuuUKu5Jb7NJN,L4jbaQv52lEqb2uXAUIm}	{}	{}	{}	{}	post1
0RaytChooMqyxUOYZn39	Petit rappel	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{RfnTai5x5HPjbYBTasRH,IWUOXgPP4fcXGW6KIyxD,5AGFPA/raKOUcg5w1CyG}	{}	{}	{}	{}	post1
RJ+mY3NeSMG33Im2nMWe	Triss Merigold	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{kW7KFKH+Zh/S6PpY4wBX,NbVeB2yxHw2Mz66j51ol,7yybWpe8HguFrv6BiNDZ}	{}	{}	{}	{}	post1
tUaeThVJdUmUI65k4V5a	Cat	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Ch4O7kTWjjNGuVTIJjIs,ZrHI0TYkQ/qJFmufkbUa,WaiQELicPhTvbflzewMs,fYUNC0pE6neICagi1KuG,PAgWZ6Ukv+JXxhyi0fWm}	{}	{}	{}	{}	post1
T4u53Q0zqk+jtd2EN0L+	You know its spring in Canada	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{A0PXkhpCE1MdMqIL69IW,pgb7WGytEL1t1uq1OVtA,1MTro/Ta64P/yfQ38rLU,7P9xxhH9owEKU1bRygqK,XNJqXHTFjxfB/5HKaa4Y}	{}	{}	{}	{}	post1
PahC0hXDjwj48Ja7J7K3	Booty and Cargo Shorts	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{CZzAONes1q7YvYR3kWDg,rezHMfDVslYaAD6iD5sI,PJKFZznkqaC/Ubj5nZos}	{}	{}	{}	{}	post1
mFd4fH+z4oRzwHlTdK0i	Florida Man, 73, punches cop, shouts Im a grown fckng man	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{pt52L+69xBYqKYTXZ2DD,kDCAF77FNznu4ksSPycY,6cQrh7je63Ui7LBSorBm}	{}	{}	{}	{}	post1
pHz0wDcklqaLHl1dG38J	Using her drunk friend	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{RSbOGpAoSP5R2SMXOPNw,FmVJpZgfKgyXAQC+pOLp,XzNZ0qPh5zTX7axZL3bv,eHbx8bOy9uzxG/UfQU+9}	{}	{}	{}	{}	post1
RrSDtsqnl4Yx6+HuhZyH	How do you like my first pelfie	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{kUV8d10omNNo9ZAIez4g,xUOvEfnv27VHOu1YhWL2,lRv1xDG2HyaXYGEbD/2t}	{}	{}	{}	{}	post1
GxXvg2onZYVHoHekIfvb	Taking advantage of drunk friend who can barely sit up	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{1ci8w4Tcer+nPvMetu3n,b7SEH/8qti859Aihc2GK,cujmqjUPMjOeGqM4o1NW,MpPbpvrDqpIJl1NeQ8NU}	{}	{}	{}	{}	post1
7IyTJXQtQlihf6rCSsrA	Take a joke bruh	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{xUYkJKD6nCtOFKP+MJB2,/wr3p0//YwLC5nr7mJYk,HDSyR/s3AlrwMRWHkw5i,LDUdUowllvjnEsiVRKL9,5qovD6oaxcFdrrCUa1iz}	{}	{}	{}	{}	post1
Rlbp92RoIO9r8b7bHfgQ	Tire meets an old friend	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{WwodjkrAK1vi8dqAgcjy,4UYVOySufCw31Q03IY9l,4HhLt/VgJgmv9J9eCTUk,45CB0Jo05nZrqZIKKUWA,eRxtoWKJOEx8ZAVTekp9}	{}	{}	{}	{}	post1
je4FHDnIgi7I+HF/Yeyq	Royal Rumble time Ill finish him with a flip from the roof , wearing a gorilla suit seriously, WCGW	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{xV8gi1v1aNt1nUuGGX5E,2glVj5msWv97Tk/KhBVq,5CfgzI4lngx4xllvdFgU,IaJNM6D0WWC1/xPHO+kP}	{}	{}	{}	{}	post1
V0OxKik9wty+9vcZIlj2	Critics discussion	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{haxNQBWORGXVbpd8ppcR,OPPLZncxPm4hqP6amUJS,ygZHcPeys79WKAj8yAH8,UTnTZxm62tRKl/008mbp,MFQI0d4j30x3IrF0grol}	{}	{}	{}	{}	post1
rA2rJlfJpLkm2bdVGxHv	Cub attacked by scallop	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{JmEK7OD25+CNlD3PFxaD,+uZwk16H8/GSc674KCnx,qERF+iMWc4Zni/DvlgHs,ZuQi7bSYATjjgP/wNzi0,G3RUuIn+TJ6W3svo4gYo}	{}	{}	{}	{}	post1
AZuCEH8NKwFkKPAY5zu0	Redditor concisely breaks down the foam vs paper cup debate in response to a note written on a Dunkin Donuts bathroom hand dryer	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{1QA5tmem4iHmDxraIHe7,yi2FOQFiP6RQtxlirCEo,tib9CVwb7qb6NM3+BSmQ,njYEBuqPlmaTvOFEqRca,3zhU22Ni8nB0f95Cw4eB}	{}	{}	{}	{}	post1
27SKcp51d2jyQLc8ZWEQ	In the Dominican Republic Plan B is sold as After D	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{P5SsubdBANKXcIUmQj+B,Oq3NL/YYWmiRrk+kysQA,bKz0rToxb32upWpnMT/F,6q55t7qS/KnUex5g56g6}	{}	{}	{}	{}	post1
9Yh7/h20AH5gQBC5qt0t	Oh the joy	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{6yzcotjhKmXKgZ8Qf/Eq,sCUl8MhmC6hnQ8MYlBfQ,W934Y9RzaPipKGHMu4Yv,uIu2W+B5EGDVvlnfcEH3}	{}	{}	{}	{}	post1
1VjkjAiDllfTffQV5Htp	I live inside this string prison, now	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{r+5inHu+XDTYPO3NkfQs,0ep9SG9koUmouS9Wttxs,hOh2lniKWzwe93VI5ZDo,J0tqEesrWnfEydTv2fsQ}	{}	{}	{}	{}	post1
s9oTfzBw7BNJ6uG2SjjU	rWholesomeMemes coming through once again	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{VlFuXhApRDF9Glr0SgV+,i5d7pPW1LS7sdZ74DkUN,m6zB7ElOcgzaGOP7bd3a,5oaD7bFUulXkrG8g+ODn}	{}	{}	{}	{}	post1
cP6076ZyJg3Aw87bdi/S	Shroud getting real	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{CDhVeDzZH2S2FFP0AeAu,lsZlUyLQe8CsSJ2TMqlg,iN3IEeo3JTB0NJbR/2rd,VoocU7K4IIGdjwHX1GBb}	{}	{}	{}	{}	post1
6bsl/HFLkGmxu/QwO6rL	Saw a few pics in this style here Gave it a try with this shot I took in Osaka	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{anofc3fAkmfeSjbyKbZX,QiHLTiquMTYBT1DcPFEi,/tUuB3k42jdVpOUmZq4E,LNkutEm7HHDmkfzEzI3X,eJkXwX+NG3gzPI4JIuIP}	{}	{}	{}	{}	post1
Lf0Z5/9Nib6Pvz8s/hoi	My fiance thinks that I dont know about him cheating on me My background and credit check just went through amp im moving into my new apartment in two weeks	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{v+CRtJICl6JFXtyWB9w8,7L1ek+t83NEkGr5eG6R4}	{}	{}	{}	{}	post1
gTz1FDKq+IxZfnTZVNAi	Triss Merigold doing butt stuff MiaRand The Witcher	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ob0OQXnmSfWo2jX+hxM6,jDHmx6Zoef8dkHcu3ms4,e3iyP5E4OGJ8EzSYXdpv}	{}	{}	{}	{}	post1
zuIbn+M1EbpSql8XiiC8	WDYWT prom saturday	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{HRCf/JgQjzBLgMeWSmBr,1K85gdfthXXQqdg+e0Jv,qlJ/KTfSVF0EG4sJmDUb}	{}	{}	{}	{}	post1
n6/fSHNaG282XxezuPlt	Thousandhand Bodhisattva dance	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{k76PRSVXR81glTCTOf4N,tuwMkQS2xbeMoShyrELJ,C/aIK4+j5A7aY0k1wWD/}	{}	{}	{}	{}	post1
clfMGedLL8JpM3dWFCNq	Is it me, Jesus	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{z49NwOEjbsGiyGtZWnM7,bh/WihA0h0jLMbqGCUSQ,9boOwh9HvxsAVxJG4IWo,47I76vt1zTE85cNT075B,T0HtlGN8SeYp946lLuTi}	{}	{}	{}	{}	post1
/8bydnemsbZ6PIE9HaAf	Trying to cover up her naked body in public	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{R9UpisROG+iB1zlEWypS,Kmam+R6yS68txJvD/1Rc,lxOfY27+2tsWYCrCZAg5}	{}	{}	{}	{}	post1
ajaA6rWXZEk/UL7T/1FI	Mayor Taylor Says Poverty is a Symptom of Atheism	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{0pKLcMQVT6iuR3dyo9Hm,TWblrxIDqreBtYIps/S5,7dmxLBimzR6MBf9EReBi,1lozoPFtzYBCeDl1MvyR}	{}	{}	{}	{}	post1
1nN3SsIefEwI4KPJp0/i	Hesarilla riitt huumorintajua	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{cqH3og0dx1VALAjDckp4,0jQAobUMLEk4tf/OilZQ}	{}	{}	{}	{}	post1
oeCoF79mWiQflANJb9bS	Lots of people have pmed me for links and info on 426 In an effort to cut down on clutter in the sub, here is ALL relevant info I have compiled on 426 related events	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{yyGspMFGOWiyx37e/0jN,WJyeV9AgiV0T2jpGGCbm}	{}	{}	{}	{}	post1
huJP+RuKzkZlJ9OKL2tF	ModF4NV New Vegas in Fallout 4 Walking from Goodsprings to Primm	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{NFuA2dG5Qm4oipbScKw8,xSewgsPTXMTfWxHqEUgG,2w+lnLHrSPd47Xiixd9i}	{}	{}	{}	{}	post1
Xwipggg/xJTsdjMuMOjI	Janice Griffith gets an Adams apple	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{kFKd0gIsMrIX6ONF5tm7,Y0WOaAWJtkYDeD+4B44S}	{}	{}	{}	{}	post1
5YiOCCzoJ2mJo02p1kvu	I tried to be unique in college class field with cute girls	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Sse4zHb3gSTHECVWmntg,zACBUIVv5MacJpYfV/ab,vt6qvvadmqHGdvtCngiJ,tGLB/CUNF+DxUu/p9c+L,/fSGp/gUmmX7KnQVAFXL}	{}	{}	{}	{}	post1
RAc5WNyF/IebKCQxvi0m	Cant think of title, as heres my nipples 	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{tYekKPk9fN7bnOyPgaSb,Nbrg7p593iVRMuT5jtni}	{}	{}	{}	{}	post1
sp639f+5Nq2drx50ElyL	My old man and I in Ghana Whats up fellas	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{fYUb6hvscdnr+sVOSopj,Kbz8KamDJ3XdJk1+6y8a,O3Qaxo0Pa05CmPEaN1AN,7XNDIuPcHb8/IIgxVo+l}	{}	{}	{}	{}	post1
muH3+mbrGNEZz3RN28C/	Flare	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{x4oEGoj03tPFD4jc69MS,6OmEXMyVsXP53iE4zSOE,2oiWLh/TFV3fGaiOxUmI,bVVaSX2uZd/amR9zTOdo,86LPcNUa5jUYxnyY7d8Y}	{}	{}	{}	{}	post1
rm64MZT9j+3qLxX5WAYR	Entire US Senate to go to White House for North Korea briefing	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{gm1snO8cd+GfbBrjzWyb,IObPK/qdIwGRj/YF8OGm}	{}	{}	{}	{}	post1
seC63h8LBMblqrbw6Frf	Newcastle United Have Been Promoted to the Premier League	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{hfHJLUeXYXNLzIu1JdQ5,/xjBobGuXqaYoUtlsVOd,DSGsXUfbnYR0i51pfW0M,XeU+FI9WOX5mj8rPAZLF}	{}	{}	{}	{}	post1
I8wW9sHyEaBDZyRsns0R	Meet Gizmo and Gadget  they will be coming to live with us soon yay	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{YpEKyGnqFQYPuZy1QXC5,9CxzIewZNyF+5IWct7yX,KSue/RLhmxSXKkTREl04,j8fDqedlOj42lEGRXt1d}	{}	{}	{}	{}	post1
hDjW2XmrE03O/PhzQpPM	rdeler suchen eine Wohnung	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{J3q1wcJ/fqeFwrlYtg0y,M9WjCxgWBhIk9WEyFxiy,RRk+YdEjTrMCgNYswT/I}	{}	{}	{}	{}	post1
34gU/stM1HjVMqYBbeYy	Terrific Tessa Fowler	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{stuzYZrSttzzxdQ8nEkb,rYNczoJG7bwz00ApcFe1,EBjMajRK9BaJHO1MV0+3,crticTytaBJI8beru85T,aOoTn7AJcQk5stYErAZA}	{}	{}	{}	{}	post1
xIohQGLCgvtS6erUIsjW	I didnt know Firaxis loved us D	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{jOdNZiyhJ5wW3tM87mkh,vmZY2GwRH61C3kHtz/sF,kBReC1QU4mX4V63WHYaW}	{}	{}	{}	{}	post1
ItVfA7vmGRfXT7VE4ZEw	I like it stolen from Crackedcom	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{bydAGjBi3+/mijSefBT6,HD/z96APNCD9Un30x5f8}	{}	{}	{}	{}	post1
VN4QUl4eYsOz7k7xlq0d	Haiku Oh La La  0012	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{z2fsu85/xcpH8UwFhSoX,leBxvTqBFJerSiO0nbt6,caHmQTtNdW7GenbEkUIO,y7Izvn52jHOBqjoOYbfc,9uhEiyS6GLGii4Me5hb8}	{}	{}	{}	{}	post1
WpvXGk5wmK9jpS1xtxhy	Your arrogance blinds you, special needs kid	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{BKx0N8v5yebPDx3nDyvV,M8/pBW2il/hx69jbrR6b,sYsZKcAXy16bl4LdqFQP,+M1nMfhnYCFbd3FEBjOc,gY3S0p0SdJz5pB39RGc+}	{}	{}	{}	{}	post1
K8jnojebJRcDY56cIbvD	Gravity Defying	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ahIf6wQYPPI06NJIZhGU,NpV4E0o5j1FMqY7p8Y0C,zVbG96Rw4t1HLMB2dw6R,EOOZRLS4tWi/uWkGy0FH}	{}	{}	{}	{}	post1
lz3lsqHd7FpE1XRkaFzx	Last Video  Rest in peace, Hayven  0228	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{pxxpc4nbYAcoOR2+NfBx,syDBx6kHzcfcp2Mbi5C7,BMOjN2JIyU57+IgW/1Fz}	{}	{}	{}	{}	post1
Wf6qGvpBstEZ8AqzSJaL	HMF while I give her some Sweet Shin Music	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{CD1Xp9ZBx+mOTouhn/Mj,lgJO0RIAGoxVIx6uDbwf,IRnmfoqK8GUxHuM13TAB,VDhuzir/Sr+Bn1qYnPYg,zU5nq1Rg+w8Eq6zmdYyU}	{}	{}	{}	{}	post1
8mZiabWksAbmv9Y7hZNh	This pointy thing is evil	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{7xutB0SvpA2JQgz7/7wI,5Gl2S93GywRjwYFDUTyM,roXW54IwUca8vtP0Xe3f,Qb6DXprebPdRCDlLDNq7}	{}	{}	{}	{}	post1
ZQouLIe5ALw7muhqrXsW	Showing tattoo	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{YEpgpghJzhCwuhHEhQzY,AnxyN8aYyTEYtsOtF0W+,W3noUcmQ2Xp5x58OzBmZ,ohObNXawTzsrRYLaSbYP}	{}	{}	{}	{}	post1
c+6qiAgPmJP66XA0Vf3S	50 Years Ago, This Was a Wasteland He Changed Everything 2017  Fried chicken tycoon David Bamberger devotes his life to restoring degraded landscape  National Geographic, 8 min  0817	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{sF0DvSNeBpuY2FzhsB2F,898lcihaYCE/NNzAPwGJ,JELfH+tYsj49qaoJLtGU}	{}	{}	{}	{}	post1
MguqgBqCIleOIqwlPNrn	Emmpot	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{cxSNHolsLpuZd37MXttH,hM8O3To0jeiJhlTV+xqM,v1wJSHFMa6mYflfbCSxG,IbdnaSDplizLak7oKfbw,EW+XOq20+ZmTZHebcox6}	{}	{}	{}	{}	post1
pzqaHQvqee/g0B3pNj46	TIL Dr Seuss wrote Green Eggs and Ham based on a 50 bet he couldnt write an entertaining childrens book using only 50 words	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{AqdYCUEoikAyOUo9DZnl,J+QHqpLNfESXSJEQw1f0,1PENH0H+njMk211TSvYI,YaLPlSQVFlgxAO/AWFCy}	{}	{}	{}	{}	post1
QER/vEICwOqelKRmFewa	My grandfather took this from a Japanese soldier that he killed in Okinawa in 1945, after he was stabbed in the shoulder with a bayonet He passed away in 2011 and said he wondered what names were on it, or who the man was Can anyone help	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{mlYTKOfXrbFWwrPYak8d,qlEjYwCypEmWsjAzGzc6,gYOS6PpJ06RobWXHGUS6,RX/Gzoe96IKoT+f+/Jf9,Wxhw1M8XWmTJ4QYmGF6w}	{}	{}	{}	{}	post1
QE5m3KxzvLHfaC1d2pOH	Simple song they said Still Alive  Portal, programmable speakers  0315	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{GS96vifRccE/qH7ZAg60,EDtrEOpsBRzipf70CV6S,oHlTk3YH3cTYesaBfANP,ibT0YpS1zc03Ae17/526}	{}	{}	{}	{}	post1
Ti8Fr7laPnUtnXBbZDIi	Why is everyone upset about American Airlines and the stroller video	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{+XGWK4kgLUvd8OpRd6MJ,IxfTyjFcPjdIYg7A6AIj}	{}	{}	{}	{}	post1
UczLXNzUKSPiBor+Y1oL	Forget Lucio, this is the new jam	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{XTz5dWWbHW57W+BJV9ir,XAPwAJSOqjK1ep6EE3Z9,SFGC5R4gKP0SxC0y1qdr}	{}	{}	{}	{}	post1
h+MZlRhovfC4aPUF81Lt	Just a little bun	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Vft5ewDclk5EtAmtpVYM,i2W3hs8PowAZiRecRXW9}	{}	{}	{}	{}	post1
SPix0928XawGZzUL6Kk/	Please dont ever stop petting me	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{vmoEK1zlUdJvGbCLaPJ4,H/1idzGK7Lzs29/ARkcF,pN5BLWwgzgNupAWFbC9N}	{}	{}	{}	{}	post1
RGadtVwgyqPcFpcIj6IX	While everyone is obsessed with that Unicorn Frappuccino, I get to have this Unicorn Mirror 13	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{yNyd38wl1E1o/T2tscYn,AOeseksHEfKAChFcOwmn,0uHtncVjEw913UuVaA7D}	{}	{}	{}	{}	post1
24c2duv4VpBnQRfTUZu7	Lowres cat	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{p/9g2oq9NDnkViKuOlcS,rL0uaR5tBHLihk1SMfFc,rIzYAwb+gIgHozzTU+ET}	{}	{}	{}	{}	post1
wwuPyhGagwYUqRSH59Q5	Shitpost Coming to this sub after being away for a day	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{WOnbY30S3oIkvYERZFyN,fViKGIb500qNwPJx8MTV,MAgxYHI1qGJmfpqnRxfp}	{}	{}	{}	{}	post1
RJZlYd9NeGndiasoJ042	Preacher on an English nudist beach  England, 1974 1920 x 1280	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{2UYySi/ozWo3KMnaqlb7,WQkuZctyhNenUu6LTb7C,TWVFVaRilOoH04Go06/Q,9TeG4fUMvH9koxbuKEJc}	{}	{}	{}	{}	post1
6c7CxJwbLV7ynVGRTVbJ	Finally received my Tee Fury Tee of The Day after waiting 4 weeks 	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{+uRun32Oa5K6lm86WRnC,7ik6MsLAt9RJEEsiOcw+,4rU02hsewte6DzcDj5ee,Qi2yZulkrDUJGlbbMCUp}	{}	{}	{}	{}	post1
L0NxU05u7Ov2/KrzGZQM	My grandfather, mom, and uncle in 1939, relaxing after crossing the border out of Nazi territory	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{2FKlmXzuVInhbl3mKIp3,xSJqyBy1KrABS2/qPoso,KTSWcUA0tg7rOwXmT7j4,5f9r5WCeq+cW3fnGbJdc}	{}	{}	{}	{}	post1
B8ymtG32dC230Zvp4RZf	Fire Emblem Heroes  New Heroes World of Radiance  0135	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{QGOdU0hhAbQm8RV2gzvo,tQYoPKQfP99NoAWsY2JG,aiTADzHgORxggiSyYrqo,c87a6wxV2Y8FK2hKRjM4}	{}	{}	{}	{}	post1
j+4ifTxeztqIKOxhHoHA	Ive been a massive fan of Swamp Thing my entire life Today I was lucky enough to grab the holy grail	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{EboLFxVh0KwkbbhHnEqp,Kwu1oifsrwRZtRe+QhDJ}	{}	{}	{}	{}	post1
le4JGLRYApAsSmKs48ld	Nag nag nag	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{H+2748Ephz79l/6oTa/7,egnslTcmk8lCHOx0HYeX,Mr4AYiMYVVOjxZpq/IxL,88hZuGQ4oITYYXyMxwWr}	{}	{}	{}	{}	post1
jk/pYGojXuQ+7VqwkITi	When your cannon fires two cannonballs at a monster with 1 hp left	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{07KqS16PBElbotHRE+e7,38c+48co5p9WyckQ3HUc,Mc49/RTwPkUyAvD8xEE3}	{}	{}	{}	{}	post1
M3/j26SVcwmdT8BK6oxI	Trumps borderwall fantasy is crumbling	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{QBMI+Yi5GKFNNg9mOb9s,eWtx4QYoaYWDzW8MD6sm}	{}	{}	{}	{}	post1
7ra24sQu++1ZU3aE7eKC	TIFU by sending the Navy Seal copypasta over live chat to a company whilst at college	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{OxGArYprJJ+u1/bDunAS,QvFvHjTfGv02PX5xyHeX,wlaQNrjROSefesyto/NK}	{}	{}	{}	{}	post1
TRfmmjCxHNcRKi0Gh+NJ	The Reich Stuff	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{rccdBBAlO+FsdQO6MK1A,KIPSOUzO3h2Su4eygYaa,hYEMrY9Tqayp29O3IgIE,yc0QweJCsrQmWx0FVA0o,ruGqo1YvfMY0mCEtByqK}	{}	{}	{}	{}	post1
FCR9FppSwAMOV+DllY4Y	out this field	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{2VAN/uVoQDwAIMR9nI4p,uk/CkpybCPjLeHL/MGbe,60BBf+ND4CSq9F6KQhFu,L8LqlogWB5+ErwAPsL4h,4j1Pjq7gmnotLbDd0GFa}	{}	{}	{}	{}	post1
A+n+44JWga5H6BY+p1bC	What 2 years of Demo Discs do to a man	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{r7nQS9Ze5umvz6Q1esVl,mIVwNMwXxW7aDgBPbDZA,3Dc6tfG++oL2yzB59LQK}	{}	{}	{}	{}	post1
zeNYSwQcreNIDwDi1Wxd	The striking technique of Cindy Dandois	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{iRwRWRPtcSvLFJ5Okvwf,U1BdDNIrBXnbG1tYoR9O,UAUx6aFwD6hwrke9y40n}	{}	{}	{}	{}	post1
ungxFy6KF+BduXSw6aNb	Oh no they didnuhn	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{lYHuj/WWK+3D8jcUOZ0P,6cmmRYfiRseNMQ3vHEvV,hnWUbZxs7KhQ1OmpDInQ}	{}	{}	{}	{}	post1
mX4grTAwwSGuecHNm3mY	Wrong Species, Mate	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{LqdaJW644jpNMwBmFn87,AoXCg+n6EttOZ2RrtA/4,xU+4/bpxwmyQOiGIWb5R,TA2JijxB1j9xfCzHnwPX,USit2ISEUlrKZ8pm8jBY}	{}	{}	{}	{}	post1
TgqEedOJM3+osCXDJmk7	Intel hid this job posting in obscure location so nobody would apply plans to hire overseas for the position	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Cgl4MYSK3zKLiX0cJBw5,kliArY8X+ba0UGinJAvU,FtOCeWe137txqmaU17zf,dfupYyye/Cp4QvIvkNoC}	{}	{}	{}	{}	post1
kWoBWJ7K9YAT1tVxGzHc	Cathy, I have absolutely no idea how you got this number	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{j1ivnSvj6m8nwQqkCEcY,g6RuHRQYgh10DOXLKdmo,/loe993pYaRltD6G7iUy,iRriPFcPb9BZ38uzwWma,4tSHJbxBzp1QtHP/Gzvx}	{}	{}	{}	{}	post1
78a49+FqXMeRBJjW84Nm	Molly Tilove	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ylSzMv45DAey+CDZqAaH,7FgJQqqrEPHyBxUk3UZa,ZVJeC3ZBzp5jB7iu7bKK,/DFHpebSdRkRttyeTNKi}	{}	{}	{}	{}	post1
5AtIOTMpR2HWS/urXzzl	Marine Le Pen steps down as leader of National Front party two weeks before French Presidential election	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{CO/U5Ojyyu/nK/o+E6so,ZPOkp/zPf+wKvypDw+9Y,MAdqwgAoFdDQNZXKIqVx,+pl+7aDFnMUhjwihZ4mG,mmO8rSAggi0GqeUCynJS}	{}	{}	{}	{}	post1
5Wb3bXW64k/0e7f57XdL	Guvernatorul Deltei Dunrii care l criticase pe Dragnea pentru partida de pescuit a fost demis din funcie	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{A76iMBmKUTPQysFjrpO/,EOpzZWxfLLFcomkRJD3H,RxDBuSS/1nEXM6e1P1gB}	{}	{}	{}	{}	post1
DnklZhCuAnke9aOB1iUI	Rockets CEO Tad Brown 1 beer, 1 hotdogs, 1 nachos and 1 soda at Game 5	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{OP4o59V372C6WacsovEU,drX10EfWpkay/NEu/1bX,jzAuKJYtJOZMC6cbwLNK}	{}	{}	{}	{}	post1
0kdDzr3LnJry8zC1cU1W	Barbara  10 hours drawing, Ruslan Pronin, Digital, 2016	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{VP6wx+JId8YZagI+sNlo,a0uHOx20qj4o64zmviiU,q+QmXZu9AZpJc7ohIAH/,BRjHCmzl6SjQguu6OJcx}	{}	{}	{}	{}	post1
wtnJ2wRu5rcRYbEJ6Nc/	April 24 Banned and Restricted Announcement  Legacy Top banned, Vintage Probe Gush restricted	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{1coUQpZ2u+lX5PgciqYB,BWzIp9eesq4cWcXhM8fL,GyVCSnHbEUcXONqTqVUu,IROQyuB+00DSKRunSmGf}	{}	{}	{}	{}	post1
XZbEc4KRdVRBOFXFk6bd	AMA Request Someone involved in recording or inserting appropriate words in Rrated movies to make them OK for TV	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{d0+LN3yHteyUdMy9jm3m,re+edqJ/MRhQj2hZWnED,4nAJBvGpkP1rmuiBxSh2,23sSFdGBCKzPZ1oJ9ueD,DnIhF21FWxx6dEqN19Ow}	{}	{}	{}	{}	post1
XIqI+cAG/wJEMy7sEZsi	What embarrassing moment did you not stop someone from doing because you wanted to see what happened instead	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{qleGd3e/wx3dV1KGgVTc,hr5g2ViF6SXuP+9MRIZM,PjGnCx5tBPe4wKbX8T8H,zSrBtK/osmMR36FatPRL,IayO84+TqPg+3Dt0UrCR}	{}	{}	{}	{}	post1
sVQv8JoUv7CWOtK9fJTX	PRAY FOR EVEREST 	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{TmoVOpzhHKBFK2nBjTts,NhAoJz+NoVHWmXmjMzKh,2d/RkRUsh0LMqscwgzT3}	{}	{}	{}	{}	post1
GOBkT6nZ4L8OZmgEnq79	Tight fit	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{17obbz68293J6Fs4y9Zq,0SGDKjj+aBCWe8S+v49f,2yYkeoEKjrPU3UvdY55j}	{}	{}	{}	{}	post1
TSom2O175aH7i2gKvaqu	Family portrait instantly improved	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{WQgCMfupy66WMQ2GaFmS,fjHYIy5I7WrwkDewm/5r}	{}	{}	{}	{}	post1
lpALzONombkrdI9rLfy7	Another one of my wifes paintings of Mew and Mewtwo, what do you guys think 	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{GAEsOkaNOfZ43VU+SYqi,LHlAZQz8j1QeVrWBXe7f,TrisRZQxAnBUTf4GSg2s,2/ILlcMgEMCQmOHN60s/,4hD4766USdvko7JyOi1Q}	{}	{}	{}	{}	post1
6p0d1p36yh6kGjexeA+o	PIC	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{RdrunCf0QSwkdI2WtL7+,PvPg44DJQdRcqH4TQ8ma,mvGA82o2go3rEQxYpy+2,BPXAbrA/2ICVcjfXT+Lj}	{}	{}	{}	{}	post1
9PID7ysZKZGFMXhcyY3b	Stay out of my personal space	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{YPGpbTqv9aeZHXxBNgIC,y90eN2IFt6lwJmUaK9TF,SBdioRVUMTzSJjoTQ8iG,ljr+mdhFYpVziaRs0plq}	{f+QS6um1Ro9J2AK7dB7I,JRACI+7yc+vMbktdgDNV,ZS9rRtw37pjpgCeIicHQ,ZHKV5vk2gxuXIdyCvL42}	{}	{}	{}	{}	post1
CV94zkA/V4uHj2SciqNf	just perfect	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{tS/HXrLqZXX1q9pN0Au7,rPp2JRdnVWJPKHkr8+4F}	{}	{}	{}	{}	post1
hqvb/Tz92YPrJQbY+zTg	The rmalelivingspace starter pack	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{hiErLS5sRYCodTCnvFKp,UhmZsjJZVv4WlzQrufXb,TdUeOvctE6l+NTeqa+R1,Az+seI8o1SuSSQQRRyot,qCRJlqKI5SXjI27qermT}	{}	{}	{}	{}	post1
g6/GNKiVzKsdale/1x5t	Hand feeding an apex predator that lived through the KT extinction	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{hiMupUT6P4eQFI0JEJ/O,m3bd7sQW7+L4kvnenwW/,G18ix6vkuQecwntKq0id,i3hMPG4Er1bhOwLKAM2D}	{}	{}	{}	{}	post1
Ww+SwPycvd0cdKnIAHGW	No wonder this guy has a 284 KD ratio	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{+sEHDNof7aWWC8EoBxv4,lwwEsYAwSRn+J1aH9THY,GmZgixM5KdQIOJED034k,mcenfFQvfe6+HtlDi6nO,ixIL9Mjkg5pXMoJKWxv0}	{}	{}	{}	{}	post1
jp9fgwOlSHGmsJE0bYvl	Kendrick Lamars Humble Hits No 1 on Billboard Hot 100	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{47QCnl6M5xcfx/7JQPLW,UfOY4Em/+WN1JRsKQCB4,Yft+1nBpSySIc73d2p2C}	{}	{}	{}	{}	post1
laOPrsD3+7NQZY5NzCoP	I know someone whod like this calzone	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{hQiim9SZXf3A53sKVV7s,iT2gB+p3ukJFjLrXtj5g,JjC/itpupsmOVSkp99g7,mqkwLmj0/D7veSchx47h,9lOO7JWbVa3inl8muySU}	{}	{}	{}	{}	post1
0NSoTy+0pfuOXb8lFv4E	So I just found this amazing spot	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{iLK6rVguzv4OoQSaLlM/,uStGrI+zh7bym1XGvdqk,LSQjMJnEo/dttvvPaYNd,LQbOu/abp8HBRy/uJQSo}	{}	{}	{}	{}	post1
JOlzZm4MXf39utdNmLLR	The future of VR porn	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Ba8V08FD68LGex1iBNLf,kwJpmv1tag0MP8nEm75H}	{}	{}	{}	{}	post1
OKyyiU0t3npJlMr34VoG	Too chill for thrill	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Y6koAAYc2gsoRJIOElTL,JiNYR0ma0bGOTJs/+PwC,BIFMP+7GlnHn9oSU/FtC,N+LmC0JidPJcaPkMRKPF}	{}	{}	{}	{}	post1
xpf1Shnu1p1dKY93w3Rl	46 Countries Offer Free Contraceptives but Not The United States	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{f9X3wDbHQXGYcv3GezKp,IwR7Uh/6RMRaQ4zWyWT3,8bSqKVPbfl/H3z6TTdEW,vrYP/lV1KOr6rkUHp05b,MswTDPaIW0ykYeDnvcry}	{}	{}	{}	{}	post1
wcBZD3vVwQN69RQpQ4Wn	Incredible but humble woman on DeviantArt was a child prodigy, fought in the US Special Forces, has degrees in three different fields, is descended from Spanish nobility, has met the Pope, has been on television numerous times, owned a house when she was 16 years old, and much more	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Z3HsHnW8omnA8I3oFCqr,Kmy5Mv4Np3GALVdvKK1W,RFu3M1MR0kacskgGt+Qr,b7IFvLlhfkJs5OTpSoZR}	{}	{}	{}	{}	post1
mYExKKMHZR3kXvZZY8Cm	Free black walnut anyone	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{M2it0QzxsfRPEZ7ePoPO,cu0bEE4XZ2/Opx6Zz0WY,Dia08xcAhdLc2LhDhquY}	{}	{}	{}	{}	post1
BcSrc5QQHlfh1XgzXAWw	Just when you think	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{RuJ9GFrkkpPK/G8+RQ+8,Gi8Mpd8bn8DCdfLawr+O,3DQ4lrsU4xVK166Exjqp}	{}	{}	{}	{}	post1
FsHA/yYzkyrvxjDL7jmx	Veggie Dumplings with Easy Peanut Sauce	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{kzQks/VPQlJdCOVGBizg,Nutt25VaSFpuyfx2aNsu,0v5LIMuXt8Kg5C1niqpT,laxct35ejWTNFdRtspd7}	{}	{}	{}	{}	post1
cannWQTiwmtyzGFwlDTO	Mantis Shrimp punches claw off a crab xposted from rgifs	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{UZSLyr2BaTkBi1DxT0b7,5tbw9jI5act9yqyRwUye,GzgyRMogFBGXF8kE3eMh}	{}	{}	{}	{}	post1
IZC4iG5HH0RGGiQcOMb5	A Glitch in the Frontier The Patch Notes	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{p3O9OJmZ30nAmzjGkHGS,qROgdsgxenD0zN0X0IEj,upOYRh+wgAQ+qO6C71/g,rolcgyePTZ9U1hiSWlF3}	{}	{}	{}	{}	post1
PUepN4xl3NZ9DLebk1IB	hey goo, whats new oc	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{SWjwVGA/5Me/jeigpzLN,CCzAg5BvvImLorrqEBAa,wonsMyS0Pu8YYag69NkT,lOLYo/vj0ogFXGmlwvQr,XgDorlqqHgqLxkDUymaL}	{}	{}	{}	{}	post1
aGjYXwObyvnJVtLVGYCo	What 500 hours of Fallout 4 looks like	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{kLKRC6rhJ4nuCPkFqV+j,q6Pvbo764XUnAATyqcqp,NqgCOzYRAWMBXxVsBgIR,JEgL2imSqX22d9C4XYZS}	{}	{}	{}	{}	post1
1yVUMqjG23kktwrYcfvZ	Is rAll trying to say something	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{3wk5RolzLDEyuA2dn2Lp,rcK1w3qi/CSEOidBMRLn,77Md7NZt9FRF0Sh7TSOd,uzd340PottN6Zkci0SNI,GzPmWoQZwLIYEgTiDo4+}	{}	{}	{}	{}	post1
Nhjw4XwI181eyg+T6Y/h	Nautilus table by Marc Fish 800x533	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{eYbsfYnBhnwjAEaEhTnw,CTttz4BEtRh7XHi3VJ7S,HwVSYJBkAfZdVsmD/SQb,192vv44AG+VsMZayWhHF,bP98ak1INfYsjho5am9j}	{}	{}	{}	{}	post1
t/Qp+NsPlhH4+Tl9/+zo	Our Dev Team vs Their Dev Team HOTS vs Hearthstone	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{quX+7G28sIYb96O+vdwr,rFVPUYlOIvQXQAMFnPXF,gnNZ1GqFPDB77f/rYl1Z,Owyv6l8ySIlE6d2dDSqu,PO4/JGnlb4/DvpSAB7+s}	{}	{}	{}	{}	post1
Hd8N9/oMVmZQvOdq/fZz	Collecting the leaking doggystyle creampie in my panties Big load	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Usvqw82pW+0dL3V38Tva,lBhWlK6pYMfzc0qOSlp0,EbxdkbiND+Ssz/Wc1rgP}	{}	{}	{}	{}	post1
HGy5qKtixcrZTyVQk3lH	Blue Thong	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{DLbdn9XZHAKf9IyQg056,czsjkvt7Xps4ZtwwajTj}	{}	{}	{}	{}	post1
gARnv45PiZksvoIJaTf3	OC In an attempt to direct my murder hobos	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{IM8wlu8rSyBWeMY7flsv,Zo29mRtai4R/+Yln3qH8,hFHa1Cmb06/+f+9Zix4j,hxYgdWQPENXg6MxITfOR,heysp+H7cjD8MZjqaqes}	{}	{}	{}	{}	post1
aKibXbmwRjGZbincWFUN	If in Washington DC, I cant recommend enough swinging by the UdvarHazy Air and Space Museum Right by Dulles airport, its crammed with planes and spacecraft, from the Enola Gay to the Space Shuttle Discovery	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{n1iooO80V3cpXY3GdP6B,872n/H8xMSNaIPM/X4dc,V3eA7i8kclaYvqxJbuo8,nVzj97kx3EWbZo0yxSHK,CuqopwBVujva8niVY2e4}	{}	{}	{}	{}	post1
B0vIkryw2gzIwcN14/Yf	First night home from the shelter with a cut up nose vs this weekend napping on her favorite blanket	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{FiI/xF8+5Bpiehjm3bh8,QDMt4eCRDqmzExbdUQAc,huxYEQk2OkVCKCme0zHu}	{}	{}	{}	{}	post1
aPDGLrRUB4meVjgwSXMV	You gonna eat that	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{BmJ26lNt/wQnM33C3rM7,oHE6QrpB2JWsPfVK7p2R,3qNCLs0R/PQaIKTPlegI,AxHuYzflGzeWV74MeZlq,qRAtUZuPIn6Ze3qQwGUf}	{}	{}	{}	{}	post1
zj9zjQd2YzyS/PIoQzK/	Does Donatello deserve to be a Ninja Turtle	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{3GNm5ZsFFDUNYIU0TZ/D,RxJKG5QQ+lmmPVDZCVeI,JAIMNzXMTfbhNlDTYCEv,D3gtzmW0Lr0ozS5R2bkA}	{}	{}	{}	{}	post1
LB2cJljpW4d4pE2Ds0gg	Singleline art	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{sP8g+cJ9WFZ74jLWO6nY,XOzKy+VvtdU3gL5KAjEk}	{}	{}	{}	{}	post1
WoDRA+j+ATuPuDII3h0W	The 203s are hot 1000x667	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{DEKrcYlME0bsn3f356hT,AQDxpjW0VzP3E/q2V9fX,DVyb0TlsUSuCOq+N26YS,OywY9Nh4+ldwX4PfdJCy}	{}	{}	{}	{}	post1
GzHTBQ++NW43kRFRZ5FD	400 hours of playing against Genji	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{olhqDYe+9Ww3y7HWASmg,IQx2apFgh6LpXIVDmGmj,RS8mQ54WpgON4hnmh3cy}	{}	{}	{}	{}	post1
SemUrsHT7EdO+EMDkrkX	Pagani Huayra La Monza Lisa OS3064x1368	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{mROu5y62xfObHyy/PEP7,yi1h21gdDP3gKnMFuLKH,pK+WXtDtjsCZvHLcDfDU}	{}	{}	{}	{}	post1
CvsbSQDYtfA8zrZnPe6L	TIL There is a white man caf in Tokyo, where Japanese ladies ring a bell to summon tuxedowearing caucasians who respond with yes, princess and serve them cake	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Fjc5QL3Atjq37nP9LLhj,QfCoS5cti0k8EyXv5y2m,N8Dl2pBIHBl3ijU5PP4r,kNqLGAKdBrzBxMJCQs5a}	{}	{}	{}	{}	post1
4vF7okM8tNQczNYSx9QH	Guys who go to the gym are pussies	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{orUaG0j9dmM9gP6VPwts,wGvOwAJfzN7iqewHNQN1,q4TZx3iGQVjwQXOZwlyS}	{}	{}	{}	{}	post1
/HbDAxDTaPCsDW/pnuVS	That day Jack was given a grim reminder	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Hl8OzarA8KxZ99op7OPo,0Wmy9mrJRpLnUwpxPgaD,bC+WTG1fjinP7Iihlgsf,MbU+FIWxwd5ui6bUjjp+,k3IARvb0QYsTSuJGjhYE}	{}	{}	{}	{}	post1
3X9dONX0LY0emmuX0eUz	Just ran my first mile ever without stopping	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{NGhn0TAgkZTLvM07bAJV,yLU7SuWnJt/IRaHjvAjY,XRYZNzoMRPyAULjomykQ,MGSYx5BTU2tIoH6hVNc6}	{}	{}	{}	{}	post1
Pp5r6s9stYSZgMkZ/5oe	I took a minor spill biking in to work this winter, and tore small whole in my jacket My friend just patched it up for me Im very happy with what she did	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{GQZWn/vE/3NZyufgUhJc,UBKZNCzRAJl/I8tcNr71}	{}	{}	{}	{}	post1
HYgifAP03ClpWYHs1khi	Yet another nip overdose Completely unresponsive	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{6YvDtA0iEO8KmZzOzM7k,Nh/U0yzJmRaBYo75qAxc}	{}	{}	{}	{}	post1
LMmZ6EzX1nfSSh19cInl	We graduated almost 8 years ago	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{LtLiSIH2xV4teJGaMqMo,+LKm7BPmYV/HXhyLkmS3,LWR1x0QH0KCCRByiqdTv}	{}	{}	{}	{}	post1
8Qv/+tJ0qfJMUx3ZxvpC	Coming down the stairs with his prom date	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{6985YbcH/TdV67rR7l6C,uvA7Yhs0fgcG9CeSYWRX,isWy+Eb6sI9FpT2LfxJm,2PZQvAldC12Q+XwGruKo,mh5HHQuR+umlyBWTQeNW}	{}	{}	{}	{}	post1
IY4k7bB5U+EkZ2Qn/2nU	What magic is this	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{qRes89lVHcK9ST/d18vX,MBC2N+2rmsGGhvLWsijQ,Rc4BHoat9+DM6GpVylwi,7/m2Zq7crJeQkUOS2djR,UEjQiw9WvGmC7w7K7zsf}	{}	{}	{}	{}	post1
TUwlpMuG00jsAIYle4VE	I Should Get a Boat	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{7OtMcnjAQK2p8eWsREjv,p5ZGnHBI+6VJiH3VAkiX,R0TfaUA8AfwC0kBsCMoT,48Ixhzzx+xPpjHn2FanP}	{}	{}	{}	{}	post1
eBS4D67nfeXkGdYInKsS	Tonights signs for RAW in KC Combining me and my girlfriends mutual love for wrasslin and Spongebob	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{pVc7FnQJxR0sgE24yXXR,dPT1Gg4UhNnWj92nUG1k}	{}	{}	{}	{}	post1
nHh8alY9hEQ6/jWDV3Eu	Cool things I see at work 1944 Enfield No4 Sniper	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{SI9ZNKglfYq/IA+z2bBP,MIkxjGMTNq77Ob+CisP8,RSFOF9cf4LmrQTMkbgkI,CsY/Mmf/0JLD/pYTgPHe,236UlqOB5o4+6cd2TXXl}	{}	{}	{}	{}	post1
KDKFvPfKSPlpKJxx1qVu	Shaolin soccer in real life	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{nKXBQBE1ggXosOCmZ2VN,PoHee7it9+rxBeEws1wn,Lrtz+XPKQozsxxWEgTYn}	{}	{}	{}	{}	post1
QEY68y2xEetxgT7qP8tN	Six months of not believing Life is beautiful	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{CwFv6/IZokqgesb0Pil8,sB3xz25huMUHvVkxJfFr,TQnywFBe3+MfpmF6cBzJ,/detet5MSuuEB0IHb/8j,uywXHGbXHNk7pWUA49rX}	{}	{}	{}	{}	post1
ZE1MEIAaV5uvjhiv9rrj	Tank and Jeans On and Off	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{9Dhi6hfOV1HDutDkTksr,CWVzjZC2Ab8JpfdmAx1Y,9qGfGblhfROmSJFvW1hN,mVOKwyWAxy4Ujo4VIIAO}	{}	{}	{}	{}	post1
4hD7zTOsl4VKDE38IGtu	The Danish Language	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{38TbV7bJyTWn2JA0vIR4,yPyifYJXkkibia/+B4Tz,L2y7uSre3q2tCockggkI,TIXbt6gVtWXYLFsTyD3A,27KMu8iDPoEU/nCHxRAw}	{}	{}	{}	{}	post1
39cDe41sSsEr/lK5S1Vo	Our little girl turns 2 today She might be half cat	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{qtNhYr2LuCTV5z572iW7,hp4GB4pcGl8d9oEMUd79,Bu7NDpJsuDbe60h2FxmA}	{}	{}	{}	{}	post1
rSuTrmYO7TdYcpi/YLmk	My girlfriend was just messing around drawing random things before work and came up with this image of Michael Myers that I figured some people here might appreciate Considering the short amount of time it took her to draw it I was very impressed	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{CNle5m9hK+Z959eQn7da,RpEge1TXuSfVLymPq8BR}	{}	{}	{}	{}	post1
KG3vCwDgqtP5QHqbA+vS	I honestly dont even understand this fucked up shit	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{XBqdtsPdPTNWtb02yaEP,M+VlKOukNuwdv+/Rw7qP}	{}	{}	{}	{}	post1
HfCm4BtERVRsbDhb98UZ	Prosecutors Inmates water cut off for 7 days before his death in the Milwaukee County Jail	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{mcXI3Zek593mkhoyqAu5,Tv381WFzzm1QTgV6SUXw,uLizRMfKJ5wk0vzRLyHk,VGLnpzZvVDRBWJUkkXJY}	{}	{}	{}	{}	post1
s9YxFFx66Y/JlQ6bdzym	rthedonald, rpussypass, rconspiracy, and more are currently vote brigading, spamming, and harassing users on rSyrianrebels No admin action so far	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{R0uB/0LBnOGCQCvCFnw6,041kF0kwSdH8jH/M8Czr,8VVU6UoVpom4xl41scIK,w40pX5j4/6Jwdqcu1BVj,Pc73HDTy1JzreyMBHNGm}	{}	{}	{}	{}	post1
++w2i4ZL0tNtE9yX1zRw	Let me give you a hand with that	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{bJt/BVh27m3n1BrENtPB,AdzOfHtBpYaPybmvrayQ,OQqNzwinZXyVwsr3k1NP,9oKJ8Q9jHPz1+p5KfoFx}	{}	{}	{}	{}	post1
NwKr3qJ2d0ay+aIttGZz	These frozen peas in the shape of a frozen P	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{D64gLC70S2tN/7X2IRUi,q6z89dfrh2yHxuc7HZ0j,nV44NCz3m+yZSz31qJEc,HtKH0vpWGetGwONjW267}	{}	{}	{}	{}	post1
rLeakL8zAPimGnvBTUuH	The highest and lowest elevation of every US state	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{pWqyhICSetD33B7MuwGH,+4oOL2m/o0Ws4snzGB6F}	{}	{}	{}	{}	post1
3WjXm/DLIZX5tqBVnVxl	When the priest brings out the big guns	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{CZKqkj1+Oz+nF4bI7h9B,/tP4xAf0uf4mv7PQUSTo,u90YConWgc3EIk5MUyqY}	{}	{}	{}	{}	post1
I7XHsAEyKo9TRYR8CnQW	Im Steve Huffman, programmer and Reddit CEO AMA	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{OuD9kBoYFBORm4Bf6evw,RZo4w04XcTptOdS1lzwo,Ef0TVjqubhfmzJcA44Fc}	{}	{}	{}	{}	post1
wA+nsnAmde7GMr9UqQN9	Dear wife, if you see this	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{5iVXwW1sOZdiTf2uVdpN,XF0NDg/bDsAv3R2878kc,Bio6LQQ52IZWUxPjv9dP,jZ6zXWLk3fizgwLliH2Z,iciBKY6Zd23oO7Fj9uPu}	{}	{}	{}	{}	post1
S8u8+4NCKCaySJsQuKaZ	meirl	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{3emgC4Favms5hxxEp0to,fKkmjqKepUa9gR3Eu7Fa,mXMHixq0o7MkC3YlhnTb,WIWzRdknbTkVLciNJ456}	{}	{}	{}	{}	post1
YLN08iEuZj4o5R4ynFgJ	Touchy Feely	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{+jsBP+8tq55x8uCWFRfS,YZJoGx38JoyFvf06u7i5,jP0R+gng++Xq6/lNTIDs,7UKfrNlVwC3/ezIFVZse,RM9E5QHf1K5Qqu/A2r5m}	{}	{}	{}	{}	post1
ZlZ60XqY2/jvcKbxaFU8	We are in Season 7 and MSI is still bo1 Isnt it time for a change	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{8158AtLmg33UiAVLt8U7,eO84ZMpiBKZnoOUk/v62,JW31X0alQFUsprGjNspF,wc5LXzdtGlPlxxPychp/}	{}	{}	{}	{}	post1
C2xfD52JW39BNy7L51R8	Imagine getting used to privilege so much	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{AYZ4iR7MRNnu2lef1KBI,PQCsarcNUupnJKn1h9vk,l4QhM/RK3AahbvjIe4Iu,o1GEQq6DA/GM7BwBkTER,+TV7PWuOtg7pZUJQu6NU}	{}	{}	{}	{}	post1
yCX8PcpJyMC/0fSa/UEt	Sure thing	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{B6J0LKiSESFGjB0iWB/7,zs4dxfE8Xk59vlSLLI2E,+dXpUEnt5cnoUiVX+yGX}	{}	{}	{}	{}	post1
fsjDaeRHhimkDROH0uSo	Stopped Talking  for three days	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{xV2XnSOYaKYtSEn8B/Uf,Prqg2eWZQ65VjIIk3yje,08YNFlvrxQlP/AQ7HKSB,bt4P1uJJplA5I3cIU6OO,+JQkPiUjSnZFsY/l2pbJ}	{}	{}	{}	{}	post1
kgGTDDtNbiTdMIlT7tpb	Thick cum on amateur brunette	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{BsCV80ffoCqSsevqsh9E,7DiJwWlycW3/8fYRWtHq}	{}	{}	{}	{}	post1
dj0yIOOu3Cc4exMrvCvr	Ethics Huffington Post Editor Resigns In Shame Over Hoax Article That Said White Men Shouldnt Get to Vote	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{suOgNXpHoBd4qsoB0d8v,HZRXEIRiXucnWskQzzKF,QeyxFN3KUyZjLsqJLWMQ,TbTcPj33kZimNGVjkY+P,1kle+oSO451mhI71Yuc8}	{}	{}	{}	{}	post1
G7CHn9TOjUUnhyYVmoZG	Helm of Raedwald	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{evF11mDeZFqcRhYC575j,PPz++9sO8TrxQEghug8/}	{}	{}	{}	{}	post1
Py7ahqrY/1JieQPbPKHJ	Undie Monday	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{T8R83GcRmnJY54bNMUsv,rXNaOAH87HTajDZ0h/FF,52j2J2Xgh5/WNXVusNV0}	{}	{}	{}	{}	post1
f0qjb19SRn/DnfvT81V5	As an Australian born Assyrian, if it wasnt for this man who rescued 50,000 Assyrians from genocide during World War I, I would not be alive Lest We Forget Lt Gen Stanley Savige	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{pyh2UyZ0x5oOvgu776E6,2CE5gaxVGmGQd77YW06+,8IWxW4VuiDCagKQDPJMF}	{}	{}	{}	{}	post1
FslrTC6TqYUZ1P11q9Or	Hair Up, Girls Out F	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Di7ztgGEqYhSYvlSLVgK,jCvjv7V8yIg5hPYoafwk}	{}	{}	{}	{}	post1
5D6s/vZh8AlWzlV/nXj0	Thought of a meme last night	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{k4HJrFGUjP4sNJPsRnie,F4fQpYmJmDbdCiPHp64p}	{}	{}	{}	{}	post1
2lIo9jpuu/L5ekctK0hw	My wife is apparently friends with enemies of the state Please advise	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{7zkqZOvxvJqH0rMtywjc,T2rjxlGgeQrkIzsIymAk,O8GkZFk2Azd7XyJt9BWd}	{}	{}	{}	{}	post1
xCVXYtEzQebsxaDah2vG	Night Time Stroll	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{SMGMkoeJgqG5PmfEm5uK,0gIFJ5o25Xl5MMIHs57A,e0BZg9y+kU06slKIdF6D}	{}	{}	{}	{}	post1
fT7RpAWcTRVT+BYCfX+Z	Deadmau5s put Sauron on one of his helmets It looks pretty cool	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{lHDbJufsZ+JyKjYiPbOk,mP1j2fNRu6zVZf6jrI49,ydHHkAlQR52bz8uF8G9R,zY2W8cT4YcK6gKr5XZVs,VY8YBPEW7iPFoPKTXAlU}	{}	{}	{}	{}	post1
VYU0Y6j2zI5AaOt4+lbk	Kripp will hit the button at 1 million followers	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{LbD3G0HogysW4FFKvcpK,unQcao3dvYZ49SmVvrIX}	{}	{}	{}	{}	post1
KhReTUGJJqO8kWa5kgIs	When you close and have to open the next day	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Fwi66eticG9BU/cX7dys,sv/xFZWgXZfcZXECxXSn,Wq03R4y/G5iM7PJzuUVW,TXvB/pWCXkK81HmPn4G+,VVSpSfQwaY8Ht46FAzq0}	{}	{}	{}	{}	post1
3ivc9uCjilsvumU7Vqbm	The most intelligent man on LinkedIn is looking for an equally smart partner	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{H5e0oyA5Ko2s4BlulXhJ,EK0to4DMcCHIHNC2GYKo,JBElZGvHYpaBWSEuhshS,mcY4xVIIfWOg2JYJY9R6}	{}	{}	{}	{}	post1
wMmO8kppsab7n1WjSE/B	The Apprentice Official Audio  0356	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{G1mMDHDvs+B/cCc5CzQi,WRu44Ro6lG+ZuUPZEqpr,VwAtT7MapWZzqGj2kXum,PbjXLBa6os1ixHYl7JFz,enmBa+AqqzcLUmcM1ece}	{}	{}	{}	{}	post1
u3ZLZ1wSaBUI1ir/s87f	The Doors of Kerbal xpost from rgaming	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{kn1Wc+X7d6dxGPZTSupo,M6sPTbukVlrqDW7uUw41,LiZS4YxcZ+aEzxdoRoA7,wRBethSXkgpZDqSUDwam,2J622zIVp4Duf7zQTVlA}	{}	{}	{}	{}	post1
QA++Kdn184yTKqKfTwR9	Rafa Benitez and Newcastle Have Secured Promotion	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{9esaFuHTWg/hL3IpEvjP,oIG2oGAYd033p6UnohHj,yY2I+05rTjC9R/mAq0J4,H/66ndqCuUYrSnD6dLw2}	{}	{}	{}	{}	post1
TfV8Rj5vviivHod09QWk	More than three months after Senate Intelligence Committee launched its investigation into Russian meddling in the 2016 election  the panel has made little progress and is increasingly stymied by partisan divisions that are jeopardizing the future of the inquiry We need an Independent Commission	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{FTCt8w8rsKcLtPHRW2gF,ha4YK+quXGYJ90HAgTQ3,VNAeQecyIRUMqcKEn56G}	{}	{}	{}	{}	post1
TT6lV3Da+edmBRtegDMW	Doors in KSP	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{pnE5C4pQvY2UJJ2hhw5K,oSxFAiuuJdm4lwcgyQup}	{}	{}	{}	{}	post1
J0WjYEjcW6XxMPUp/h4Q	BART takeover robbery 50 to 60 teens swarm train, rob weekend riders	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{o19Gs5fmaymXgt4wB/cB,KY5MDjPG2LZRJR5TBf3d,7hnVyv+hLvjtSRCotDM3,FPILux4VyZuCq8hc5qnM,HZ05Z65ukRYnTolbjN1g}	{}	{}	{}	{}	post1
NLUV9IYvt+YVxZReZ7bu	Dont you wish Melbourne, Florida didnt exist	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{4J+f/pGx7ubWqymQelNP,tyvBXCEUqQJTonkAZeRu}	{}	{}	{}	{}	post1
esk7+l2uhMtsgprnpuuW	She can fuck my ass anytime	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{EHgAyIf7QsWTFEyp12c8,WIL5S+QGXX9cahY6V5Oa,EpRk6ed8yUyc/T2MRQ1E}	{}	{}	{}	{}	post1
CDjW4fVWUlVAY5ENtqU8	Ouija, youve helped us so much, answered so many of our questions  tell us, what can we do for you in return	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{BAECOeO/4gx2oQLoKTeP,OwTUlNAABTpX2zouZEh3,8TZCL51OTGQ/X7OWbIRO,wTbuPzBu6JxHNEmYIAwI}	{}	{}	{}	{}	post1
JiZ2D82AFB4JE3RV8V2r	Canoodling via rgifcest	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{zPXCjJgVZitg87Y/tYxr,2fyqJi6qkRMuKW9FZ2Km,yWZEvZB84LnSsmuIZkYd,hTePoGbfKvhjlusQztdp,BgjkR+09I6Xe48GxYVp7}	{}	{}	{}	{}	post1
BUhTnaIig/xdOm8Ttc0i	Look at how beautiful I am compared to the Jews	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{dw2F1CVov3zyisOpHBZc,KdeChjAY/7GEDo+dmVgu,frHBGMExVfQm7h2bflpL,tTH6l8ClrnKDPBK/v4sp}	{}	{}	{}	{}	post1
yM72CTeWPZWaxu/bymH/	Companies who give candidates homework assignments knock it off old but still relevant	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{IZByK5NJvHyl+YsuoVDx,DGrgyED/G3V58k3R+dZ3,0mcQvI68kQOiF/Vhc0u7}	{}	{}	{}	{}	post1
rx8uS+H3aAhi2J41Qbb4	Cookiezi  HoneyWorks  Akatsuki Zukuyo Taeyangs Extra HDDT FC 9581 4 776pp	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{43MhkZTgc87GA1v/tswM,ZmiU0YhSYfq6+ieQqZYv,jU5DPmWxJ9iznTUHrPQo,PrrmuqJN6ZT6XY8wuykQ,xhqbOsuqApatQfr2ELdq}	{}	{}	{}	{}	post1
y9S8oSUVDEAV8zdbB1bd	The DMV requires a lot more time than the time it takes for my clothes to come off 	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{wV8wDQtEWGuhHQztlRS5,f/en/12CbWa6dr53ReU0,ALxSkrfI/nEfCz4m9Unl}	{}	{}	{}	{}	post1
cb4fsSmuKLOvsa9cl8wL	As US prepares to gut net neutrality rules, Canada strengthens them	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{0ncXfFNXidNjI7Sek7zW,m6WlfZo2cGF5GvqkGm+w,XDCzJ/jhQ6qyDxryBDka,6Mf0n9t9gx1/KyD5hSqy,89YbmDH/4aF5tjrDBoOJ}	{}	{}	{}	{}	post1
lC5a6Rn8k0EQ429xr5jH	Enjoying a day off finally	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{phJ37zi38Bz7obecUxfi,NKafaOZ0YyVGmFLWNdVo,UGOa01kN6fL7PwZ+w8MA,+MS/Z8XsV8zZY5T0tvzt}	{}	{}	{}	{}	post1
4hmJ3xoD+cikoQ+/ShBx	Wobble Wobble Wobble  0037	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Yu51cjATfDXzSV4VRsHg,0mFZi/pWRWxHYZhfvuj3}	{}	{}	{}	{}	post1
2PerRxaH4fK6KrGP5Qwt	The SU Community about the second, happy fun times promo for this bomb	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{SeRlAwAycwrXtjlOCBJ5,A/py4Ru8PaDR0MzuRzor,W13eQ3GxgDBUqqDkHRCI}	{}	{}	{}	{}	post1
wk+dIhfirC+e4V3Hsi/F	Ive been itching to doodle Palla for awhile so here she is	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Q4UQ+K91TM6c1bvYOsMR,TbXtfJ2e2ArtrAAVRliw,XkFSxAhtCijLJZ09YUiB,ZMpu/hSly33cO8mo4rZT}	{}	{}	{}	{}	post1
IStaor2VZBCC4YitNlq3	My Cat REALLY Likes the Sink	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{KWmj77WOWQ1Sdp3dJcYz,9UYFAg9MUBq2SAHL8eC5,c/0hlUi+M774p59qUNDV,wsmyR1UzSdKDQCZaWuvl}	{}	{}	{}	{}	post1
hzeqvgFyWhnRWTclKHqy	Iconic	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{DsiyuoUHfo/g9eGd5WpG,QmR1wsaqI2k+9du5BcyA,1VgNV1r7HoTlMmQCVRcu}	{}	{}	{}	{}	post1
YyNILZgOF/StfrrXbbOx	Catching up on Doctor Who and my 3 yr old plops down and has been glued to the tv since the episode started Victory	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{fgupWkLNq8KHtzgaQQ4r,Qejv4KvPxeo1U88CPhNl,/41CibGubpKnw357n2IF,KwAMWtT3I3x9w9dSCxPC}	{}	{}	{}	{}	post1
06JaNcOUnLo4c+wfGISx	Trump admin considering elimination of tax deferred 401k to pay for business tax rate cut	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{BEQ9sgJQc1nuSBsi0b7p,FpG4q4TBwd5V8NEd3+hV}	{}	{}	{}	{}	post1
oFHzW7M8uHrJzroQVXxH	Franco Noriega, a Peruvian chef	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{nVnVpI3bdBSJZMs5MHLS,USFBedQ2H61GoQR8h25T,z1FTY3c8gQ0fhznNb7aV,YCQqMssekcuTP/ncKgFm,y0LpflTMt+RJ2Z0eZFOD}	{}	{}	{}	{}	post1
jbhoeFjdjBV/VrTmAQK8	Need Deck help for Leovold	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{QHYinua4Ap7xBigR8zKF,R+wbLnAwalJWtqYWt/YS,Xnz9sTgLH7WGLUhkgAcS,xVqZ0cF1qKRaF4W1pck9,g2Ujh/m9l7++cDmns+eZ}	{}	{}	{}	{}	post1
mLV7ekJBzLyXyCmnU2g9		f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{42uNVpdRkAxxEms6lLh+,Jl5Gym7IJs/tKHEOE6GZ,k7ygMcXR6z/3/RM3NN/B}	{}	{}	{}	{}	post1
uESzXMpsf6g+HEvMWIA3	Coming down the stairs with his prom date	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Qf0N87/F8JMH1trahV+Q,r4qLVK99mBoncMj99qzu,gzKkMsc6LiHI973t56Ez}	{}	{}	{}	{}	post1
5M0LYrIdTR+8ShtcGCCq	The Burbs 1989 811 x 1078	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{uUfQl6BS2QnmzL9cvNKj,iWDxhd0cRLaeYC9sR+9f,ijdwndMHhnVh7784Sizu}	{}	{}	{}	{}	post1
e2XpYBeA93QZ4s8yR4a1	Having fun bouncing in this lingerie	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{EGfaanmRvL5q0NBTQw7Y,AIwxwY12JYl4q0jQmGP7,B2OR9yPtKUCJ73PcAsjD,A4C/Tlc0ptrCLnM3rOwm}	{}	{}	{}	{}	post1
j8wpHa1dz9/2R58FIjas	Stop Using Unrollme, Right Now It Sold Your Data To Uber	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{H5OQb6d+4Yb5lW7hvSEh,cguDnM20ek+wnKqeaFXu,cPezoEfJFcEkSBUJBHze,p9LgWfYThlqZympx/Ga+,TMtBoSlaV5uNsIvj+iX5}	{}	{}	{}	{}	post1
idh9OQ6SIbE99dmoxoyD	Pro Mode is extremely helpful for tricky shots	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{r4vr7VJULuXSkuo31pY6,ETAIiQBqNTmYlWs360Jr,xabBPJpgGvfcZwcFAGhD}	{}	{}	{}	{}	post1
gerwFbOK7rj2/sxav7TM	Mate snagged an ultimate meme name while we were camping	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{w6dEXgNHwZtu2+eg/JXO,GORsiJMeKdwGUPkThqXC,pVMHs3h/2MkmILyn8q7e,GT7JFugVZsYv/JLD7zhU,tBJfZvxcq4nSgeZq4z1B}	{}	{}	{}	{}	post1
2Zd5j1kN3amM0c+EavdD	Was told I should post our Maine Coon over here He just turned four	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{gK2SL/0ILt//zhmeUi17,hWsdMgOgGV2pKYm0yINL,+DCzKLhlkV5tryKQeNso}	{}	{}	{}	{}	post1
xqV2Sb04tBodIPV9twXY	Fan Contest Winner Playing in the shower 	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{a/wi5IC/HeWBIc8pQPCL,yO2I+QIWdezyi1uVJXA0,nQZMH44xsmHnT2vrNK2N}	{}	{}	{}	{}	post1
+EdbyY8N/olnsFkkzbXB	Tan lined titties	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{beXtkC9fjfnzv6xQXVp6,6BanJCYEcK+VNt+ziuik,oeVHIbsI4ulQE3X7Xldb,MrvYaLKQOlwrIMxkJPOY}	{}	{}	{}	{}	post1
5stfjY6aWZTAxdIjNLa1	Young Shaq brings down the hoop	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{1SSJP+nh1dHPDbSYj3Ba,b4tciEw0P9pLN+xo6ADI,lw48LAPjeGAlSVTiGmBY,KgelwQjB2mRvT/25061R,ybAJuudCH44aL4jb0+8J}	{}	{}	{}	{}	post1
xQ4VIObpxRMVoDYyfnW9	\N	\N	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{DnuD2oqLfhpgiUrchdX5,Sl42mZLa4n4EMk7+L3f9}	{}	{}	{}	{}	post1
rG7vZSa9UQgShn+W+tei	I proposed to my girlfriend today and didnt get to properly thank the stranger who took our picture If youre out there, I cant thank you enough	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{I8qUBargTAHQGCVh6E3F,TyXFUeR9v58IuTDDKi79}	{}	{}	{}	{}	post1
W2KXCA7472xMrzBBvGPG	Trump backs away from demand for border wall money	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{MAaAao/wcohzOoAQJ3zK,ra0DJXyhCeu1HqHPEk/c,bFpnr9Dwp+1AiDjiZBOy,vXKj9KAprbEJ26vcaQhe}	{}	{}	{}	{}	post1
7BUJGDYu4+xTYa0TGn6d	hello, world	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{M1B1TaQVONqmXyPYkT2h,9qnnS+i5C5pPycRcKG9/,VAR74kblRb6aGtRN03C4,1gD/0CcplpYHnQOrvdOB}	{}	{}	{}	{}	post1
7Y9oYxgh2XWNn9bU9klP	hello, world	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{te6i2m4egwcdZBV4PTb7,KpfqoJkvQHPYfG7LlFHA}	{}	{}	{}	{}	post1
nvIk04BQnftTiCJhEQzy	\N	\N	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{LcvTmLxbh8ic0f5wLq/S,VvzeQiP++vYCJfo0Mf99,5ryvuX132U4xLz+sFnYG}	{}	{}	{}	{}	post1
tBDb8F150sbq51wCVjVP	After a long, hard road I am finally an American Citizen This is the only country I would fight for and die for It is the only country I want to live in What was my first act as an American Citizen I registered to vote	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{/KrwvhgupA4SRUPEHRDe,7i/mQkPjTwL4IsfjJMoi,0qedYV2/s/KXqg9tAkMn,BSGIgRIXT0ear9lfSBXd,doAeKwJlRziIPz2oNc2G}	{}	{}	{}	{}	post1
YGwamAmejWkGT2LbhCTz	My girl found these on the ground sealed	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{I25Oimx9wGx2hnOD8/nV,Pu8AbxMGTAMqn2pL6uYV,b3DPyfU4KHYoe+a/Kawe}	{}	{}	{}	{}	post1
tZSRHXott6U7y2nfL4p2	Cute Asian with a Hint of Cleavage	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{jj5nBtv/CrzrNHW4t+Kl,nejsKKxBT7i+iHNSCLTx,XozNQA9BxeXbYFEYuXDe}	{}	{}	{}	{}	post1
krEwCt4cghAeSJQwQeuo	Worlds largest single firework shell	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{uqSHqeB2J92ekmuTDAVl,mk70XT3urWLyfZZ3Iiwn}	{}	{}	{}	{}	post1
dfhRtMV0IfVIflXJA74X	Tina Louise	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{GNTogNbb7UrbhdOHeWwl,C4o+nqtYZeYZ9RxH7FKb}	{}	{}	{}	{}	post1
Y4xmjMJ50lULd1rhMM1m	Asking for gear in Nighthold	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{1cVsqCVHVr2NdJIzpVxz,zdD0gbHpk1CqeKK4DOyi,wIcnGTaIBpJ4z/oUB8lG,dSt53kL9b29cdVNQvVhv,PiFRNGrOz0Acf3kLOxlZ}	{}	{}	{}	{}	post1
MbMkW3m+nWueo9b35S4V	Too Cute	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{uPcz6XfSXnkC4irVBn+7,k0DjHFgtSVGcDal7dcjD,oT7UKVlNQjB9XUEx/Q9J,NIUpV+H2JEkjspu3VZpp,53qxWJqog6tLGXe/zf3X}	{}	{}	{}	{}	post1
uDEBpLMaBaOSUZrYMJTp	30plus20 We had a fun night out Then it was time to set the girls free for a fun night in 	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{fk8ILWr38Ql8zDx+MfqZ,iko5UD5VD2r6Y+vJJUe0,2bHmVwtAWap/F5Biuq0U}	{}	{}	{}	{}	post1
SvQDWNt+MRtoWPp/U7W9	its all yours for the taking	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{GsDk06FGtKsARVW1TSsp,GZPSI+qHMm2gO4T7AHUf}	{}	{}	{}	{}	post1
wVBTv2oT9Zu8IUiNcu7t	Strawberry Greenhouses	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{J5tWBgt91+QT9/j9eKgQ,dtJY6H6cs/2Yjo1/eIQU}	{}	{}	{}	{}	post1
2/+Fxmhv+s/k+H4mHUms	Private Snap	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{J6LgrgQgKOFaP7HFHGHj,Ftvl3NDMqDeiw6s/RoX5,wYyj3IpXV+rfTYPidLA8,AWBTsow9Qd69Ei8hhAFH,B0BguV6qOhSCKKNYsE1U}	{}	{}	{}	{}	post1
veA3G9e1Dje1x8Tqvu16	Incapable of meeting strangers on FacebookYOU must be on your period	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{4yuI+8QUpJaVyUSpKVn7,Q5+n1D+1pl8Ynj0OQjbI}	{}	{}	{}	{}	post1
0aYRcG/M0/X/yYGNJAtm	Towering Genius disdains a Beaten 1200  900 Abraham Lincoln	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Nkg5twLp1pVhtlhglX/f,8be0azatNvHV6H4Ax0K+,wXfOlnP6BhdlRY6HCF07,jBqK5MuLEjOPfAgKnnCv,q6VtxCvxpo1GUBSYuymC}	{}	{}	{}	{}	post1
/wcVJZDDfXqd/P0mRVM6	The Holocaust Who are the missing million	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{dZehBvkFgzzCce9bRBVo,svxofOkzPlJ7LrsK9DyX,ZGrCjaX36ktFj6X0h/mM}	{}	{}	{}	{}	post1
xWV0D5DONK4qj8UDHoSI	Good news The new Caye  Dacia Duster is coming	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{KM9RTKdlNzMDI31cMGHl,+XkoCGEtx6Y3eXLPOLxD,EZThuK+LhCSPccKDFdvb,H9KC4f8u5U5dgvfkm5QD,nefv5KsI1ig01I9FMIWp}	{}	{}	{}	{}	post1
qRA/DRvi/QFyHNDj1Nrb	Up Close	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{V47zfWdVqdPjOckBhWif,cFw5L8XDW9pHw7tb0cwf,zzEcF6RXoOfbdMLFVkBN,zPyRh0LiePfZJK9I/q1L}	{}	{}	{}	{}	post1
FYFM8oSY4mozNGths+uK	Voters Confront Democratic Senator About Medicare For All and REFUSE to Back Down  1415	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Mz09C8YBlrqkb3c6Y+vG,9Px9MWo+DdyOxuULGHwj,kA+A2tKHNaixApZxPpJ1,O+Wm1tLwjFMEPDbEtbPy,Z3pFya8TzzGe6Dge8d6K}	{}	{}	{}	{}	post1
56ZhLQV0ZO55MYlrpJ0/	To keep EpiPen sales up, Mylan threatened states, sued making bogus claims	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{C0aNlJvYwtL2cbmpUyfe,5Tu7qqDzpWuiWujwxBac,hFZiEsEmK3lhyHs1pINK,I+CStIKzhYtUCmsbMoei,29Yo4PytXv3Nqb4WYhoW}	{}	{}	{}	{}	post1
+2g4HO+WW0WceYVvgaeU	Fill me up, I want a good fucking	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{V3zkZW+wKELziyXDLHzb,3dOTfJMRJrK319LfRAQo}	{}	{}	{}	{}	post1
dV2BZuZmeqwSCYYMeSgu	I just started currently level 22 and Ive got to say, I like the gun play but I have no idea whats going on with this story	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{8e/DyM8Hu+nwjqAA2m5B,nTd2PUpwJ1KhdyiZGcoD}	{}	{}	{}	{}	post1
gYySmHDQFnlSeSTMFmzt	Are all the oceans level with each other	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{djLX5z1Qm+lQLd3xI3Up,3xno3nslr0UOn13Ad4bK,wrSEz1zXb9ejTo/EUwuJ}	{}	{}	{}	{}	post1
AAAmshqUyNGd5YN4rgGH	Bom 25 de abril	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{x06Jn5PZ9VHMiG+ltWtI,gAGxzZP3zzqV8MarV5Hp,rTlbB6fIjdj40SrOjjfR,5VHL9HiPVhTEMfxipqDK,gy/XzXc2JfpQ08Fzb+Oz}	{}	{}	{}	{}	post1
I+dYk2/QYXfRgeNhEVGK	Im out	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{u9At5P1PaxLIPsZoQSRX,cAcjhPavmK9k3eVLx2bz,l/sdIiZeTYAcda+Smf1o}	{}	{}	{}	{}	post1
DT8aL1s3TpbY+Pp0JprI	Found on the front page of rfunny Reddit is no better than 9GAG	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{oIJR68h3RmCXR9PrPs9j,b33dsWnYQn9TLXQB1WBm,sbDFCyTx3BInQ0QVE3b5}	{}	{}	{}	{}	post1
nO7uZUnpBcOfIZeqNtMJ	I think this choker really suits me F	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{U3e1tKCycO4vxCefxIo4,zCyJNnhFL97HpqtPyZkD,fMRSbRYOCNJVn2ChOA6w}	{}	{}	{}	{}	post1
RsThs7f+YarkpJQ9b5AW	Fan Content Awesome Korrasami Picture	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{wGFsbHbmGeGN+QbYzrSe,yPgVK2vV9k9RoHSz1A93,EzqiCcueyg1BcaNALEna}	{}	{}	{}	{}	post1
4yK7vx1ekhuQ7wVO6kYM	I adopted an overweight dog Heres a before and after pic of him losing 9 pounds	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{l2jqHaU0ks0ywMo6rpa9,j29+fHZo8SS/Y8meeUcj}	{}	{}	{}	{}	post1
0byLUPVD4/5FnD9pDgpn	Medical advice to all Ketoers no, its not what you think	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{NzZOxTW+Yrb64eyT/w6D,e2NBHErS8/QlMhUpprUh,LxzLiX5pYomOatIsZ2E6,g4iK9X3hOgEx25hH9XQn}	{}	{}	{}	{}	post1
bvZfMZ5UNxXhczbWj57k	Modern cities in a nutshell	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{paDxo1Q9mSLyH1ejb/Dg,vDo4IkAzhqQsPkoeDmSL,ptqmFfor+A+wGxENI78E}	{}	{}	{}	{}	post1
fYxNI4s84hUfwgceNye9	After screen printing for a year, I had my first gallery show	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{vXbSr5qrDoeTc+WnCenI,FrzdsBHQdqamuuqQNbb6,lq+GxD4LzZ6fK/WXa9ui}	{}	{}	{}	{}	post1
x2RJ9Yhv1l+2eJFDxJ+5	New foster dog, hes super sweet, but mostly blind I cant reach my coffee, or the remote, but hes finally comfortable and seems to feel secure Snore away buddy	f	\N	\N	100	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{7TVXHr4lh/SmyWSnA1nm,hQGCJLr179LGjix0Np1L,6IYKBRlsSQ5ZvpwmcTn1}	{}	{}	{}	{}	post1
IrJzqhNENNQ4TdUvL3OD	Be the best man you can be	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{qQbSXQmkkICOzwVuhpW4,Otl2/XTxSMxeufocaMDS,4WSHD9Evn3RRjW/kbF6K,QEetYFM9OKMVoHzyTXwF}	{}	{}	{}	{}	post1
LFYTnlxrypasGzUi8a3w	Today in Italy we celebrate the Liberation from Nazifascism  Viva lItalia Libera	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{v2fOIwSsah8k0dM4WtIM,KVGrKJpVkDyAH7g6bezw,G6Ia+gjDZFPJTUBcdc2Z,/DvEwGVHmfOjWU5MyPbj}	{}	{}	{}	{}	post1
h+PmeJ3UBluI5W2JWafo	I ate BaconampCheddar waffle with fried chicken and a honey chili sauce	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{AgLlv/VGsgMiyLTFM1j6,lAeruyr9NJU1SJkrWlZ4,lejJTxuTJWurimrbZ9ZQ,VOxHnUgY3XNAgWgpqMLk}	{}	{}	{}	{}	post1
nCk4YBzK5l1IztWIPFaW	Transgender woman denied food at soup kitchen because she was wearing a dress The director said his mission was acting according to the Bible Christianity is dependent on our obedience to God	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{TYtRJ660Y1EtluLzieP8,1OGDgqutiudVC+VkXNzJ}	{}	{}	{}	{}	post1
K7FZglmMd4my+MWyoY7a	The computer running Reddits search function	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{oowtKU4Qpr4XWHZGhv6g,JQbBa/1djJo0dSHnHr1c}	{}	{}	{}	{}	post1
QRnSsDMEyA7nB5JlYqkI	A slur is a slur Dont matter who says it	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{S5wtUCBrYCjJnayXFf7h,D8VckbOfrj8gtIpJe5dF,ICLeKT3dO0yq8WnHNQ5t}	{}	{}	{}	{}	post1
PEhsx6FsCBsbL9K900vy	me irl	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{cv31mFpgjUi4CrwDtkWn,FinL/Uw/iWP0q14eHcpq,rW7XbI5Mr77lM/SirU1i,gyJvzIqyBP5OGD9lxlGE}	{}	{}	{}	{}	post1
rHloRQdFWHyF04VfHGlq	They wouldnt take the photo unless I smiled	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{4tQPv2UMtkaPxd5icXW7,LWKXZshtHYoiWgzSjlf0,megQbGSo8F2sH6/zJC6K,DhSBLdV9oqSPaD4mAZR5,R02lxp5r8f+RtWPgbc7J}	{}	{}	{}	{}	post1
wmOgRpwqZcOg2JSRP5h3	Top 50 Largest Corporations by Revenue OC	f	\N	\N	23	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{nbEjuwYkeHChsaNUXEDx,/oYRyusJGd2FOnBtpbZW}	{}	{}	{}	{}	post1
MiPOqDJMuj9iXXyCIYst	Perfect form caught in slo mo	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{XbMhom2QqP2W8T4GJnrb,VEXXttMHlw3nFNp3tVa3}	{}	{}	{}	{}	post1
ml79vK7Q1Qa05idsnFGB	Hercules Beetle Pupa	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{07LJSZuW2K+nHH7xz7CM,6n7UM3Zt61JMHdg0NkhR}	{}	{}	{}	{}	post1
42jQoic5jPtKkVz/FDjO	And to think we had doubts about these two	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{oHF2MKHHun5+Js/s1cAg,JrVGN/HF/U+uG3/DskAP,+FKuBrFVGhP01Thq337s,LL//5bkQOv+vtKkrXwTS,b87tFkpI6Vz0VSQ33qWN}	{}	{}	{}	{}	post1
CfZ0iG+3WcPdUdTLy9xS	Hercules beetle pupa	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{pX3bNHHd+xbzuWS/p3JZ,fi78xi3RXOLnrnBB4r+8}	{}	{}	{}	{}	post1
2TCVHmuSSvPVS/NGck28	A candle that can burn 144 hours	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{dglQj5iTKeHbxVBZmcwZ,H2A+vcjZPQG4fP0LFXIF,+ZlgF4H88KazUlL7MBuK}	{}	{}	{}	{}	post1
81J07pnV9BrsCx21/oX4	The State Department is apparently spending money to officially promote MaraLago	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{PJo2y3HKA48ruygyzsqK,W59E11+90sKpgftOxYFm,FNt/5fIQMsm+4TlDnjKl,YcAEjNT9a/J7CvzH8kSa,d0VkB8KHFwqndWL18/cP}	{}	{}	{}	{}	post1
3CTVMkbsITB79i6OEmUe	Selfproclaimed Nazi Mod stickies his own comment Refuses to accept that the Jew Einstein influenced modern physics	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{pvg+xMjSjeZWJI0GCEU9,w0CPSq/1W8UWIA9a4DBb,1ljZniOqsLSYnSKmiZBP}	{}	{}	{}	{}	post1
hXmODW3+HBp/11sK2hmG	Anyone fans of really nice quads in yoga pants	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{JLtR13lwv3V4ye12v5pe,ArYw7NhdqNWL9QqzeNL+}	{}	{}	{}	{}	post1
6nZX4L8s1IhtMhuhuR5N	2meirl4meirl	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{glXOGS2TM6OAp1MFUx6Y,gmu8DGlcy2AVidGt5L7b,jF4pKbh4uItDsGWk+zIb,gRc41uA70ux0haqg0LbM}	{}	{}	{}	{}	post1
5UymsDKtiT8nojcNMHiE	Most impressive use of Theremin I have ever seen  0248	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Ejt0oig9z1YZJxZqYkKx,lR4MUTUqPmTtPAb7ujDd,3dfIEUunilA6f32Wl/tT,xHrCik+w8f7hwTKngyKN,GyY9+bJECEv5cz3bB9Q9}	{}	{}	{}	{}	post1
CsSDxrvAtWNb5NrBj5Bc	Fuck the border wall	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{W9CexfJcXuuRoxa8NyqJ,ELQLYfTX6bY1dMRRkAYD,XHaAvyRuw75gKiM6K1ij,TWCjyWg2MxYfFvacp6OT,punG8/7liCkzoh0fli66}	{}	{}	{}	{}	post1
qx+49qc4CT4jVkcu1RpG	TIL that Pornhub has been contributing to charity since 2012 They have ran charity campaigns that planted trees, provided free breast cancer checks and donated to panda conversation charities	f	\N	\N	108	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{+ViWtMlzvUHPi0atJ4Y8,6AakWmgM56h/MmelB4Gs,rzcNqcSVR8GF9trWH7f+}	{}	{}	{}	{}	post1
LGFi0OvRDakb5a13l0uN	pollak reveals his power level	f	\N	\N	1000	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{LjIRyCowENtTeaAHAk34,pR1bn5Joov++YJqVDEpB}	{}	{}	{}	{}	post1
S4qRZAyWmkJNWw5nd/qA	Territorial hippo joins brawl between wildebeest and crocodile	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{/W3QM0DoHxUwMnhwTpFE,gW6v8ZaBDHgoQdkerA7t,C2ONnNtqHTOWnTaFDPBM,/hY+d5gRu6uEm9RZs0NI,tTcc9ePko5wRpBlpLMSa}	{}	{}	{}	{}	post1
XwawjiF/UWXIIIIl8A35	PSA An official marathon of Carl Sagans Cosmos is currently being streamed on Twitch	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{0dMG4eESodUlhrLP/gA9,Jy2dk1fH7PzplBOSTjTc}	{}	{}	{}	{}	post1
NhDzar8P0ft16j9gcqm+	Were at an Important Crossroad in our Lives  1239	f	\N	\N	200	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{2gCEjcsX0DEi9bNwQY3G,4RaJoZED55VSKvUgGuzl}	{}	{}	{}	{}	post1
NDb6Ri8u0F51nSUlE6H0	Damn, he even took the shoes	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{TD6JB4FibYzRwVpxJ6t7,Aa7jfSvtqEyJktvKJ7yY,ohOnb/sunpKMgUjLAcRv,ZlApAduUbZaqIEZ5Opzd,TrTXlugj6Ih7a4lyVsRs}	{}	{}	{}	{}	post1
VlYOuRD1DKLMCpd/X8RQ	20 year old tree growing out the top of a silo	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{OG/RjzLcy5m5jLWANt04,8cs354JSIp80dSWLm+iR,lKI5yhU7dqsSv/yvnc9T}	{}	{}	{}	{}	post1
QUPUDc49dYTZAuSefHhv	Hoe life	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Os3oABqDlUIEljeGNOy8,7y3isOwvS28JradlRbX7,90GNNQwUyWuwr2fl/mKy,GG6vPp9gRmI5a5b/knfn}	{}	{}	{}	{}	post1
MXHnuThLBxyMqf2x9RYX	I Found Andys Spotify Playlist	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{0/KsgecX4qeerusov1ox,kcV9R1m2RNZt/z//U8md,OCXrjWxV4nDpLUN8vJk+,QGefePdBkIFQnb4K9N76}	{}	{}	{}	{}	post1
L+/B6F5ejrSr8lqPeN30	Today this guy at work asked me for a cigarette lighter	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{o4P18ZI2BfA0zGOJuhg6,MgAALnrMeX7QzfTuyHGs,utZG+D9byGK4aY/XLDW6,UJebzfMtXAZIT1aQiSL1}	{}	{}	{}	{}	post1
H8qyN0kXxpRXJ8A8aXec	I saw a guy face down on the sidewalk	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{eXQq9hxnFpK05Atl+47I,U0uxvOm8UJnEnGg8BBZq,iuQg+aR3J8mH+siYAAkt,S8SG8EEN/ozSamiMSH+p}	{}	{}	{}	{}	post1
yAhAJboIEIBjSo5syKRF	After the war, even Franks best friends couldnt snap him out of it	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{xIF2T++ryRsw+W9F6+Lp,SaNSQ4tufR3/2X5oMNoo,cNvO5qkcO0aSFBx5BHb2}	{}	{}	{}	{}	post1
J4dNEW+yJYDnKdh+Op+0	Sergio Romo receives huge standing ovation in his return to ATampT	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{4AUwxwG3bRJKpY9Y/GP/,ULiFoNm7y1uyxy1S+hrh,ASvFoEXVJ7OcM4aXi6D+}	{}	{}	{}	{}	post1
V/k/SjCdny9tP/yhfOnL	My whole life in the hand of God	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{BLGGJdroK3J+Y5/ohgtV,sUyrp6rh99I556UvNHLp,H40NzlV8382l8a/TaNsT}	{}	{}	{}	{}	post1
F5o+9kbgy4nX67AcECKy	Elmo really shouldnt play doubles	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{cztO0HE5QMeEob9d/f9j,fJgyMp0geyoRPHMa+ke5,ZLranVjeteYQMEbenyiz,veeLXy5XFdYdWqtjGhQY}	{}	{}	{}	{}	post1
VRB60g1OHcTkrbbpfMXb	More of a shake than a bounce, but still	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{yRKbDnEu45WsIVseZT/n,VuH1PEh3aCmjQJEH0iTP,EP8Oj+gVzT7SmqLJAWiu}	{}	{}	{}	{}	post1
3Ee4hBrrev0nY1CLY193	Seen NTU	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Jf3EP4svq0QJe0JcWLuY,J0xPfz2Q5GIjwuO94SRg,NWZzXHCk8ELSk0BWUzLv}	{}	{}	{}	{}	post1
TplX8W/+vRMKUBR5PRC4	NRA files lawsuit challenging Californias Assault Weapons Control Act	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{qIQaqNQHpToc0o48er8D,Snii6W6t+YErkaNKMBhi,JlUtRi2LN8ii82Z9U9vw,vXRzM/mZw4tchRfTZCuK,LhJgVwT7TVYCD/hI7YWD}	{}	{}	{}	{}	post1
jOHv9qh1s9hj6+kuLmVa	The shrinkage is real, length check	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{s71ojqvE/yzCLD5cdUnd,Luq3enRHLfiMVXr+CeCA,Jkur25+ufreKAoqmvZ4D}	{}	{}	{}	{}	post1
1UufxAWZsxWW3HyFyMO3	Need I say more 	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{yMSWTG5vYT/cz1EoxB5i,z41NHYjA3vD3W9VZS60+,lO+4UpywKjS9Rs5HsXiZ,RqeJ0/ijfiIxbCNnGeor,xQbhjG6ehoYZl4X4oqZg}	{}	{}	{}	{}	post1
bSUJms9ytpe0LJCy+49v	Snapchat needs to make this Donald Trump filter permanent	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{8sV9ODdwjqOFRkC9E12c,AThB3cdlcYXjAr089i2b}	{}	{}	{}	{}	post1
q8JJVBkcn8bBVYAwYK8H	Vive Le Pen	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{qjnAZ6ec9qOV0XEjeij9,sHHZYK4nwkNYrq8P5cN/,CiIyB6c2Ev4VsFfPuMCg}	{}	{}	{}	{}	post1
ZAW151HGQCKKqimRLisC	Who wants to be my player 2 f	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{d52jO6huRGs06jxsT3V/,mZAGG2oB8FD3d13uVlE8,tVUkWy6XuWjr5gMekIP8,GYsdkdOgETKQRcvyogOw,oCqFxpiVvQOIDhs4ShcW}	{}	{}	{}	{}	post1
8rDn6vLbvs00mi34qIGX	Entitled Lady doesnt care if you dont work here anymore	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{Fj0vHiY4I+AAnJ8C/JFd,Vp+XYKpb6P2GbOXpLRQr}	{}	{}	{}	{}	post1
QPxY+750eT4NfxyrXz8G	Kekistani soldier battle equipment	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{L3hjg9jwNPUgERXbZcBn,KrS819o8JkLNg6Ate0Io,UvvETEmuNw4AzYi8y15S}	{}	{}	{}	{}	post1
kxS1BeeahcMjzaj0/hif	SB Tactical ATF reverses opinion letter that shouldering your brace redesigns your firearm	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{xJqYpWo1n3c3ry+Sm51Y,Y6bvuOyQFZiy7/tPPlAI,4AuzzfA/M2MLkjbwfh3j,G07YAd1iWQu7uLxGZE2j}	{}	{}	{}	{}	post1
7/xzrSWg0Cs1TUuQk6eT	The Absurdity of The Freeswag Movement  3012	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{F1DHRj5EY+5cc7bj5plN,pQs0mXmMGpPWpCuTn+C4}	{}	{}	{}	{}	post1
yF+NPQPKuAL5GvZwGoSP	Husky pupper climbing up a staircase	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{ngphxrgm8NH/rV8qsWU5,IYuCg5+QXLzLcjJfvFaA,EtLNok/UoVKeX3acRRAF,WjqlXOLr2S0UVdAGCyOC,kw3U1qMff2QVufKtHCKn}	{}	{}	{}	{}	post1
ypsn+18pu/Kj7toQQgEk	This chewbacca sock	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{5GjU0i8invEnKMr6f/HF,9tqTNWyCXzNZikChLCf+,rMZsfcUXAZxvYTJQM0dn}	{}	{}	{}	{}	post1
tbl5xjC/uEJJQesAGUGl	Team Trump lacks the experience to fulfill promises This has been amateur hour at the White House, Elaine Kamarck said at a panel of Brookings experts on President Trumps first 100 days He didnt come in with any government expertise and he hasnt shown an interest in learning	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{FsHvr9BJdgw3aXBxOXhv,DDpNnkwmLCpyaSgnx0s2,58Puj6eSCOmCKNnLn8fq,i8Ppagu7WeRIQsXekthv}	{}	{}	{}	{}	post1
l9xDU17zyEL88PXfb0Fe	Hearing Is Set for Sanders Supporters Suing DNC	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{PWoHN/H40WADV1wGib9j,n8S1NKjf0Hrd3Tcl0Qd5,Rmx+IuEa9mskOzL8/Xi+,HZfDxlqBEM7MVbos5p9B,A6OLRYP9i5iy+Z9+VCl/}	{}	{}	{}	{}	post1
SQwDrLyMC1Ne0P5tJ6h+	Vega will be ready this quarter  AMD  Facebook	f	\N	\N	0	\N	2018-04-23 15:50:50.380972	\N	\N	{}	{wluc9z8vb/2SrUaRRwlH,Y87pWU+dufRwYmBk/TDk,ibSSdjVETov0sY5/hCJh,9iaqGOP1o6M1Zfaz3W3K}	{}	{}	{}	{}	post1
\.


--
-- Data for Name: postReport; Type: TABLE DATA; Schema: public; Owner: ismailmellouli
--

COPY public."postReport" (id, post, "fromUser", "reportedUser", comment, "reasonNotOC", "reasonIllegal", reason) FROM stdin;
\.


--
-- Data for Name: postTag; Type: TABLE DATA; Schema: public; Owner: ismailmellouli
--

COPY public."postTag" (id, tag, post, upvotes, downvotes, date, __post_tags_inverse) FROM stdin;
qGYgATDEtWkchma+UZyn	/cFEfNMpFxRDc1+1PpSb	Vlh+JLRe6pvf2v02I4RP	212	\N	2017-04-26 22:26:44.495	{}
840mIztM451G1VZ+TikH	VErp5+HZdn3Yz2G88TZh	Vlh+JLRe6pvf2v02I4RP	991	\N	2017-04-24 14:20:53.393	{}
8lQyC4uT6pnqhqKdCrtD	y90eN2IFt6lwJmUaK9TF	Vlh+JLRe6pvf2v02I4RP	168	\N	2017-04-26 22:23:55.346	{}
1COGGnoAjwtmfe/NlS4h	VErp5+HZdn3Yz2G88TZh	lkv6woKCFngQTIZWDy2m	17	\N	2017-04-24 21:54:30.435	{}
c/N/srNX4KsoAP3Qd1Vi	CBp22Vfd78M4NgkRafEo	Vlh+JLRe6pvf2v02I4RP	588	\N	2017-04-26 04:33:46.108	{}
te6i2m4egwcdZBV4PTb7	Mooca+XNOJQaJb6IILB6	7Y9oYxgh2XWNn9bU9klP	659	\N	2017-04-26 11:07:07.643	{}
KpfqoJkvQHPYfG7LlFHA	ZNerBKfcGYvzcUKaYlqg	7Y9oYxgh2XWNn9bU9klP	171	\N	2017-04-25 21:10:05.08	{}
M1B1TaQVONqmXyPYkT2h	TMTdMrgBYgxYoTLKWv35	7BUJGDYu4+xTYa0TGn6d	203	\N	2017-04-26 10:39:59.607	{}
9qnnS+i5C5pPycRcKG9/	Hjjd3Ns0lvG3cs9jj4N7	7BUJGDYu4+xTYa0TGn6d	448	\N	2017-04-26 22:07:48.313	{}
rtQ7Zcxs301QEuS6TdcR	nbFMJA7w8Ms8VOsgI8Uj	2y16Q/VUmEGJzr3ebb/F	811	\N	2017-04-26 18:28:58.286	{}
ay+pQlTwW/BkePjLZ4dS	budgvhf/oqc9FWtiR59c	2y16Q/VUmEGJzr3ebb/F	394	\N	2017-04-24 19:01:34.173	{}
8o7Z4vSJA8AwNZBE+k/e	budgvhf/oqc9FWtiR59c	2y16Q/VUmEGJzr3ebb/F	556	\N	2017-04-26 19:26:27.084	{}
zvzXgpVIcj9nEMiVbc/o	TMTdMrgBYgxYoTLKWv35	1Gb8x9fhMgTrzkV6Wh/a	962	\N	2017-04-24 10:21:38.21	{}
nYparSdXxCQCu09J8HdB	YPGpbTqv9aeZHXxBNgIC	1Gb8x9fhMgTrzkV6Wh/a	437	\N	2017-04-26 01:38:53.444	{}
78HAdTWU4wmiYoVNE/l1	YPGpbTqv9aeZHXxBNgIC	1Gb8x9fhMgTrzkV6Wh/a	806	\N	2017-04-25 15:32:31.889	{}
Sl42mZLa4n4EMk7+L3f9	rc+ccdAK8F4ROpIC299B	xQ4VIObpxRMVoDYyfnW9	782	\N	2017-04-26 01:55:59.609	{}
DnuD2oqLfhpgiUrchdX5	SBdioRVUMTzSJjoTQ8iG	xQ4VIObpxRMVoDYyfnW9	584	\N	2017-04-25 12:17:50.111	{}
LcvTmLxbh8ic0f5wLq/S	ZNerBKfcGYvzcUKaYlqg	nvIk04BQnftTiCJhEQzy	960	\N	2017-04-24 03:01:35.691	{}
VvzeQiP++vYCJfo0Mf99	Mooca+XNOJQaJb6IILB6	nvIk04BQnftTiCJhEQzy	807	\N	2017-04-25 02:27:48.153	{}
5ryvuX132U4xLz+sFnYG	Mooca+XNOJQaJb6IILB6	nvIk04BQnftTiCJhEQzy	498	\N	2017-04-26 02:00:32.321	{}
NMK45mNTTsJnEnILrjqj	budgvhf/oqc9FWtiR59c	456lXnYsAfnaYI7d9PUI	264	\N	2017-04-25 11:48:31.328	{}
dBCVGa6YNvzlbtmn3HQ/	Mooca+XNOJQaJb6IILB6	456lXnYsAfnaYI7d9PUI	60	\N	2017-04-25 06:04:14.819	{}
TyXFUeR9v58IuTDDKi79	VErp5+HZdn3Yz2G88TZh	rG7vZSa9UQgShn+W+tei	173	\N	2017-04-24 12:36:21.374	{}
MAaAao/wcohzOoAQJ3zK	YPGpbTqv9aeZHXxBNgIC	W2KXCA7472xMrzBBvGPG	73	\N	2017-04-25 23:07:18.396	{}
ra0DJXyhCeu1HqHPEk/c	0/Dg4ohpw1BIoLvDgRkh	W2KXCA7472xMrzBBvGPG	651	\N	2017-04-26 17:17:34.89	{}
bFpnr9Dwp+1AiDjiZBOy	budgvhf/oqc9FWtiR59c	W2KXCA7472xMrzBBvGPG	681	\N	2017-04-25 18:27:15.955	{}
vXKj9KAprbEJ26vcaQhe	SBdioRVUMTzSJjoTQ8iG	W2KXCA7472xMrzBBvGPG	373	\N	2017-04-26 18:17:05.969	{}
b4tciEw0P9pLN+xo6ADI	CBp22Vfd78M4NgkRafEo	5stfjY6aWZTAxdIjNLa1	971	\N	2017-04-26 10:10:35.149	{}
lw48LAPjeGAlSVTiGmBY	nbFMJA7w8Ms8VOsgI8Uj	5stfjY6aWZTAxdIjNLa1	118	\N	2017-04-26 22:54:46.027	{}
KgelwQjB2mRvT/25061R	TMTdMrgBYgxYoTLKWv35	5stfjY6aWZTAxdIjNLa1	271	\N	2017-04-26 07:34:37.388	{}
ybAJuudCH44aL4jb0+8J	+2fxb2EecC80U2DcxPMF	5stfjY6aWZTAxdIjNLa1	794	\N	2017-04-24 22:40:27.44	{}
uqSHqeB2J92ekmuTDAVl	VErp5+HZdn3Yz2G88TZh	krEwCt4cghAeSJQwQeuo	762	\N	2017-04-26 17:44:36.099	{}
DgPPV/MJrDnBpe0QMcoU	sAxdggjzUR7+K6sSxnyU	Ri/hB9AjcGrRGQhQYeE4	791	\N	2017-04-26 13:47:10.133	{}
FXihow3gbBrp1OunJ64g	nbFMJA7w8Ms8VOsgI8Uj	Ri/hB9AjcGrRGQhQYeE4	416	\N	2017-04-24 14:04:51.544	{}
XaUTfQWCJcBhU7Piv61F	CBp22Vfd78M4NgkRafEo	Zc7A16wuZIpqcfgGRi9e	171	\N	2017-04-26 08:06:29.058	{}
RCGLZcO4J7g+YWshDjpA	SBdioRVUMTzSJjoTQ8iG	Zc7A16wuZIpqcfgGRi9e	757	\N	2017-04-24 01:17:19.592	{}
A8KvLO6mCCOgzJezOP3k	TMTdMrgBYgxYoTLKWv35	nOmrI/dXJU7Nu/9hMep/	327	\N	2017-04-26 05:55:05.933	{}
2PU9tgspxy0hwG8BRt8M	Hjjd3Ns0lvG3cs9jj4N7	nOmrI/dXJU7Nu/9hMep/	749	\N	2017-04-25 03:54:12.146	{}
zS79Z2zIILIvTwZgHkdw	YPGpbTqv9aeZHXxBNgIC	nOmrI/dXJU7Nu/9hMep/	654	\N	2017-04-24 00:49:22.855	{}
kAgmJ7iEkHOT/10qQ6G/	SBdioRVUMTzSJjoTQ8iG	nOmrI/dXJU7Nu/9hMep/	765	\N	2017-04-26 01:28:21.375	{}
ivAHtUhHOpF8LJhUVKbD	Hjjd3Ns0lvG3cs9jj4N7	nOmrI/dXJU7Nu/9hMep/	218	\N	2017-04-25 13:36:22.032	{}
4RaJoZED55VSKvUgGuzl	VErp5+HZdn3Yz2G88TZh	NhDzar8P0ft16j9gcqm+	646	\N	2017-04-26 14:40:53.036	{}
2gCEjcsX0DEi9bNwQY3G	YPGpbTqv9aeZHXxBNgIC	NhDzar8P0ft16j9gcqm+	635	\N	2017-04-25 05:22:19.844	{}
fckFhAcEimvjdMJVYmkH	ZNerBKfcGYvzcUKaYlqg	y2hro2q54RQ2b1WIX5xN	905	\N	2017-04-25 15:15:09.999	{}
Orpe1P5tcfallIFjNAN9	budgvhf/oqc9FWtiR59c	y2hro2q54RQ2b1WIX5xN	77	\N	2017-04-26 00:48:37.955	{}
e3SHICDe7TDzQzURNPiQ	sAxdggjzUR7+K6sSxnyU	y2hro2q54RQ2b1WIX5xN	750	\N	2017-04-24 10:14:10.122	{}
+ViWtMlzvUHPi0atJ4Y8	y90eN2IFt6lwJmUaK9TF	qx+49qc4CT4jVkcu1RpG	386	\N	2017-04-24 04:14:25.363	{}
6AakWmgM56h/MmelB4Gs	VErp5+HZdn3Yz2G88TZh	qx+49qc4CT4jVkcu1RpG	136	\N	2017-04-25 06:29:01.052	{}
rzcNqcSVR8GF9trWH7f+	ZNerBKfcGYvzcUKaYlqg	qx+49qc4CT4jVkcu1RpG	69	\N	2017-04-26 07:13:22.442	{}
qQbSXQmkkICOzwVuhpW4	rc+ccdAK8F4ROpIC299B	IrJzqhNENNQ4TdUvL3OD	278	\N	2017-04-25 12:47:05.164	{}
Otl2/XTxSMxeufocaMDS	y90eN2IFt6lwJmUaK9TF	IrJzqhNENNQ4TdUvL3OD	611	\N	2017-04-24 15:34:06.716	{}
4WSHD9Evn3RRjW/kbF6K	budgvhf/oqc9FWtiR59c	IrJzqhNENNQ4TdUvL3OD	977	\N	2017-04-24 02:33:02.648	{}
bi9VHdP6KMs8+RFozTQY	rc+ccdAK8F4ROpIC299B	b/sbbIZpDDXLnZcIkYng	275	\N	2017-04-20 10:10:21	{}
VAR74kblRb6aGtRN03C4	YPGpbTqv9aeZHXxBNgIC	7BUJGDYu4+xTYa0TGn6d	684	\N	2018-04-20 10:24:19	{}
1gD/0CcplpYHnQOrvdOB	YPGpbTqv9aeZHXxBNgIC	7BUJGDYu4+xTYa0TGn6d	436	\N	2018-04-20 09:56:30	{}
yA6QiAuO3otZBvREuOHt	XklfmXtmNz7WRzaFwJPY	b/sbbIZpDDXLnZcIkYng	344	\N	2018-04-24 07:29:25	{}
1SSJP+nh1dHPDbSYj3Ba	ZNerBKfcGYvzcUKaYlqg	5stfjY6aWZTAxdIjNLa1	591	\N	2016-04-24 20:39:46	{}
I8qUBargTAHQGCVh6E3F	XklfmXtmNz7WRzaFwJPY	rG7vZSa9UQgShn+W+tei	131	\N	2018-04-24 05:40:54	{}
mk70XT3urWLyfZZ3Iiwn	ZNerBKfcGYvzcUKaYlqg	krEwCt4cghAeSJQwQeuo	876	\N	2017-02-24 22:04:04	{}
kx1RAaakywaotFPKC7VX	TMTdMrgBYgxYoTLKWv35	b/sbbIZpDDXLnZcIkYng	118	\N	2018-05-13 12:12:09	{}
yDCK9bvVz+OPyKphMJqf	ZNerBKfcGYvzcUKaYlqg	lkv6woKCFngQTIZWDy2m	816	\N	2018-05-13 18:47:45	{}
x0FsrcHBTwjDiw22O8p4	sAxdggjzUR7+K6sSxnyU	lkv6woKCFngQTIZWDy2m	989	\N	2018-04-25 19:48:59	{}
cvr2IdbMl0phLUObT63j	kMjFmLjttJpQS3rzutBf	lkv6woKCFngQTIZWDy2m	89	\N	2018-05-14 08:34:54	{}
gVZdHPaBRJi73arX1b9P	kMjFmLjttJpQS3rzutBf	lkv6woKCFngQTIZWDy2m	736	\N	2018-05-14 02:41:56	{}
QEetYFM9OKMVoHzyTXwF	3KOaA2+6IjmFPfm4ChIJ	IrJzqhNENNQ4TdUvL3OD	214	\N	2017-04-25 23:12:10.162	{}
UdVm1MGiumWxVIBj8Ydx	CBp22Vfd78M4NgkRafEo	eXk1zNQOV2RTSC3v6qAR	261	\N	2017-04-25 14:58:09.238	{}
g8pvlLOOCp/jG1jywyxo	nbFMJA7w8Ms8VOsgI8Uj	NiRtPkH7fyIw3cVBi1sk	756	\N	2017-04-24 18:39:31.479	{}
/W3QM0DoHxUwMnhwTpFE	y90eN2IFt6lwJmUaK9TF	S4qRZAyWmkJNWw5nd/qA	54	\N	2017-04-24 07:49:48.678	{}
nbEjuwYkeHChsaNUXEDx	y90eN2IFt6lwJmUaK9TF	wmOgRpwqZcOg2JSRP5h3	940	\N	2017-04-24 19:00:08.443	{}
1OGDgqutiudVC+VkXNzJ	ZNerBKfcGYvzcUKaYlqg	nCk4YBzK5l1IztWIPFaW	472	\N	2017-04-25 19:51:41.689	{}
tSu/nwFElVH3RfLG+j/7	3KOaA2+6IjmFPfm4ChIJ	RuA19x3fDp1ZeEz7sw0Y	460	\N	2017-04-24 17:42:11.077	{}
FinL/Uw/iWP0q14eHcpq	SBdioRVUMTzSJjoTQ8iG	PEhsx6FsCBsbL9K900vy	710	\N	2017-04-25 18:40:20.588	{}
yJ7fFW8d6yut1oeXl65b	rc+ccdAK8F4ROpIC299B	7WZeuD36gEL27pCNE/CK	42	\N	2017-04-25 19:32:50	{}
R02lxp5r8f+RtWPgbc7J	Hjjd3Ns0lvG3cs9jj4N7	rHloRQdFWHyF04VfHGlq	600	\N	2017-04-25 22:57:57.595	{}
W4KYV09HSfmy5FMA5jCI	nbFMJA7w8Ms8VOsgI8Uj	G/YgcyfRCYJvINjaZbG8	986	\N	2017-04-24 05:23:37.617	{}
PJo2y3HKA48ruygyzsqK	y90eN2IFt6lwJmUaK9TF	81J07pnV9BrsCx21/oX4	431	\N	2017-04-25 10:08:55.143	{}
gmu8DGlcy2AVidGt5L7b	VErp5+HZdn3Yz2G88TZh	6nZX4L8s1IhtMhuhuR5N	62	\N	2017-04-25 18:22:29.591	{}
xHrCik+w8f7hwTKngyKN	CBp22Vfd78M4NgkRafEo	5UymsDKtiT8nojcNMHiE	662	\N	2017-04-25 21:52:36.608	{}
SHZbcCNtLPF0hHaICoMe	nbFMJA7w8Ms8VOsgI8Uj	oOi90UWp1RUxmEV27qcb	855	\N	2017-04-25 03:50:50.427	{}
odg9sm6WtnTEncqjVQxQ	Hjjd3Ns0lvG3cs9jj4N7	OTS756rcFuq0vI0/iK2F	475	\N	2017-04-25 23:06:40.166	{}
7GoazaSf1Un3xuAjr9eJ	CBp22Vfd78M4NgkRafEo	hN3Y/AhQqtDWM/dUsNGe	227	\N	2017-04-24 18:36:44.369	{}
5rsMAKEdf/SJfDw9nd1Y	ljr+mdhFYpVziaRs0plq	7oKb3eotaOIq/6fH21SB	830	\N	2017-04-25 12:13:53.12	{}
EmL2xU6bINKMIxGyvtU6	+2fxb2EecC80U2DcxPMF	2qz1cQ23UnhdcEBw5KiS	114	\N	2017-04-25 01:43:14.717	{}
yi2FOQFiP6RQtxlirCEo	0/Dg4ohpw1BIoLvDgRkh	AZuCEH8NKwFkKPAY5zu0	19	\N	2017-04-24 07:11:52.825	{}
SOS1Pe9/xmh3hDfX1KGL	VErp5+HZdn3Yz2G88TZh	PS7iBtlxeudq8edyQlEe	820	\N	2017-04-24 18:08:25.561	{}
VIYcBJNRp4TXD+hBWXkg	3KOaA2+6IjmFPfm4ChIJ	9h1y3jT8QdTsJyWDBN9/	787	\N	2017-04-25 16:28:28.41	{}
7s08R9ug4jhLnlQ7cN8x	ZNerBKfcGYvzcUKaYlqg	h/3xVKiMhgdDiOgrhXOr	761	\N	2017-04-25 23:17:00.85	{}
oLyRz7E28m57J1/MowT/	VErp5+HZdn3Yz2G88TZh	10mZl57kD4OGn8jHDqkD	954	\N	2017-04-26 14:56:12.229	{}
13ODUC+tj+8KEKQzjkrA	ZNerBKfcGYvzcUKaYlqg	ipYmBwlB92y3YqJdgWNe	985	\N	2017-04-25 12:39:41.259	{}
5q6OxfSsS9e+L3OgWF22	YPGpbTqv9aeZHXxBNgIC	v1rRQbhc0QjrTM9qLAhF	831	\N	2017-04-26 22:51:49.323	{}
IayO84+TqPg+3Dt0UrCR	budgvhf/oqc9FWtiR59c	XIqI+cAG/wJEMy7sEZsi	241	\N	2017-04-25 20:26:35.484	{}
MGSYx5BTU2tIoH6hVNc6	rc+ccdAK8F4ROpIC299B	3X9dONX0LY0emmuX0eUz	473	\N	2017-04-24 05:04:18.132	{}
bnmvWDs64GCwRqvJ4Nrm	Hjjd3Ns0lvG3cs9jj4N7	sN+vKOoDDgpfrDrBGB+2	57	\N	2017-04-24 14:24:55.627	{}
Yc4G/5qWynDG3fkz3PU8	Mooca+XNOJQaJb6IILB6	OAj872OQpjpTQwsbaJUt	167	\N	2017-04-24 11:13:56.214	{}
6yzcotjhKmXKgZ8Qf/Eq	budgvhf/oqc9FWtiR59c	9Yh7/h20AH5gQBC5qt0t	755	\N	2017-04-26 07:50:55.005	{}
5sSfalNW7K3p1Aikdtqh	SBdioRVUMTzSJjoTQ8iG	r5hYJ4ncw8RlduUdaNQV	122	\N	2017-04-25 11:11:58.993	{}
B8N9de639ZzEymzDy/vT	y90eN2IFt6lwJmUaK9TF	gTUQR1KB2GaOr+1lAKR2	982	\N	2017-04-25 19:27:43.123	{}
W0GYJrhov/hdDAPMagoZ	0/Dg4ohpw1BIoLvDgRkh	xrNVMKxPNxJUCayjMNYu	631	\N	2017-04-24 20:43:01.296	{}
anofc3fAkmfeSjbyKbZX	TMTdMrgBYgxYoTLKWv35	6bsl/HFLkGmxu/QwO6rL	7	\N	2017-04-24 01:00:09.152	{}
27KMu8iDPoEU/nCHxRAw	/cFEfNMpFxRDc1+1PpSb	4hD7zTOsl4VKDE38IGtu	414	\N	2017-04-24 10:52:23.769	{}
rAojTvzh0pvzETqnim/E	+2fxb2EecC80U2DcxPMF	1MA9fRHFqu3OlTUEtPrY	470	\N	2017-04-26 07:58:33.054	{}
YFltMHTQGb9FUOC7ROWj	y90eN2IFt6lwJmUaK9TF	epoKi5MTnaZX4epgkw10	416	\N	2017-04-25 02:14:05.784	{}
Owyv6l8ySIlE6d2dDSqu	nbFMJA7w8Ms8VOsgI8Uj	t/Qp+NsPlhH4+Tl9/+zo	880	\N	2017-04-25 17:18:03.293	{}
v+CRtJICl6JFXtyWB9w8	rc+ccdAK8F4ROpIC299B	Lf0Z5/9Nib6Pvz8s/hoi	257	\N	2017-04-25 07:24:07.727	{}
N6XKhMtxmFtu/jybEk/f	ZNerBKfcGYvzcUKaYlqg	lbPRQGwEGVVX0tMaFqjK	212	\N	2017-04-24 19:09:12.787	{}
ob0OQXnmSfWo2jX+hxM6	VErp5+HZdn3Yz2G88TZh	gTz1FDKq+IxZfnTZVNAi	700	\N	2017-04-25 11:11:38.111	{}
4uunkzBh0+AvlX8wOB8M	0/Dg4ohpw1BIoLvDgRkh	/EhpeZGCZNebBG98d6+P	998	\N	2017-04-24 18:48:56.512	{}
KM9wGntchiV1TEdjYx8q	Mooca+XNOJQaJb6IILB6	CMN6Qx3UpF1diC7kH1ib	257	\N	2017-04-25 02:18:35.873	{}
GAEsOkaNOfZ43VU+SYqi	TMTdMrgBYgxYoTLKWv35	lpALzONombkrdI9rLfy7	7	\N	2017-04-25 00:50:24.368	{}
RdrunCf0QSwkdI2WtL7+	nbFMJA7w8Ms8VOsgI8Uj	6p0d1p36yh6kGjexeA+o	883	\N	2017-04-25 18:21:14.375	{}
1K85gdfthXXQqdg+e0Jv	SBdioRVUMTzSJjoTQ8iG	zuIbn+M1EbpSql8XiiC8	566	\N	2017-04-25 15:07:07.073	{}
TdUeOvctE6l+NTeqa+R1	kMjFmLjttJpQS3rzutBf	hqvb/Tz92YPrJQbY+zTg	14	\N	2017-04-24 19:44:09.846	{}
FOm/XDD5cF5QNqCsjOho	/cFEfNMpFxRDc1+1PpSb	3GyTGrhXYJ4CLn9V/LeN	607	\N	2017-04-24 17:52:38.809	{}
AhucGW36EU489E8uo9Sz	TMTdMrgBYgxYoTLKWv35	iwKfni67D2UnHsByOeqk	718	\N	2017-04-25 18:40:20.346	{}
H2MTz95t3nq9SyGQleHe	Mooca+XNOJQaJb6IILB6	MELlCoAwXQXItCWmU0lE	644	\N	2017-04-26 00:48:55.574	{}
tuwMkQS2xbeMoShyrELJ	TMTdMrgBYgxYoTLKWv35	n6/fSHNaG282XxezuPlt	858	\N	2017-04-26 08:28:02.678	{}
SiQn9UPd7DhB0YsQBUrF	ljr+mdhFYpVziaRs0plq	DzUOlUNYsszexYbX9Tlm	420	\N	2017-04-24 06:02:32.124	{}
tJK4sg5f4iRAkYjywPv7	y90eN2IFt6lwJmUaK9TF	e4Zd4xL9xwgJasjMUO/8	594	\N	2017-04-26 14:00:24.72	{}
U2FaFips6fXqxzclp/oM	SBdioRVUMTzSJjoTQ8iG	DpgdwnfeSqk6jVDEr46c	246	\N	2017-04-26 15:21:53.792	{}
Ge+m311k8vpSZsJMm3ON	Hjjd3Ns0lvG3cs9jj4N7	37Q7vBju5j4p/Qiby/3g	706	\N	2017-04-25 09:21:40.774	{}
lywM0t49YsLQYAh3K0pb	sAxdggjzUR7+K6sSxnyU	rqCjkOwXvXstTuKXITz6	145	\N	2017-04-26 03:51:52.843	{}
VHMhTJTIO+PO0zqDe5h0	CBp22Vfd78M4NgkRafEo	MNKD+ha4kRIlVB4KZg3e	797	\N	2017-04-25 07:25:42.264	{}
DnIhF21FWxx6dEqN19Ow	ljr+mdhFYpVziaRs0plq	XZbEc4KRdVRBOFXFk6bd	511	\N	2017-04-26 18:31:43.933	{}
/BXTTD93A+Sjen9UUJxl	3KOaA2+6IjmFPfm4ChIJ	W25X3lW9EAIv9MtQh4me	172	\N	2017-04-26 11:49:28.433	{}
5HF/1wJQEbD4CiF6+JOw	ZNerBKfcGYvzcUKaYlqg	FK8oH09U2URGASVqs1RX	349	\N	2018-03-24 23:47:10	{}
0iBqa/esqQ54KxBtjvYk	ZNerBKfcGYvzcUKaYlqg	8IfFd4SDQn7BEJNlcmAV	809	\N	2018-04-25 07:38:45	{}
LWR1x0QH0KCCRByiqdTv	kMjFmLjttJpQS3rzutBf	LMmZ6EzX1nfSSh19cInl	23	\N	2018-05-10 01:24:20	{}
AftL4RsJXfFJu7xgL76j	kMjFmLjttJpQS3rzutBf	6AYJ9KIBgzssNJKnehTE	231	\N	2018-05-14 09:30:30	{}
7TVXHr4lh/SmyWSnA1nm	/cFEfNMpFxRDc1+1PpSb	x2RJ9Yhv1l+2eJFDxJ+5	387	\N	2017-04-26 09:34:30.521	{}
HxU8PlO7ZAnVSBzjJpsO	y90eN2IFt6lwJmUaK9TF	NiRtPkH7fyIw3cVBi1sk	766	\N	2017-04-26 10:45:32.336	{}
lejJTxuTJWurimrbZ9ZQ	budgvhf/oqc9FWtiR59c	h+PmeJ3UBluI5W2JWafo	480	\N	2017-04-26 11:49:00.158	{}
ICLeKT3dO0yq8WnHNQ5t	TMTdMrgBYgxYoTLKWv35	QRnSsDMEyA7nB5JlYqkI	428	\N	2017-04-26 05:27:20.871	{}
e/Z5BVRVpyY7MVrCcy7b	TMTdMrgBYgxYoTLKWv35	AX9YStrv9GHPbBb3bV9y	376	\N	2017-04-26 22:15:20.428	{}
KBQwpt7NHIpMGYKUd9ip	kMjFmLjttJpQS3rzutBf	2T5dn6zTS+8MoYIPR6UI	620	\N	2017-04-26 12:22:47.974	{}
FNt/5fIQMsm+4TlDnjKl	CBp22Vfd78M4NgkRafEo	81J07pnV9BrsCx21/oX4	431	\N	2017-04-24 01:56:41.798	{}
pvg+xMjSjeZWJI0GCEU9	nbFMJA7w8Ms8VOsgI8Uj	3CTVMkbsITB79i6OEmUe	366	\N	2017-04-25 23:38:28.237	{}
ketZXCkucf11zNgY6IqR	ljr+mdhFYpVziaRs0plq	nlMFl79kePKtL0ocrR+H	393	\N	2017-04-24 04:01:28.444	{}
+9dwiUvgiFr9NjCRSzy8	/cFEfNMpFxRDc1+1PpSb	oOi90UWp1RUxmEV27qcb	563	\N	2017-04-25 20:02:26.581	{}
Eaos16NG0ghQVmvaohgA	SBdioRVUMTzSJjoTQ8iG	KlDHviOp+M9hNwpHzIHr	940	\N	2017-04-25 18:06:31.129	{}
6tjTvcrJw1zhTra4LeUP	ljr+mdhFYpVziaRs0plq	7oKb3eotaOIq/6fH21SB	204	\N	2017-04-26 19:23:29.229	{}
fYUNC0pE6neICagi1KuG	YPGpbTqv9aeZHXxBNgIC	tUaeThVJdUmUI65k4V5a	177	\N	2017-04-26 11:40:07.044	{}
ob9G21RmpcfuQDzqU0Hg	y90eN2IFt6lwJmUaK9TF	PS7iBtlxeudq8edyQlEe	518	\N	2017-04-26 21:20:19.251	{}
Z/JNYb5Kk7oKrXPFBKsk	nbFMJA7w8Ms8VOsgI8Uj	qzYWi0Fbdg6J4kFUUiTh	116	\N	2017-04-25 08:05:00.64	{}
VMnD8HAZt5q3xYaOMrUq	YPGpbTqv9aeZHXxBNgIC	VSW1UK99KY7AA/zDbtmz	451	\N	2017-04-25 05:06:57.44	{}
ntfnYIwipxqe9UxMMVKU	budgvhf/oqc9FWtiR59c	rEzlHP0CCqU32go9uLwG	341	\N	2017-04-26 15:39:05.654	{}
rL0uaR5tBHLihk1SMfFc	XklfmXtmNz7WRzaFwJPY	24c2duv4VpBnQRfTUZu7	683	\N	2017-04-25 09:35:14.523	{}
7P9xxhH9owEKU1bRygqK	VErp5+HZdn3Yz2G88TZh	T4u53Q0zqk+jtd2EN0L+	557	\N	2017-04-24 18:06:32.558	{}
qleGd3e/wx3dV1KGgVTc	rc+ccdAK8F4ROpIC299B	XIqI+cAG/wJEMy7sEZsi	177	\N	2017-04-24 15:55:59.74	{}
jgmu2AQXqR1vI2jkeTBT	XklfmXtmNz7WRzaFwJPY	UKgeGGKcEPfMJbWrl/ea	604	\N	2017-04-26 05:27:48.605	{}
rezHMfDVslYaAD6iD5sI	3KOaA2+6IjmFPfm4ChIJ	PahC0hXDjwj48Ja7J7K3	643	\N	2017-04-26 20:02:25.119	{}
P9xd3XK8HBHZSzICn4NR	TMTdMrgBYgxYoTLKWv35	feoGtNEoQHfDYD4DA35O	133	\N	2017-04-24 03:51:07.196	{}
2tH5YIw0R4EBVNZ1cBHS	Hjjd3Ns0lvG3cs9jj4N7	sN+vKOoDDgpfrDrBGB+2	702	\N	2017-04-24 02:36:02.972	{}
8rKoUYVwEdQXnZHIC6Bm	kMjFmLjttJpQS3rzutBf	D028RZHGbY/vg6GxTF8g	229	\N	2017-04-26 02:58:29.614	{}
TmoVOpzhHKBFK2nBjTts	kMjFmLjttJpQS3rzutBf	sVQv8JoUv7CWOtK9fJTX	860	\N	2017-04-26 14:06:53.564	{}
OH+cxmlQ1mwofID/nLUa	+2fxb2EecC80U2DcxPMF	r5hYJ4ncw8RlduUdaNQV	488	\N	2017-04-26 03:40:28.032	{}
2o1zgQ0BPz1n8gj64gLc	ljr+mdhFYpVziaRs0plq	gTUQR1KB2GaOr+1lAKR2	639	\N	2017-04-26 07:58:20.33	{}
q6f99pQIPsJzbbJqKxd2	VErp5+HZdn3Yz2G88TZh	r/D+I2PRPOq/BdZsJPpv	891	\N	2017-04-24 15:22:40.517	{}
WyQfGPhJiQRDoyIQJOUj	Hjjd3Ns0lvG3cs9jj4N7	hQRuq8f/hgPLqc8AhKwS	815	\N	2017-04-25 16:43:37.746	{}
TIXbt6gVtWXYLFsTyD3A	TMTdMrgBYgxYoTLKWv35	4hD7zTOsl4VKDE38IGtu	177	\N	2017-04-24 13:16:41.578	{}
Izlk/ztyclWz8BxqCEhd	SBdioRVUMTzSJjoTQ8iG	1MA9fRHFqu3OlTUEtPrY	61	\N	2017-04-24 16:43:35.292	{}
ugfsG6r3YHoxZO0PYXEu	Mooca+XNOJQaJb6IILB6	epoKi5MTnaZX4epgkw10	746	\N	2017-04-26 16:30:07.485	{}
gnNZ1GqFPDB77f/rYl1Z	CBp22Vfd78M4NgkRafEo	t/Qp+NsPlhH4+Tl9/+zo	333	\N	2017-04-25 00:05:51.146	{}
EbxdkbiND+Ssz/Wc1rgP	+2fxb2EecC80U2DcxPMF	Hd8N9/oMVmZQvOdq/fZz	599	\N	2017-04-24 15:09:44.608	{}
2yYkeoEKjrPU3UvdY55j	/cFEfNMpFxRDc1+1PpSb	GOBkT6nZ4L8OZmgEnq79	212	\N	2017-04-26 16:52:15.292	{}
c6WZa/oL4+R7peKqwZHo	Hjjd3Ns0lvG3cs9jj4N7	RmyzDGhFDnwb4qyN/AHA	109	\N	2017-04-26 12:49:06.766	{}
jDHmx6Zoef8dkHcu3ms4	+2fxb2EecC80U2DcxPMF	gTz1FDKq+IxZfnTZVNAi	503	\N	2017-04-25 05:33:15.973	{}
eNZIxvo4iQrW+ffm9gDh	kMjFmLjttJpQS3rzutBf	/EhpeZGCZNebBG98d6+P	257	\N	2017-04-25 13:20:42.888	{}
Aqr9yN2LvoYQUCv5KUbV	kMjFmLjttJpQS3rzutBf	CMN6Qx3UpF1diC7kH1ib	210	\N	2017-04-25 11:49:22.132	{}
TrisRZQxAnBUTf4GSg2s	VErp5+HZdn3Yz2G88TZh	lpALzONombkrdI9rLfy7	908	\N	2017-04-24 23:17:40.34	{}
mvGA82o2go3rEQxYpy+2	rc+ccdAK8F4ROpIC299B	6p0d1p36yh6kGjexeA+o	278	\N	2017-04-26 08:56:25.278	{}
Az+seI8o1SuSSQQRRyot	y90eN2IFt6lwJmUaK9TF	hqvb/Tz92YPrJQbY+zTg	643	\N	2017-04-24 02:40:44.381	{}
+19rMElqncH6cynpKRK2	sAxdggjzUR7+K6sSxnyU	3GyTGrhXYJ4CLn9V/LeN	33	\N	2017-04-25 07:50:11.091	{}
1je8t9zjbcX2zkRuJI4l	0/Dg4ohpw1BIoLvDgRkh	T/2Z1wdnNt21ziRUs22X	292	\N	2017-04-26 13:49:58.931	{}
G18ix6vkuQecwntKq0id	YPGpbTqv9aeZHXxBNgIC	g6/GNKiVzKsdale/1x5t	775	\N	2017-04-24 09:58:47.213	{}
mgcEOb2uefKmHm1GJVMK	Hjjd3Ns0lvG3cs9jj4N7	DzUOlUNYsszexYbX9Tlm	908	\N	2017-04-26 14:58:55.119	{}
E+EIg1N483sZeIcsV7GM	nbFMJA7w8Ms8VOsgI8Uj	e4Zd4xL9xwgJasjMUO/8	874	\N	2017-04-24 07:49:35.262	{}
eYLcbcEJ0O2JkJr/Xddu	sAxdggjzUR7+K6sSxnyU	+YM7zAEystclHZhUHI+W	638	\N	2017-04-24 22:37:15.727	{}
pd/tHqgK/UQIGmtHjD3C	Mooca+XNOJQaJb6IILB6	SBsVotrtu66V9CMdy4dd	795	\N	2017-04-26 04:17:09.308	{}
hQiim9SZXf3A53sKVV7s	XklfmXtmNz7WRzaFwJPY	laOPrsD3+7NQZY5NzCoP	596	\N	2017-04-25 18:25:09.759	{}
9lOO7JWbVa3inl8muySU	YPGpbTqv9aeZHXxBNgIC	laOPrsD3+7NQZY5NzCoP	870	\N	2017-04-24 12:09:10.201	{}
i1HibY0XbOcnhqrt6O0K	3KOaA2+6IjmFPfm4ChIJ	rqCjkOwXvXstTuKXITz6	192	\N	2017-04-26 01:30:21.129	{}
0vEJ0UT14/Y5IY60zjtd	XklfmXtmNz7WRzaFwJPY	fCFXuni4r3phDfQtGE9e	46	\N	2017-04-25 09:06:24.002	{}
Whm5Oj0OprzyNwRODvE7	XklfmXtmNz7WRzaFwJPY	F5R6Nlcc8dIbuOtHLmAl	235	\N	2017-04-24 17:08:01.068	{}
d0+LN3yHteyUdMy9jm3m	VErp5+HZdn3Yz2G88TZh	XZbEc4KRdVRBOFXFk6bd	546	\N	2017-04-25 02:33:51.055	{}
8kHwXKzmUKEEuoM+ocvF	sAxdggjzUR7+K6sSxnyU	Pi1WJRlck0B2Uu3WV5mt	993	\N	2017-04-24 11:46:39.542	{}
P0Nr4FjS/JcWcTpB27EG	VErp5+HZdn3Yz2G88TZh	ypLy0yfg7xspHcFe+aCq	18	\N	2017-04-25 08:58:35.192	{}
xuhz9re4boGnnbeukj8Q	Mooca+XNOJQaJb6IILB6	W25X3lW9EAIv9MtQh4me	750	\N	2017-04-24 04:35:49.34	{}
PGbsKOqfuUnpTBz20m5/	3KOaA2+6IjmFPfm4ChIJ	5ne/hkZN9VlPEonrPwYc	89	\N	2017-04-26 03:23:37.939	{}
bB4+/puWJyYHmbr0yppL	XklfmXtmNz7WRzaFwJPY	ozuWyPOmCpafcarrJoPp	32	\N	2017-06-24 02:53:13	{}
KysVDUESh6mCALF5nQAh	ZNerBKfcGYvzcUKaYlqg	eXk1zNQOV2RTSC3v6qAR	583	\N	2018-02-26 06:02:48	{}
4JOFMRy9xrJrYn+1Tx5/	kMjFmLjttJpQS3rzutBf	baiq5qJo7QmIq8bne25s	394	\N	2017-06-24 11:49:46	{}
tTcc9ePko5wRpBlpLMSa	kMjFmLjttJpQS3rzutBf	S4qRZAyWmkJNWw5nd/qA	478	\N	2016-04-24 23:46:44	{}
hQGCJLr179LGjix0Np1L	3KOaA2+6IjmFPfm4ChIJ	x2RJ9Yhv1l+2eJFDxJ+5	931	\N	2017-04-24 02:42:06.942	{}
kIJnZusp7WA0B0PctWDn	SBdioRVUMTzSJjoTQ8iG	eXk1zNQOV2RTSC3v6qAR	267	\N	2017-04-24 21:00:57.145	{}
l5YDuzG0ejtrdw255j49	SBdioRVUMTzSJjoTQ8iG	NiRtPkH7fyIw3cVBi1sk	59	\N	2017-04-25 20:41:00.848	{}
KVGrKJpVkDyAH7g6bezw	Hjjd3Ns0lvG3cs9jj4N7	LFYTnlxrypasGzUi8a3w	572	\N	2017-04-24 19:39:43.37	{}
0dMG4eESodUlhrLP/gA9	y90eN2IFt6lwJmUaK9TF	XwawjiF/UWXIIIIl8A35	224	\N	2017-04-26 22:34:01.51	{}
hhQPB//8ih8/Zm8gQEiG	TMTdMrgBYgxYoTLKWv35	RuA19x3fDp1ZeEz7sw0Y	146	\N	2017-04-26 13:29:25.917	{}
D8VckbOfrj8gtIpJe5dF	nbFMJA7w8Ms8VOsgI8Uj	QRnSsDMEyA7nB5JlYqkI	568	\N	2017-04-26 04:43:14.312	{}
gyJvzIqyBP5OGD9lxlGE	TMTdMrgBYgxYoTLKWv35	PEhsx6FsCBsbL9K900vy	966	\N	2017-04-26 02:46:53.946	{}
9vodf2AtYjTibg7COroK	sAxdggjzUR7+K6sSxnyU	2T5dn6zTS+8MoYIPR6UI	480	\N	2017-04-26 16:44:56.045	{}
5hjEuy7zWypaEJZgqXsO	SBdioRVUMTzSJjoTQ8iG	g4s6X1h2ULwJiaetj7E2	184	\N	2017-04-25 02:17:56.836	{}
YcAEjNT9a/J7CvzH8kSa	kMjFmLjttJpQS3rzutBf	81J07pnV9BrsCx21/oX4	118	\N	2017-04-25 15:32:58.566	{}
w0CPSq/1W8UWIA9a4DBb	SBdioRVUMTzSJjoTQ8iG	3CTVMkbsITB79i6OEmUe	301	\N	2017-04-26 06:28:10.429	{}
W9CexfJcXuuRoxa8NyqJ	YPGpbTqv9aeZHXxBNgIC	CsSDxrvAtWNb5NrBj5Bc	58	\N	2017-04-26 03:24:37.089	{}
dIcR2kNwKlIwHR/dQm3P	Mooca+XNOJQaJb6IILB6	DmsPTclCfjOyoh2xW5WR	187	\N	2017-04-24 21:58:27.668	{}
jCNBcX1jHar74g8Cdy1V	Hjjd3Ns0lvG3cs9jj4N7	hN3Y/AhQqtDWM/dUsNGe	566	\N	2017-04-26 21:32:02.796	{}
0jRhjm3rLwHaARFWR7v5	Mooca+XNOJQaJb6IILB6	KlDHviOp+M9hNwpHzIHr	231	\N	2017-04-26 03:09:12.343	{}
wRtS1a0t1fz/JfROdQf0	CBp22Vfd78M4NgkRafEo	RvFUV4c61WMzWkEsqN9h	12	\N	2017-04-25 12:00:32.081	{}
PAgWZ6Ukv+JXxhyi0fWm	TMTdMrgBYgxYoTLKWv35	tUaeThVJdUmUI65k4V5a	601	\N	2017-04-25 21:48:13.269	{}
+pVmoSjL++c0WZpk0VGY	VErp5+HZdn3Yz2G88TZh	xwE31xNhq7y8ZpE8xp74	231	\N	2017-04-26 07:49:19.656	{}
0ZBHJiBUNy3vLISw+UKz	nbFMJA7w8Ms8VOsgI8Uj	9h1y3jT8QdTsJyWDBN9/	245	\N	2017-04-26 22:23:23.55	{}
UlCnZVUzTXjBT3W1euom	TMTdMrgBYgxYoTLKWv35	h/3xVKiMhgdDiOgrhXOr	25	\N	2017-04-25 02:34:52.077	{}
j0nDCaMkbUvdDEYEJCl0	budgvhf/oqc9FWtiR59c	10mZl57kD4OGn8jHDqkD	90	\N	2017-04-26 23:27:36.342	{}
A0PXkhpCE1MdMqIL69IW	TMTdMrgBYgxYoTLKWv35	T4u53Q0zqk+jtd2EN0L+	542	\N	2017-04-25 21:06:18.051	{}
lFfX31u1Alx9fNYYCspA	XklfmXtmNz7WRzaFwJPY	v1rRQbhc0QjrTM9qLAhF	506	\N	2017-04-24 17:22:05.599	{}
3XsuGVt6DIjrztyJRgS7	CBp22Vfd78M4NgkRafEo	3WNHhJ3+oJHtmxcgQUt4	662	\N	2017-04-26 02:24:47.446	{}
yLU7SuWnJt/IRaHjvAjY	budgvhf/oqc9FWtiR59c	3X9dONX0LY0emmuX0eUz	395	\N	2017-04-26 14:07:17.463	{}
DeNWI4zzsTIc6Ey+iKw4	budgvhf/oqc9FWtiR59c	TpswmmeORDk7x6YfjmgG	639	\N	2017-04-25 23:37:25.362	{}
RqrICVxU3DkKWITebaRd	SBdioRVUMTzSJjoTQ8iG	fNii742XpZLFUrFrMjra	190	\N	2017-04-26 17:53:53.516	{}
+QunQOJIIutnBZmWxfYm	sAxdggjzUR7+K6sSxnyU	D028RZHGbY/vg6GxTF8g	642	\N	2017-04-26 01:45:02.366	{}
GJoElRheya/bw+IViX3S	3KOaA2+6IjmFPfm4ChIJ	r5hYJ4ncw8RlduUdaNQV	132	\N	2017-04-24 18:38:13.639	{}
MiQXG1PcHvTEoKVoLKQd	XklfmXtmNz7WRzaFwJPY	x8k7gwa028UtrRnWF8Ww	961	\N	2017-04-25 00:08:43.787	{}
XgDorlqqHgqLxkDUymaL	Hjjd3Ns0lvG3cs9jj4N7	PUepN4xl3NZ9DLebk1IB	915	\N	2017-04-24 19:44:51.288	{}
GzPmWoQZwLIYEgTiDo4+	VErp5+HZdn3Yz2G88TZh	1yVUMqjG23kktwrYcfvZ	436	\N	2017-04-26 14:55:53.375	{}
yPyifYJXkkibia/+B4Tz	SBdioRVUMTzSJjoTQ8iG	4hD7zTOsl4VKDE38IGtu	49	\N	2017-04-25 14:48:51.626	{}
qacq8eQIczCYUH4JMBa4	TMTdMrgBYgxYoTLKWv35	1ctb8YKUVQi5Zenj9Dk4	743	\N	2017-04-26 12:33:00.488	{}
/Brj0rFMMESlF76B6GKU	3KOaA2+6IjmFPfm4ChIJ	90rzm8CmU5i6sQc09s7w	878	\N	2017-04-25 21:16:09.181	{}
6cQrh7je63Ui7LBSorBm	nbFMJA7w8Ms8VOsgI8Uj	mFd4fH+z4oRzwHlTdK0i	368	\N	2017-04-24 02:12:44.434	{}
eHbx8bOy9uzxG/UfQU+9	rc+ccdAK8F4ROpIC299B	pHz0wDcklqaLHl1dG38J	632	\N	2017-04-25 18:10:44.641	{}
tyrLnjlvyiAn3l+RdttN	y90eN2IFt6lwJmUaK9TF	lbPRQGwEGVVX0tMaFqjK	717	\N	2017-04-25 11:31:49.119	{}
cO+4Al22Z4oMjpk0p7Lv	sAxdggjzUR7+K6sSxnyU	RmyzDGhFDnwb4qyN/AHA	270	\N	2017-04-24 05:45:15.631	{}
e3iyP5E4OGJ8EzSYXdpv	0/Dg4ohpw1BIoLvDgRkh	gTz1FDKq+IxZfnTZVNAi	490	\N	2017-04-25 16:16:20.681	{}
BhZWv5QjhiDIlEqz90eH	3KOaA2+6IjmFPfm4ChIJ	/EhpeZGCZNebBG98d6+P	993	\N	2017-04-24 10:51:55.031	{}
+XMn08wfyOslB3vjCIHj	nbFMJA7w8Ms8VOsgI8Uj	CMN6Qx3UpF1diC7kH1ib	153	\N	2017-04-26 13:28:09.538	{}
2/ILlcMgEMCQmOHN60s/	y90eN2IFt6lwJmUaK9TF	lpALzONombkrdI9rLfy7	396	\N	2017-04-25 00:14:26.002	{}
BPXAbrA/2ICVcjfXT+Lj	VErp5+HZdn3Yz2G88TZh	6p0d1p36yh6kGjexeA+o	498	\N	2017-04-26 06:12:09.576	{}
GQZWn/vE/3NZyufgUhJc	XklfmXtmNz7WRzaFwJPY	Pp5r6s9stYSZgMkZ/5oe	606	\N	2017-04-26 16:15:44.712	{}
K9lkv+Q46PJ8KYgKpfYZ	ljr+mdhFYpVziaRs0plq	3GyTGrhXYJ4CLn9V/LeN	2	\N	2017-04-25 12:16:15.026	{}
SuZYprFulCHyPJeRNXZl	sAxdggjzUR7+K6sSxnyU	T/2Z1wdnNt21ziRUs22X	991	\N	2017-04-24 21:55:33.181	{}
hiMupUT6P4eQFI0JEJ/O	kMjFmLjttJpQS3rzutBf	g6/GNKiVzKsdale/1x5t	760	\N	2017-04-25 17:36:10.207	{}
EQSsTKgGGWAdzTJxmV5l	kMjFmLjttJpQS3rzutBf	Rc9Pokueco+DyFjhkPpq	477	\N	2017-04-25 23:08:18.827	{}
GRTiS9d1z2Gz+iQgiz3h	CBp22Vfd78M4NgkRafEo	e4Zd4xL9xwgJasjMUO/8	913	\N	2017-04-24 13:59:46.33	{}
zp7R+pmwbKZFfr64C/pI	0/Dg4ohpw1BIoLvDgRkh	+YM7zAEystclHZhUHI+W	327	\N	2017-04-25 11:32:29.422	{}
2lwFgyNcPzgv912XQ82X	TMTdMrgBYgxYoTLKWv35	BSlm/K3brY9BOBRVln7A	278	\N	2017-04-24 12:48:48.572	{}
6YvDtA0iEO8KmZzOzM7k	CBp22Vfd78M4NgkRafEo	HYgifAP03ClpWYHs1khi	864	\N	2017-04-25 17:36:35.299	{}
TzdYaGWI+iyBobo9nnw0	sAxdggjzUR7+K6sSxnyU	8IfFd4SDQn7BEJNlcmAV	60	\N	2017-04-24 09:12:53.052	{}
iv66p0Csb0fI1th/39rL	Hjjd3Ns0lvG3cs9jj4N7	rqCjkOwXvXstTuKXITz6	530	\N	2017-04-26 17:00:37.876	{}
OM8k/ngM5gBYRdYLWTZZ	kMjFmLjttJpQS3rzutBf	fCFXuni4r3phDfQtGE9e	300	\N	2017-04-25 20:44:05.238	{}
+LKm7BPmYV/HXhyLkmS3	VErp5+HZdn3Yz2G88TZh	LMmZ6EzX1nfSSh19cInl	211	\N	2017-04-26 05:21:18.467	{}
23sSFdGBCKzPZ1oJ9ueD	CBp22Vfd78M4NgkRafEo	XZbEc4KRdVRBOFXFk6bd	917	\N	2017-04-25 06:45:55.124	{}
7eoEOX70nUvPrvWcpI/L	ZNerBKfcGYvzcUKaYlqg	ypLy0yfg7xspHcFe+aCq	805	\N	2017-04-25 18:08:04.529	{}
blDtIkqhPxTveQk7CJFy	Mooca+XNOJQaJb6IILB6	W25X3lW9EAIv9MtQh4me	504	\N	2017-04-25 03:51:39.422	{}
9I/O1W4sxc2naKIEPE0K	sAxdggjzUR7+K6sSxnyU	vAZkS8QPrcDtMw5o1MS9	320	\N	2017-04-26 08:04:31.604	{}
6985YbcH/TdV67rR7l6C	kMjFmLjttJpQS3rzutBf	8Qv/+tJ0qfJMUx3ZxvpC	888	\N	2017-04-25 15:00:15.3	{}
gl6wi0iKppAWsgfqPN7X	0/Dg4ohpw1BIoLvDgRkh	0y7YnwAXjiXk8HUdHw1E	967	\N	2017-04-24 09:03:45.405	{}
imPyKMa4t0EN4BSIgVl/	/cFEfNMpFxRDc1+1PpSb	B7fAevV3J5shq9LZU80N	171	\N	2017-04-24 02:59:03.87	{}
6IYKBRlsSQ5ZvpwmcTn1	VErp5+HZdn3Yz2G88TZh	x2RJ9Yhv1l+2eJFDxJ+5	286	\N	2017-04-25 03:49:25.176	{}
lftCqmDeAR3cEpZHBxqS	ZNerBKfcGYvzcUKaYlqg	DcOnrIMRsbI5JV52lTdD	567	\N	2017-04-25 01:21:39.402	{}
2X9UMoZFvUlPeoaUqLjI	CBp22Vfd78M4NgkRafEo	NiRtPkH7fyIw3cVBi1sk	6	\N	2017-04-26 19:52:30.916	{}
/DvEwGVHmfOjWU5MyPbj	SBdioRVUMTzSJjoTQ8iG	LFYTnlxrypasGzUi8a3w	952	\N	2017-04-25 14:17:30.588	{}
TYtRJ660Y1EtluLzieP8	YPGpbTqv9aeZHXxBNgIC	nCk4YBzK5l1IztWIPFaW	975	\N	2017-04-25 09:03:59.17	{}
hyrt6IOKgY42V7jSDFLL	YPGpbTqv9aeZHXxBNgIC	RuA19x3fDp1ZeEz7sw0Y	929	\N	2017-04-25 18:29:16.331	{}
pR1bn5Joov++YJqVDEpB	0/Dg4ohpw1BIoLvDgRkh	LGFi0OvRDakb5a13l0uN	860	\N	2017-04-24 21:12:40.541	{}
OQoFerCp/TW8gUsLvLbz	ljr+mdhFYpVziaRs0plq	ps9KFHZQWJhlTPKjoREV	518	\N	2017-04-24 02:25:56.568	{}
megQbGSo8F2sH6/zJC6K	ZNerBKfcGYvzcUKaYlqg	rHloRQdFWHyF04VfHGlq	50	\N	2017-04-26 02:43:55.096	{}
YxrgwXWJJGIxANfsTx3y	ZNerBKfcGYvzcUKaYlqg	baiq5qJo7QmIq8bne25s	938	\N	2017-04-24 23:28:55.371	{}
W59E11+90sKpgftOxYFm	+2fxb2EecC80U2DcxPMF	81J07pnV9BrsCx21/oX4	704	\N	2017-04-26 17:30:29.462	{}
gRc41uA70ux0haqg0LbM	budgvhf/oqc9FWtiR59c	6nZX4L8s1IhtMhuhuR5N	564	\N	2017-04-24 19:42:15.669	{}
Pt2gTMUkuhsFJQUrEaII	CBp22Vfd78M4NgkRafEo	nlMFl79kePKtL0ocrR+H	622	\N	2017-04-24 13:19:35.768	{}
LQ2etiLN+WvuUIPMwsLX	XklfmXtmNz7WRzaFwJPY	oOi90UWp1RUxmEV27qcb	275	\N	2017-04-25 00:25:54.255	{}
wbzTyg7bDGy/erS/zGQT	y90eN2IFt6lwJmUaK9TF	hN3Y/AhQqtDWM/dUsNGe	545	\N	2017-04-25 14:48:21.336	{}
qlmPIGJQZ1F6xVqkEpqd	kMjFmLjttJpQS3rzutBf	CHv+0CYlbIplUtmCCU7K	200	\N	2017-04-26 17:53:10.452	{}
q75ooO0Rde11iLa7wgs3	SBdioRVUMTzSJjoTQ8iG	RvFUV4c61WMzWkEsqN9h	40	\N	2017-04-25 15:00:02.12	{}
6moDcX71qN3G2wukU8NT	VErp5+HZdn3Yz2G88TZh	z0xTIPxxhGCO0mjcjQ9z	86	\N	2017-04-25 11:34:43.675	{}
4/tlEjQfBC6+16BRBUWA	SBdioRVUMTzSJjoTQ8iG	rUnSDBKcEohBm52vsdAD	924	\N	2017-04-26 01:44:39.57	{}
5mzLg65fgyO7peIPpbB+	CBp22Vfd78M4NgkRafEo	qzYWi0Fbdg6J4kFUUiTh	63	\N	2017-04-25 12:23:23.943	{}
a6VuZA5WgH4sShur281y	sAxdggjzUR7+K6sSxnyU	VSW1UK99KY7AA/zDbtmz	772	\N	2017-04-25 18:04:52.215	{}
qR3kBjQYnaYHk/8nmB+n	Hjjd3Ns0lvG3cs9jj4N7	MUCNoCy1Ntjza0U69Hcl	60	\N	2017-04-24 02:22:52.257	{}
hfHJLUeXYXNLzIu1JdQ5	XklfmXtmNz7WRzaFwJPY	seC63h8LBMblqrbw6Frf	551	\N	2017-04-24 15:01:11.843	{}
5scpCNOru3HOcKnLxuyo	kMjFmLjttJpQS3rzutBf	ipYmBwlB92y3YqJdgWNe	685	\N	2017-04-26 22:43:54.748	{}
VwyLSIegQC/smNMjRmZq	ZNerBKfcGYvzcUKaYlqg	v1rRQbhc0QjrTM9qLAhF	50	\N	2017-04-26 10:01:04.433	{}
zSrBtK/osmMR36FatPRL	VErp5+HZdn3Yz2G88TZh	XIqI+cAG/wJEMy7sEZsi	220	\N	2017-04-24 15:27:10.001	{}
NGhn0TAgkZTLvM07bAJV	XklfmXtmNz7WRzaFwJPY	3X9dONX0LY0emmuX0eUz	584	\N	2017-04-24 03:28:51.709	{}
GzgyRMogFBGXF8kE3eMh	budgvhf/oqc9FWtiR59c	cannWQTiwmtyzGFwlDTO	275	\N	2017-04-24 04:56:56.04	{}
1xeB7XgJ158mIbQltCmR	3KOaA2+6IjmFPfm4ChIJ	sN+vKOoDDgpfrDrBGB+2	879	\N	2017-04-26 01:20:23.995	{}
H2whJDBxgKTjkE6EPiyI	budgvhf/oqc9FWtiR59c	OAj872OQpjpTQwsbaJUt	98	\N	2017-04-24 11:02:59.825	{}
sCUl8MhmC6hnQ8MYlBfQ	nbFMJA7w8Ms8VOsgI8Uj	9Yh7/h20AH5gQBC5qt0t	380	\N	2017-04-25 22:00:03.635	{}
h2zaeCiLBxYeCBXIS129	y90eN2IFt6lwJmUaK9TF	yMhaF3jPG+xcBc6AWT1z	867	\N	2017-04-25 15:06:43.686	{}
/yGPfuwhZGTRgW5c+Eap	sAxdggjzUR7+K6sSxnyU	gTUQR1KB2GaOr+1lAKR2	635	\N	2017-04-26 23:19:41.243	{}
cjPMvAtcQUYSsykC2BXx	0/Dg4ohpw1BIoLvDgRkh	xrNVMKxPNxJUCayjMNYu	199	\N	2017-04-26 18:51:07.27	{}
/tUuB3k42jdVpOUmZq4E	Mooca+XNOJQaJb6IILB6	6bsl/HFLkGmxu/QwO6rL	853	\N	2017-04-26 08:40:37.322	{}
aXEDuYsrUurDknVTFfsY	y90eN2IFt6lwJmUaK9TF	1ctb8YKUVQi5Zenj9Dk4	580	\N	2017-04-24 03:53:02.598	{}
A8XEwKy3Mj+HmPwuRvYx	YPGpbTqv9aeZHXxBNgIC	wDRLWNMtGzfCRao1kUni	557	\N	2017-04-24 17:04:36.787	{}
pt52L+69xBYqKYTXZ2DD	Hjjd3Ns0lvG3cs9jj4N7	mFd4fH+z4oRzwHlTdK0i	382	\N	2017-04-25 06:47:26.039	{}
RSbOGpAoSP5R2SMXOPNw	Mooca+XNOJQaJb6IILB6	pHz0wDcklqaLHl1dG38J	479	\N	2017-04-25 08:22:55.214	{}
7L1ek+t83NEkGr5eG6R4	ZNerBKfcGYvzcUKaYlqg	Lf0Z5/9Nib6Pvz8s/hoi	829	\N	2017-04-26 05:46:02.439	{}
K9rMKSeclgZcEY2Z+4ES	+2fxb2EecC80U2DcxPMF	lbPRQGwEGVVX0tMaFqjK	667	\N	2017-04-24 21:37:06.026	{}
cxIO90arIyOo5CVh5N4p	3KOaA2+6IjmFPfm4ChIJ	6AYJ9KIBgzssNJKnehTE	325	\N	2017-04-25 17:14:30.016	{}
Bu7NDpJsuDbe60h2FxmA	CBp22Vfd78M4NgkRafEo	39cDe41sSsEr/lK5S1Vo	323	\N	2017-04-26 04:19:39.139	{}
pNwJATFryRCgmJEkw19+	Mooca+XNOJQaJb6IILB6	/EhpeZGCZNebBG98d6+P	267	\N	2017-04-25 09:14:00.929	{}
mCXOMv6RdHrmraAiwQLv	CBp22Vfd78M4NgkRafEo	CMN6Qx3UpF1diC7kH1ib	724	\N	2017-04-24 12:54:39.159	{}
LHlAZQz8j1QeVrWBXe7f	+2fxb2EecC80U2DcxPMF	lpALzONombkrdI9rLfy7	38	\N	2017-04-24 07:05:14.653	{}
PvPg44DJQdRcqH4TQ8ma	SBdioRVUMTzSJjoTQ8iG	6p0d1p36yh6kGjexeA+o	975	\N	2017-04-24 23:45:01.854	{}
qCRJlqKI5SXjI27qermT	VErp5+HZdn3Yz2G88TZh	hqvb/Tz92YPrJQbY+zTg	159	\N	2017-04-26 00:32:04.564	{}
zeQldJes1Iug17givdid	TMTdMrgBYgxYoTLKWv35	3GyTGrhXYJ4CLn9V/LeN	174	\N	2017-04-26 03:26:19.518	{}
IkGwj0MMnVsmMdIlAqes	VErp5+HZdn3Yz2G88TZh	T/2Z1wdnNt21ziRUs22X	126	\N	2017-04-25 20:36:58.123	{}
i3hMPG4Er1bhOwLKAM2D	0/Dg4ohpw1BIoLvDgRkh	g6/GNKiVzKsdale/1x5t	52	\N	2017-04-26 06:22:38.777	{}
fEYfhO5OJblZXMjwwiK9	+2fxb2EecC80U2DcxPMF	DzUOlUNYsszexYbX9Tlm	150	\N	2017-04-26 16:05:11.358	{}
6gZRdgkSLQ22CP8bnoGJ	0/Dg4ohpw1BIoLvDgRkh	DpgdwnfeSqk6jVDEr46c	581	\N	2017-04-24 05:41:19.556	{}
h36KXivOhkDARB5rtq2k	Hjjd3Ns0lvG3cs9jj4N7	37Q7vBju5j4p/Qiby/3g	514	\N	2017-04-26 18:45:23.417	{}
00gPgchm6nml6J+KznmT	rc+ccdAK8F4ROpIC299B	SBsVotrtu66V9CMdy4dd	839	\N	2017-04-25 08:54:13.184	{}
JjC/itpupsmOVSkp99g7	Hjjd3Ns0lvG3cs9jj4N7	laOPrsD3+7NQZY5NzCoP	418	\N	2017-04-24 05:32:31.098	{}
uwvLAE1foAPnX8SJHw2+	ljr+mdhFYpVziaRs0plq	30BwIBEo+MscPUXx1bId	47	\N	2017-04-24 23:28:22.311	{}
j8fDqedlOj42lEGRXt1d	CBp22Vfd78M4NgkRafEo	I8wW9sHyEaBDZyRsns0R	266	\N	2017-04-26 07:31:37.279	{}
n3T3Ss/c/yFzyi3EnwQw	YPGpbTqv9aeZHXxBNgIC	F5R6Nlcc8dIbuOtHLmAl	87	\N	2017-04-25 09:13:14.848	{}
LDUdUowllvjnEsiVRKL9	SBdioRVUMTzSJjoTQ8iG	7IyTJXQtQlihf6rCSsrA	679	\N	2017-04-24 00:34:51.404	{}
jBljRod8UgtJ+IKl6cQo	0/Dg4ohpw1BIoLvDgRkh	pSI0Aq8pGfn+3ovvusbW	565	\N	2017-04-25 21:40:16.184	{}
UCFraL7oo0gjuJSjQFnX	VErp5+HZdn3Yz2G88TZh	F2WTu+/aHLxxFKLjqkGx	645	\N	2017-04-24 13:30:43.523	{}
uS7Xvx5BVRWpf1ZZ+XJE	budgvhf/oqc9FWtiR59c	G/02ZcW33qaWaxiM5+Fm	826	\N	2017-04-25 10:56:55.447	{}
M9WjCxgWBhIk9WEyFxiy	SBdioRVUMTzSJjoTQ8iG	hDjW2XmrE03O/PhzQpPM	977	\N	2017-04-25 16:14:34.983	{}
hFYqPcZ3yAbqmYHjHXEv	SBdioRVUMTzSJjoTQ8iG	0y7YnwAXjiXk8HUdHw1E	318	\N	2017-04-26 10:23:56.774	{}
OG/RjzLcy5m5jLWANt04	VErp5+HZdn3Yz2G88TZh	VlYOuRD1DKLMCpd/X8RQ	62	\N	2017-04-24 20:58:44.417	{}
oTuTlNKm8lHOD57ThYra	Mooca+XNOJQaJb6IILB6	DcOnrIMRsbI5JV52lTdD	88	\N	2017-04-24 13:09:46.031	{}
gW6v8ZaBDHgoQdkerA7t	VErp5+HZdn3Yz2G88TZh	S4qRZAyWmkJNWw5nd/qA	131	\N	2017-04-25 23:22:31.736	{}
/oYRyusJGd2FOnBtpbZW	TMTdMrgBYgxYoTLKWv35	wmOgRpwqZcOg2JSRP5h3	547	\N	2017-04-25 15:12:46.54	{}
FotVOb/61xdCaDkdsmLk	kMjFmLjttJpQS3rzutBf	bcIP9xWQa69qDOkrnVpc	651	\N	2017-04-25 16:38:24.517	{}
TNHeu1I4nqem6d3Wssnd	VErp5+HZdn3Yz2G88TZh	9NAJAUdB/fRIvdS1Bekq	639	\N	2017-04-24 01:55:55.675	{}
JQbBa/1djJo0dSHnHr1c	SBdioRVUMTzSJjoTQ8iG	K7FZglmMd4my+MWyoY7a	68	\N	2017-04-25 15:37:49.571	{}
V5PONSP9Ljf5MaEz3PH8	ljr+mdhFYpVziaRs0plq	AX9YStrv9GHPbBb3bV9y	260	\N	2017-04-26 07:43:43.766	{}
4tQPv2UMtkaPxd5icXW7	CBp22Vfd78M4NgkRafEo	rHloRQdFWHyF04VfHGlq	25	\N	2017-04-26 00:48:19.232	{}
fjfkG4/yYYsSJHiXP/N1	sAxdggjzUR7+K6sSxnyU	baiq5qJo7QmIq8bne25s	361	\N	2017-04-25 14:28:01.314	{}
ArYw7NhdqNWL9QqzeNL+	ZNerBKfcGYvzcUKaYlqg	hXmODW3+HBp/11sK2hmG	66	\N	2017-04-26 13:27:50.864	{}
lR4MUTUqPmTtPAb7ujDd	VErp5+HZdn3Yz2G88TZh	5UymsDKtiT8nojcNMHiE	366	\N	2017-04-25 03:28:47.324	{}
TWCjyWg2MxYfFvacp6OT	TMTdMrgBYgxYoTLKWv35	CsSDxrvAtWNb5NrBj5Bc	362	\N	2017-04-24 19:28:05.67	{}
EMjxsnsVkgkQ38b4Sr1W	CBp22Vfd78M4NgkRafEo	CxAO4biVw74/6D8mlRGY	391	\N	2017-04-26 15:46:05.352	{}
0SF0C09OCIcZw0wTPjfh	VErp5+HZdn3Yz2G88TZh	hN3Y/AhQqtDWM/dUsNGe	524	\N	2017-04-26 04:43:27.124	{}
LOLt7/KmUPWq66P0vEYw	0/Dg4ohpw1BIoLvDgRkh	CHv+0CYlbIplUtmCCU7K	415	\N	2017-04-26 23:33:22.802	{}
oNIAMXlITBJDt+mC2lrY	budgvhf/oqc9FWtiR59c	2qz1cQ23UnhdcEBw5KiS	465	\N	2017-04-25 20:40:12.862	{}
Oll3jsYTeDK91hugPL4t	+2fxb2EecC80U2DcxPMF	z0xTIPxxhGCO0mjcjQ9z	693	\N	2017-04-25 04:48:41.282	{}
EP2aOMhaK8xqumko+j19	y90eN2IFt6lwJmUaK9TF	PS7iBtlxeudq8edyQlEe	368	\N	2017-04-24 08:55:58.719	{}
t6leReFPKsWVanGQNukr	SBdioRVUMTzSJjoTQ8iG	qzYWi0Fbdg6J4kFUUiTh	73	\N	2017-04-24 12:51:16.602	{}
icXFybfNPgYPjscLh2Lj	y90eN2IFt6lwJmUaK9TF	h/3xVKiMhgdDiOgrhXOr	572	\N	2017-04-24 04:53:23.107	{}
no6YfyM8r4wjwVzGgT53	SBdioRVUMTzSJjoTQ8iG	10mZl57kD4OGn8jHDqkD	116	\N	2017-04-24 19:29:54.894	{}
rIzYAwb+gIgHozzTU+ET	VErp5+HZdn3Yz2G88TZh	24c2duv4VpBnQRfTUZu7	391	\N	2017-04-26 05:03:24.716	{}
LmjpXox+nIENTlMbmRnR	Hjjd3Ns0lvG3cs9jj4N7	v1rRQbhc0QjrTM9qLAhF	52	\N	2017-04-26 05:00:06.006	{}
PjGnCx5tBPe4wKbX8T8H	3KOaA2+6IjmFPfm4ChIJ	XIqI+cAG/wJEMy7sEZsi	912	\N	2017-04-24 00:54:32.763	{}
UmrqVxNpyrJu7BqMF/W8	3KOaA2+6IjmFPfm4ChIJ	UKgeGGKcEPfMJbWrl/ea	788	\N	2017-04-24 15:33:21.506	{}
5tbw9jI5act9yqyRwUye	sAxdggjzUR7+K6sSxnyU	cannWQTiwmtyzGFwlDTO	462	\N	2017-04-24 18:12:58.557	{}
msBdUUDO3EoZGD7dzpak	ZNerBKfcGYvzcUKaYlqg	sN+vKOoDDgpfrDrBGB+2	217	\N	2017-04-25 15:00:12.787	{}
81UJJrp5UK2zJmHT17wk	/cFEfNMpFxRDc1+1PpSb	OAj872OQpjpTQwsbaJUt	222	\N	2017-04-25 21:10:49.075	{}
uIu2W+B5EGDVvlnfcEH3	VErp5+HZdn3Yz2G88TZh	9Yh7/h20AH5gQBC5qt0t	193	\N	2017-04-24 11:09:21.861	{}
WPxIMu+PVXezemm4Vw6I	TMTdMrgBYgxYoTLKWv35	x8k7gwa028UtrRnWF8Ww	722	\N	2017-04-24 19:46:18.633	{}
lOLYo/vj0ogFXGmlwvQr	XklfmXtmNz7WRzaFwJPY	PUepN4xl3NZ9DLebk1IB	416	\N	2017-04-25 09:15:37.795	{}
uzd340PottN6Zkci0SNI	ZNerBKfcGYvzcUKaYlqg	1yVUMqjG23kktwrYcfvZ	448	\N	2017-04-26 07:44:03.33	{}
38TbV7bJyTWn2JA0vIR4	Hjjd3Ns0lvG3cs9jj4N7	4hD7zTOsl4VKDE38IGtu	411	\N	2017-04-24 22:52:59.699	{}
9UEDSbR6rXxdzMl+FTUS	budgvhf/oqc9FWtiR59c	1ctb8YKUVQi5Zenj9Dk4	806	\N	2017-04-26 16:11:19.745	{}
mukYiitPbKfEcSAUlmpR	nbFMJA7w8Ms8VOsgI8Uj	wDRLWNMtGzfCRao1kUni	83	\N	2017-04-25 18:07:12.094	{}
L5hA7fES2fdRMHfOY620	YPGpbTqv9aeZHXxBNgIC	epoKi5MTnaZX4epgkw10	401	\N	2017-04-25 15:24:47.549	{}
PO4/JGnlb4/DvpSAB7+s	TMTdMrgBYgxYoTLKWv35	t/Qp+NsPlhH4+Tl9/+zo	275	\N	2017-04-24 13:07:55.095	{}
LyGw1jcvB8M0eF2Fy7Yv	0/Dg4ohpw1BIoLvDgRkh	FXBqK5/VD72osVdn9gTI	44	\N	2017-04-24 01:55:26.39	{}
cleyhoS6cYhMc6Ndi7Dc	3KOaA2+6IjmFPfm4ChIJ	Rtk4hpi1RqA2quKlPW2G	532	\N	2017-04-24 10:17:38.777	{}
RW6h7PN8yJyT9G3MJCln	TMTdMrgBYgxYoTLKWv35	6AYJ9KIBgzssNJKnehTE	957	\N	2017-04-26 19:11:17.197	{}
hp4GB4pcGl8d9oEMUd79	budgvhf/oqc9FWtiR59c	39cDe41sSsEr/lK5S1Vo	37	\N	2017-04-26 11:22:55.421	{}
RUZhzaBenGf8a91qOcXT	0/Dg4ohpw1BIoLvDgRkh	/EhpeZGCZNebBG98d6+P	920	\N	2017-04-26 02:53:39.257	{}
oL/yQIx4sNq4YnIzP9Al	TMTdMrgBYgxYoTLKWv35	AmAEjgwBQXRIiSZgh5zl	50	\N	2017-04-25 06:27:19.356	{}
0y5bywPtNtVHNZZHlB8S	budgvhf/oqc9FWtiR59c	qNdc5CCjXwI+TaxPpsB3	206	\N	2017-04-25 14:33:22.404	{}
meCOLulbg/wImdp33SVK	3KOaA2+6IjmFPfm4ChIJ	uAilmTb74J1YAhGlKvos	874	\N	2017-04-24 23:44:04.424	{}
HRCf/JgQjzBLgMeWSmBr	+2fxb2EecC80U2DcxPMF	zuIbn+M1EbpSql8XiiC8	488	\N	2017-04-24 19:24:17.058	{}
hiErLS5sRYCodTCnvFKp	3KOaA2+6IjmFPfm4ChIJ	hqvb/Tz92YPrJQbY+zTg	608	\N	2017-04-25 10:36:57.687	{}
cujmqjUPMjOeGqM4o1NW	rc+ccdAK8F4ROpIC299B	GxXvg2onZYVHoHekIfvb	351	\N	2017-04-26 21:38:37.136	{}
fuO+x9atMcIHHj4YyjqZ	Hjjd3Ns0lvG3cs9jj4N7	iwKfni67D2UnHsByOeqk	986	\N	2017-04-26 05:30:33.671	{}
FTyT3YN5z8Lt0vhGYRQK	/cFEfNMpFxRDc1+1PpSb	MELlCoAwXQXItCWmU0lE	523	\N	2017-04-24 22:49:56.95	{}
Kg/boDy4oV2jNkmkDfRD	budgvhf/oqc9FWtiR59c	Rc9Pokueco+DyFjhkPpq	43	\N	2017-04-26 10:29:25.497	{}
HmnCV9SgaoH6eUfStpfH	+2fxb2EecC80U2DcxPMF	lVg1zcAhUcbs0gLpcXpt	9	\N	2017-04-24 05:30:20.729	{}
cSyhCAnIJbQA6mIGNNbc	TMTdMrgBYgxYoTLKWv35	bhfRylm3eEYyXnEBV0Kj	892	\N	2017-04-25 09:31:49.443	{}
UtKLeUs/mpSlwY/eZNrl	ZNerBKfcGYvzcUKaYlqg	DpgdwnfeSqk6jVDEr46c	935	\N	2017-04-25 22:28:30.882	{}
gdeyz/KXufnXgQyBgLr0	XklfmXtmNz7WRzaFwJPY	37Q7vBju5j4p/Qiby/3g	742	\N	2017-04-26 03:31:46.368	{}
MPPx8pzgKUSheNIQ3E7W	+2fxb2EecC80U2DcxPMF	FK8oH09U2URGASVqs1RX	976	\N	2017-04-26 04:20:47.564	{}
xdTKXBv2ahe2gH5NWItD	SBdioRVUMTzSJjoTQ8iG	8IfFd4SDQn7BEJNlcmAV	264	\N	2017-04-26 14:32:35.644	{}
rZcfZO7SJjxytMQ9Hadz	kMjFmLjttJpQS3rzutBf	rqCjkOwXvXstTuKXITz6	195	\N	2017-04-24 05:26:34.912	{}
wKkCTmUTHSz/6jfCuGxb	+2fxb2EecC80U2DcxPMF	fCFXuni4r3phDfQtGE9e	892	\N	2017-04-26 19:08:53.564	{}
LtLiSIH2xV4teJGaMqMo	sAxdggjzUR7+K6sSxnyU	LMmZ6EzX1nfSSh19cInl	501	\N	2017-04-24 07:21:17.209	{}
4nAJBvGpkP1rmuiBxSh2	XklfmXtmNz7WRzaFwJPY	XZbEc4KRdVRBOFXFk6bd	888	\N	2017-04-25 08:40:53.2	{}
GZ/6C6O0Nd2XLR0Af//q	TMTdMrgBYgxYoTLKWv35	pSI0Aq8pGfn+3ovvusbW	24	\N	2017-04-24 17:57:25.003	{}
0yD85VTr3Ry7KGGOUGBh	ZNerBKfcGYvzcUKaYlqg	F2WTu+/aHLxxFKLjqkGx	73	\N	2017-04-24 19:42:38.422	{}
e7UBspuOcPNpJPRaFheI	SBdioRVUMTzSJjoTQ8iG	vAZkS8QPrcDtMw5o1MS9	16	\N	2017-04-25 03:45:00.833	{}
8cs354JSIp80dSWLm+iR	+2fxb2EecC80U2DcxPMF	VlYOuRD1DKLMCpd/X8RQ	789	\N	2017-04-24 19:28:39.164	{}
xpU9G0wF8V1LUctwGFom	XklfmXtmNz7WRzaFwJPY	DcOnrIMRsbI5JV52lTdD	435	\N	2017-04-24 18:58:23.021	{}
G6Ia+gjDZFPJTUBcdc2Z	YPGpbTqv9aeZHXxBNgIC	LFYTnlxrypasGzUi8a3w	784	\N	2017-04-26 21:27:55.361	{}
Jy2dk1fH7PzplBOSTjTc	0/Dg4ohpw1BIoLvDgRkh	XwawjiF/UWXIIIIl8A35	438	\N	2017-04-24 04:41:35.222	{}
SpPx4EuF4SnZPguPQkGq	CBp22Vfd78M4NgkRafEo	RuA19x3fDp1ZeEz7sw0Y	945	\N	2017-04-26 21:12:23.142	{}
LjIRyCowENtTeaAHAk34	y90eN2IFt6lwJmUaK9TF	LGFi0OvRDakb5a13l0uN	861	\N	2017-04-26 05:45:01.969	{}
5hv+TgghWCjy/NFEHrnE	ljr+mdhFYpVziaRs0plq	AX9YStrv9GHPbBb3bV9y	88	\N	2017-04-25 07:41:18.16	{}
LWKXZshtHYoiWgzSjlf0	nbFMJA7w8Ms8VOsgI8Uj	rHloRQdFWHyF04VfHGlq	362	\N	2017-04-24 19:00:34.932	{}
gejXPQq1U1vAIJ9NPQtT	rc+ccdAK8F4ROpIC299B	baiq5qJo7QmIq8bne25s	806	\N	2017-04-25 17:39:48.592	{}
glXOGS2TM6OAp1MFUx6Y	ZNerBKfcGYvzcUKaYlqg	6nZX4L8s1IhtMhuhuR5N	115	\N	2017-04-25 15:06:21.901	{}
3dfIEUunilA6f32Wl/tT	ljr+mdhFYpVziaRs0plq	5UymsDKtiT8nojcNMHiE	121	\N	2017-04-25 21:23:36.094	{}
punG8/7liCkzoh0fli66	XklfmXtmNz7WRzaFwJPY	CsSDxrvAtWNb5NrBj5Bc	549	\N	2017-04-24 03:04:23.291	{}
gmoLH0lNmsp1zH06hJKV	TMTdMrgBYgxYoTLKWv35	CxAO4biVw74/6D8mlRGY	714	\N	2017-04-26 21:03:41.174	{}
RDzYY6ByTjw3Ng1YY60Q	rc+ccdAK8F4ROpIC299B	ozuWyPOmCpafcarrJoPp	724	\N	2017-04-26 13:45:09.04	{}
G7z53Wb4jSSJOWH2FBZT	Mooca+XNOJQaJb6IILB6	KlDHviOp+M9hNwpHzIHr	152	\N	2017-04-25 01:56:42.518	{}
tbLYjP/qwSKGfiL0OViC	Mooca+XNOJQaJb6IILB6	7oKb3eotaOIq/6fH21SB	136	\N	2017-04-24 08:56:58.553	{}
WaiQELicPhTvbflzewMs	sAxdggjzUR7+K6sSxnyU	tUaeThVJdUmUI65k4V5a	581	\N	2017-04-24 13:17:20.501	{}
3zhU22Ni8nB0f95Cw4eB	nbFMJA7w8Ms8VOsgI8Uj	AZuCEH8NKwFkKPAY5zu0	78	\N	2017-04-25 07:10:50.509	{}
0yJOH5Nus2kocgyL9YnN	sAxdggjzUR7+K6sSxnyU	xwE31xNhq7y8ZpE8xp74	780	\N	2017-04-24 12:42:18.472	{}
TE/ozbzDM5RmK5RT4BW9	TMTdMrgBYgxYoTLKWv35	9h1y3jT8QdTsJyWDBN9/	131	\N	2017-04-24 18:58:40.611	{}
LT2qUVBdrntTTHJQCpAN	nbFMJA7w8Ms8VOsgI8Uj	MUCNoCy1Ntjza0U69Hcl	238	\N	2017-04-24 08:59:48.135	{}
DSGsXUfbnYR0i51pfW0M	kMjFmLjttJpQS3rzutBf	seC63h8LBMblqrbw6Frf	965	\N	2017-04-25 03:20:05.558	{}
1MTro/Ta64P/yfQ38rLU	ljr+mdhFYpVziaRs0plq	T4u53Q0zqk+jtd2EN0L+	63	\N	2017-04-26 18:17:36.707	{}
rBHjcjB/Q9GJcKYZzU6P	Mooca+XNOJQaJb6IILB6	phlzm1ueK3NjTse+7HWB	175	\N	2017-04-25 16:12:16.698	{}
mX9YeQNaAPwTicSFtkjj	kMjFmLjttJpQS3rzutBf	UKgeGGKcEPfMJbWrl/ea	796	\N	2017-04-25 22:46:13.186	{}
CZzAONes1q7YvYR3kWDg	rc+ccdAK8F4ROpIC299B	PahC0hXDjwj48Ja7J7K3	759	\N	2017-04-25 09:58:56.628	{}
IReW7fIyzlzkZ5vFYt8Z	0/Dg4ohpw1BIoLvDgRkh	feoGtNEoQHfDYD4DA35O	563	\N	2017-04-24 04:23:14.341	{}
BrqaJVLtgb6oE3M3JSTV	rc+ccdAK8F4ROpIC299B	sN+vKOoDDgpfrDrBGB+2	334	\N	2017-04-26 17:28:02.627	{}
JfCkmBvnGPGICR+wqXCD	Hjjd3Ns0lvG3cs9jj4N7	D028RZHGbY/vg6GxTF8g	130	\N	2017-04-25 22:10:18.029	{}
NhAoJz+NoVHWmXmjMzKh	sAxdggjzUR7+K6sSxnyU	sVQv8JoUv7CWOtK9fJTX	221	\N	2017-04-26 07:19:26.439	{}
brGhrePxenrQp1ij6omB	+2fxb2EecC80U2DcxPMF	yMhaF3jPG+xcBc6AWT1z	989	\N	2017-04-26 14:54:39.952	{}
SWjwVGA/5Me/jeigpzLN	TMTdMrgBYgxYoTLKWv35	PUepN4xl3NZ9DLebk1IB	37	\N	2017-04-26 23:26:33.683	{}
3wk5RolzLDEyuA2dn2Lp	sAxdggjzUR7+K6sSxnyU	1yVUMqjG23kktwrYcfvZ	520	\N	2017-04-26 21:45:51.087	{}
LNkutEm7HHDmkfzEzI3X	Mooca+XNOJQaJb6IILB6	6bsl/HFLkGmxu/QwO6rL	638	\N	2017-04-26 09:49:06.024	{}
nsTkOZT9ZLCvoX0L8+qr	Mooca+XNOJQaJb6IILB6	1ctb8YKUVQi5Zenj9Dk4	945	\N	2017-04-24 10:22:39.9	{}
J6pSmbhrlhDD1rv1t3qz	rc+ccdAK8F4ROpIC299B	90rzm8CmU5i6sQc09s7w	371	\N	2017-04-25 10:37:18.552	{}
kDCAF77FNznu4ksSPycY	y90eN2IFt6lwJmUaK9TF	mFd4fH+z4oRzwHlTdK0i	133	\N	2017-04-24 18:03:06.184	{}
XzNZ0qPh5zTX7axZL3bv	Mooca+XNOJQaJb6IILB6	pHz0wDcklqaLHl1dG38J	13	\N	2017-04-26 06:06:33.197	{}
0SGDKjj+aBCWe8S+v49f	/cFEfNMpFxRDc1+1PpSb	GOBkT6nZ4L8OZmgEnq79	484	\N	2017-04-25 06:21:29.708	{}
jUaOeO7jRIZx4lt0JfgH	CBp22Vfd78M4NgkRafEo	Rtk4hpi1RqA2quKlPW2G	754	\N	2017-04-26 00:45:46.534	{}
fi78xi3RXOLnrnBB4r+8	ZNerBKfcGYvzcUKaYlqg	CfZ0iG+3WcPdUdTLy9xS	97	\N	2017-04-26 08:11:46.542	{}
H0m0Yg2+nPcBGZ5W3bRY	3KOaA2+6IjmFPfm4ChIJ	IwmjgVG3LWbN7xiCvQMz	907	\N	2017-04-25 02:44:47.096	{}
mz3NbHyyhsW0w0xee+ZF	CBp22Vfd78M4NgkRafEo	AmAEjgwBQXRIiSZgh5zl	47	\N	2017-04-25 21:51:53.229	{}
MM6PtKAUVLR0Khg0Jths	ZNerBKfcGYvzcUKaYlqg	qNdc5CCjXwI+TaxPpsB3	630	\N	2017-04-25 07:30:10.07	{}
4hD4766USdvko7JyOi1Q	CBp22Vfd78M4NgkRafEo	lpALzONombkrdI9rLfy7	928	\N	2017-04-24 12:44:40.967	{}
kUV8d10omNNo9ZAIez4g	0/Dg4ohpw1BIoLvDgRkh	RrSDtsqnl4Yx6+HuhZyH	704	\N	2017-04-25 07:30:24.939	{}
UhmZsjJZVv4WlzQrufXb	Mooca+XNOJQaJb6IILB6	hqvb/Tz92YPrJQbY+zTg	175	\N	2017-04-24 23:57:40.163	{}
MpPbpvrDqpIJl1NeQ8NU	Hjjd3Ns0lvG3cs9jj4N7	GxXvg2onZYVHoHekIfvb	9	\N	2017-04-25 16:38:19.128	{}
Rjzct/ZKQmxLt3l0sDw+	ZNerBKfcGYvzcUKaYlqg	T/2Z1wdnNt21ziRUs22X	575	\N	2017-04-25 09:20:56.211	{}
SNEHUVdrVbjj1/+Sc6vI	YPGpbTqv9aeZHXxBNgIC	MELlCoAwXQXItCWmU0lE	753	\N	2017-04-25 13:23:43.319	{}
7ETzTYmF8cQzJRPkjrC6	Mooca+XNOJQaJb6IILB6	Rc9Pokueco+DyFjhkPpq	921	\N	2017-04-25 16:03:40.564	{}
ksz49huJOglsvvkCeF/R	y90eN2IFt6lwJmUaK9TF	bhfRylm3eEYyXnEBV0Kj	806	\N	2017-04-24 18:31:25.731	{}
8lpqKYpcai2pxFa85MQb	rc+ccdAK8F4ROpIC299B	DpgdwnfeSqk6jVDEr46c	770	\N	2017-04-25 01:15:31.923	{}
eZu4QTWFFUcZVyXDgTyJ	0/Dg4ohpw1BIoLvDgRkh	37Q7vBju5j4p/Qiby/3g	29	\N	2017-04-24 18:10:57.662	{}
WjKFj5/5coCo0/rHy+uy	TMTdMrgBYgxYoTLKWv35	SBsVotrtu66V9CMdy4dd	886	\N	2017-04-25 08:27:19.079	{}
mqkwLmj0/D7veSchx47h	VErp5+HZdn3Yz2G88TZh	laOPrsD3+7NQZY5NzCoP	975	\N	2017-04-25 12:45:38.207	{}
FieZYYNtRcYxBQkzwQDO	Hjjd3Ns0lvG3cs9jj4N7	rqCjkOwXvXstTuKXITz6	725	\N	2017-04-26 01:14:57.345	{}
A3JCZifpYKa7dRCieU0w	3KOaA2+6IjmFPfm4ChIJ	fCFXuni4r3phDfQtGE9e	299	\N	2017-04-26 00:28:21.812	{}
bKi5O3uf7CJWAW5/H3hK	Hjjd3Ns0lvG3cs9jj4N7	F5R6Nlcc8dIbuOtHLmAl	179	\N	2017-04-24 05:59:58.662	{}
/wr3p0//YwLC5nr7mJYk	ZNerBKfcGYvzcUKaYlqg	7IyTJXQtQlihf6rCSsrA	258	\N	2017-04-24 04:35:47.722	{}
wYdnHvMfXeySj+MuuAfw	y90eN2IFt6lwJmUaK9TF	Pi1WJRlck0B2Uu3WV5mt	545	\N	2017-04-24 22:42:23.006	{}
E2f/Xnxib2+/L9gmbYft	YPGpbTqv9aeZHXxBNgIC	ypLy0yfg7xspHcFe+aCq	743	\N	2017-04-26 19:40:56.766	{}
4MYnE772QHhlNl1SySyQ	CBp22Vfd78M4NgkRafEo	W25X3lW9EAIv9MtQh4me	509	\N	2017-04-26 04:37:55.407	{}
3wR/EMeRZ1k4kdou6Nll	TMTdMrgBYgxYoTLKWv35	5ne/hkZN9VlPEonrPwYc	597	\N	2017-04-26 20:21:20.11	{}
2PZQvAldC12Q+XwGruKo	VErp5+HZdn3Yz2G88TZh	8Qv/+tJ0qfJMUx3ZxvpC	182	\N	2017-04-26 11:06:59.527	{}
lKI5yhU7dqsSv/yvnc9T	nbFMJA7w8Ms8VOsgI8Uj	VlYOuRD1DKLMCpd/X8RQ	568	\N	2017-04-26 11:41:02.614	{}
ukcP4LK/hXMVsO/Zbe0c	kMjFmLjttJpQS3rzutBf	DcOnrIMRsbI5JV52lTdD	63	\N	2017-04-25 00:05:30.636	{}
v2fOIwSsah8k0dM4WtIM	Mooca+XNOJQaJb6IILB6	LFYTnlxrypasGzUi8a3w	805	\N	2017-04-25 02:54:11.812	{}
VOxHnUgY3XNAgWgpqMLk	kMjFmLjttJpQS3rzutBf	h+PmeJ3UBluI5W2JWafo	184	\N	2017-04-24 14:24:31.484	{}
lb3ZcPYj+BkWCKuR4mKH	Mooca+XNOJQaJb6IILB6	RuA19x3fDp1ZeEz7sw0Y	404	\N	2017-04-24 02:11:27.231	{}
oowtKU4Qpr4XWHZGhv6g	XklfmXtmNz7WRzaFwJPY	K7FZglmMd4my+MWyoY7a	341	\N	2017-04-24 23:20:31.443	{}
5d/V5F1GWDzcI8Cn9Df/	SBdioRVUMTzSJjoTQ8iG	AX9YStrv9GHPbBb3bV9y	261	\N	2017-04-24 05:11:04.771	{}
veaYYudcbl6todN1USuw	CBp22Vfd78M4NgkRafEo	2T5dn6zTS+8MoYIPR6UI	800	\N	2017-04-26 17:15:56.908	{}
FhOhc9FJiHXRzkozTaYB	CBp22Vfd78M4NgkRafEo	baiq5qJo7QmIq8bne25s	39	\N	2017-04-24 16:36:58.011	{}
JLtR13lwv3V4ye12v5pe	3KOaA2+6IjmFPfm4ChIJ	hXmODW3+HBp/11sK2hmG	747	\N	2017-04-24 07:25:28.519	{}
Ejt0oig9z1YZJxZqYkKx	CBp22Vfd78M4NgkRafEo	5UymsDKtiT8nojcNMHiE	791	\N	2017-04-26 01:16:08.432	{}
XHaAvyRuw75gKiM6K1ij	sAxdggjzUR7+K6sSxnyU	CsSDxrvAtWNb5NrBj5Bc	848	\N	2017-04-26 06:36:40.675	{}
mpupbOPWbJgyhKB3i7sE	+2fxb2EecC80U2DcxPMF	DmsPTclCfjOyoh2xW5WR	998	\N	2017-04-26 14:27:21.25	{}
a8N00cWYU5dF2AMSLKkl	+2fxb2EecC80U2DcxPMF	OTS756rcFuq0vI0/iK2F	431	\N	2017-04-24 15:03:00.304	{}
tvVuNQVVTnNYUDF7i6kr	0/Dg4ohpw1BIoLvDgRkh	KlDHviOp+M9hNwpHzIHr	757	\N	2017-04-24 11:25:48.106	{}
4170uzElE0lBIIWgU40A	0/Dg4ohpw1BIoLvDgRkh	7oKb3eotaOIq/6fH21SB	384	\N	2017-04-24 10:29:20.967	{}
Ch4O7kTWjjNGuVTIJjIs	Hjjd3Ns0lvG3cs9jj4N7	tUaeThVJdUmUI65k4V5a	920	\N	2017-04-26 11:52:08.806	{}
tib9CVwb7qb6NM3+BSmQ	CBp22Vfd78M4NgkRafEo	AZuCEH8NKwFkKPAY5zu0	331	\N	2017-04-26 20:14:53.062	{}
EWt49IKaaO4xHAkHzUvz	rc+ccdAK8F4ROpIC299B	xwE31xNhq7y8ZpE8xp74	104	\N	2017-04-26 01:23:49.052	{}
6EWsfe9/o4HhEvk4Y2I1	rc+ccdAK8F4ROpIC299B	9h1y3jT8QdTsJyWDBN9/	575	\N	2017-04-26 15:27:25.088	{}
2vYpG4JSNjTLlxBcgf0C	XklfmXtmNz7WRzaFwJPY	h/3xVKiMhgdDiOgrhXOr	462	\N	2017-04-24 22:07:48.723	{}
XeU+FI9WOX5mj8rPAZLF	+2fxb2EecC80U2DcxPMF	seC63h8LBMblqrbw6Frf	826	\N	2017-04-26 04:46:23.028	{}
XNJqXHTFjxfB/5HKaa4Y	sAxdggjzUR7+K6sSxnyU	T4u53Q0zqk+jtd2EN0L+	356	\N	2017-04-26 06:12:17.785	{}
hr5g2ViF6SXuP+9MRIZM	VErp5+HZdn3Yz2G88TZh	XIqI+cAG/wJEMy7sEZsi	792	\N	2017-04-25 05:52:53.92	{}
ykPfasOIdNzXpnrIbI4i	/cFEfNMpFxRDc1+1PpSb	UKgeGGKcEPfMJbWrl/ea	901	\N	2017-04-26 12:30:34.63	{}
UZSLyr2BaTkBi1DxT0b7	nbFMJA7w8Ms8VOsgI8Uj	cannWQTiwmtyzGFwlDTO	196	\N	2017-04-24 21:46:30.574	{}
7YEtWg66n+SmrV36jNy7	SBdioRVUMTzSJjoTQ8iG	TpswmmeORDk7x6YfjmgG	500	\N	2017-04-25 17:25:14.537	{}
cfVvue731ABWhfwwgvl0	TMTdMrgBYgxYoTLKWv35	fNii742XpZLFUrFrMjra	221	\N	2017-04-24 03:35:42.062	{}
SCGDGS79CO301PIGsHzn	sAxdggjzUR7+K6sSxnyU	D028RZHGbY/vg6GxTF8g	911	\N	2017-04-24 16:07:25.691	{}
2d/RkRUsh0LMqscwgzT3	rc+ccdAK8F4ROpIC299B	sVQv8JoUv7CWOtK9fJTX	511	\N	2017-04-25 04:18:13.225	{}
kLZZcaSLdnKLHCwMNG0s	3KOaA2+6IjmFPfm4ChIJ	x8k7gwa028UtrRnWF8Ww	863	\N	2017-04-26 12:42:04.872	{}
wonsMyS0Pu8YYag69NkT	ljr+mdhFYpVziaRs0plq	PUepN4xl3NZ9DLebk1IB	242	\N	2017-04-24 13:27:57.504	{}
77Md7NZt9FRF0Sh7TSOd	3KOaA2+6IjmFPfm4ChIJ	1yVUMqjG23kktwrYcfvZ	92	\N	2017-04-26 23:43:20.425	{}
eJkXwX+NG3gzPI4JIuIP	CBp22Vfd78M4NgkRafEo	6bsl/HFLkGmxu/QwO6rL	515	\N	2017-04-24 04:47:14.474	{}
c4K7apCSDVDzsZFxAS2Y	nbFMJA7w8Ms8VOsgI8Uj	suaClrRcqF0t/3y6MPkz	44	\N	2017-04-25 11:08:04.046	{}
mDBhOi7LuCysduR7ZOYi	SBdioRVUMTzSJjoTQ8iG	epoKi5MTnaZX4epgkw10	365	\N	2017-04-26 08:38:56.75	{}
rFVPUYlOIvQXQAMFnPXF	y90eN2IFt6lwJmUaK9TF	t/Qp+NsPlhH4+Tl9/+zo	154	\N	2017-04-25 03:07:14.515	{}
lBhWlK6pYMfzc0qOSlp0	XklfmXtmNz7WRzaFwJPY	Hd8N9/oMVmZQvOdq/fZz	883	\N	2017-04-24 04:52:21.734	{}
17obbz68293J6Fs4y9Zq	Mooca+XNOJQaJb6IILB6	GOBkT6nZ4L8OZmgEnq79	308	\N	2017-04-25 10:26:20.149	{}
VmmKOvHwoIZFDes/F+aO	Hjjd3Ns0lvG3cs9jj4N7	Rtk4hpi1RqA2quKlPW2G	162	\N	2017-04-24 07:27:23.607	{}
pX3bNHHd+xbzuWS/p3JZ	CBp22Vfd78M4NgkRafEo	CfZ0iG+3WcPdUdTLy9xS	323	\N	2017-04-26 21:20:45.401	{}
j/umdhMUM8rmGDbBo2ru	nbFMJA7w8Ms8VOsgI8Uj	4FmnQ8vDltvpfQAUAkPJ	758	\N	2017-04-26 23:09:26.65	{}
HT3ZvfziZDLxH76qE49L	CBp22Vfd78M4NgkRafEo	AmAEjgwBQXRIiSZgh5zl	548	\N	2017-04-24 23:07:39.946	{}
+3Lor3ceoicDnKWBJHks	3KOaA2+6IjmFPfm4ChIJ	qNdc5CCjXwI+TaxPpsB3	245	\N	2017-04-24 10:31:20.002	{}
279WgqCMsv6+cBHMeQJX	VErp5+HZdn3Yz2G88TZh	uAilmTb74J1YAhGlKvos	127	\N	2017-04-24 18:45:01.235	{}
lRv1xDG2HyaXYGEbD/2t	Hjjd3Ns0lvG3cs9jj4N7	RrSDtsqnl4Yx6+HuhZyH	89	\N	2017-04-25 20:42:37.761	{}
b7SEH/8qti859Aihc2GK	TMTdMrgBYgxYoTLKWv35	GxXvg2onZYVHoHekIfvb	870	\N	2017-04-24 16:26:51.287	{}
W3afwZu376Sp0o/+D2VG	XklfmXtmNz7WRzaFwJPY	iwKfni67D2UnHsByOeqk	493	\N	2017-04-24 17:53:35.237	{}
1Qa8CWhmeuNVYRp5irOQ	3KOaA2+6IjmFPfm4ChIJ	MELlCoAwXQXItCWmU0lE	497	\N	2017-04-26 06:38:11.594	{}
C/aIK4+j5A7aY0k1wWD/	0/Dg4ohpw1BIoLvDgRkh	n6/fSHNaG282XxezuPlt	747	\N	2017-04-26 01:50:37.205	{}
vdyOXkydoJi0/y+pp7yT	3KOaA2+6IjmFPfm4ChIJ	DzUOlUNYsszexYbX9Tlm	895	\N	2017-04-26 13:40:57.173	{}
IZZnsKXIJW6zMVEjc5NZ	+2fxb2EecC80U2DcxPMF	DpgdwnfeSqk6jVDEr46c	985	\N	2017-04-26 08:35:34.039	{}
M53XBHQqLRd+HB/CKV+w	0/Dg4ohpw1BIoLvDgRkh	37Q7vBju5j4p/Qiby/3g	797	\N	2017-04-25 02:43:38.712	{}
gLShda+o+pHSzK6WyGTL	CBp22Vfd78M4NgkRafEo	SBsVotrtu66V9CMdy4dd	897	\N	2017-04-26 14:36:20.35	{}
iT2gB+p3ukJFjLrXtj5g	TMTdMrgBYgxYoTLKWv35	laOPrsD3+7NQZY5NzCoP	729	\N	2017-04-26 22:34:11.175	{}
i5u1Yei68/sYmiRZ+68V	kMjFmLjttJpQS3rzutBf	30BwIBEo+MscPUXx1bId	307	\N	2017-04-24 14:29:38.985	{}
9CxzIewZNyF+5IWct7yX	Hjjd3Ns0lvG3cs9jj4N7	I8wW9sHyEaBDZyRsns0R	730	\N	2017-04-25 06:35:32.949	{}
OX3D+KfDO6DSKEeiJNsI	y90eN2IFt6lwJmUaK9TF	MNKD+ha4kRIlVB4KZg3e	83	\N	2017-04-26 14:51:01.085	{}
5qovD6oaxcFdrrCUa1iz	ZNerBKfcGYvzcUKaYlqg	7IyTJXQtQlihf6rCSsrA	346	\N	2017-04-26 00:26:03.044	{}
0qvg5nHjv+SVhd/hQ9hp	+2fxb2EecC80U2DcxPMF	pSI0Aq8pGfn+3ovvusbW	168	\N	2017-04-24 09:59:24.03	{}
VbPY64XP98RkhjY7G0lM	0/Dg4ohpw1BIoLvDgRkh	F2WTu+/aHLxxFKLjqkGx	262	\N	2017-04-24 03:57:49.34	{}
aCJe2Ri2pr3pdSR/uydf	XklfmXtmNz7WRzaFwJPY	G/02ZcW33qaWaxiM5+Fm	238	\N	2017-04-24 09:25:22.525	{}
ZoE8WgmmG6FY7epdsVMG	VErp5+HZdn3Yz2G88TZh	iiSfUTrIANPu+59NPq25	171	\N	2017-04-25 02:06:23.873	{}
mh5HHQuR+umlyBWTQeNW	VErp5+HZdn3Yz2G88TZh	8Qv/+tJ0qfJMUx3ZxvpC	191	\N	2017-04-25 18:21:10.997	{}
Xf2agETEswlbgvToI/ID	Mooca+XNOJQaJb6IILB6	ke61s5CpqYjIIWAOeW5i	498	\N	2017-04-26 11:19:51.105	{}
5jXxDPihIp2KgDUiA5xh	nbFMJA7w8Ms8VOsgI8Uj	eXk1zNQOV2RTSC3v6qAR	438	\N	2017-04-25 09:28:46.602	{}
+i66BNYYWmzf1Z07DNE0	VErp5+HZdn3Yz2G88TZh	DcOnrIMRsbI5JV52lTdD	946	\N	2017-04-26 13:07:15.849	{}
/hY+d5gRu6uEm9RZs0NI	TMTdMrgBYgxYoTLKWv35	S4qRZAyWmkJNWw5nd/qA	616	\N	2017-04-24 11:59:32.919	{}
lAeruyr9NJU1SJkrWlZ4	y90eN2IFt6lwJmUaK9TF	h+PmeJ3UBluI5W2JWafo	146	\N	2017-04-25 03:24:59.196	{}
IIykoRvNZMzH+hSLY+5p	3KOaA2+6IjmFPfm4ChIJ	bcIP9xWQa69qDOkrnVpc	215	\N	2017-04-25 18:02:33.339	{}
S5wtUCBrYCjJnayXFf7h	/cFEfNMpFxRDc1+1PpSb	QRnSsDMEyA7nB5JlYqkI	664	\N	2017-04-25 14:39:31.076	{}
rW7XbI5Mr77lM/SirU1i	Hjjd3Ns0lvG3cs9jj4N7	PEhsx6FsCBsbL9K900vy	396	\N	2017-04-25 05:11:24.202	{}
DIP2moW02JP6UZtJRuEx	VErp5+HZdn3Yz2G88TZh	7WZeuD36gEL27pCNE/CK	969	\N	2017-04-26 15:34:59.763	{}
xYhzsxreiBnhRxOvV7Gc	rc+ccdAK8F4ROpIC299B	g4s6X1h2ULwJiaetj7E2	579	\N	2017-04-26 02:27:40.536	{}
JFGjR+Vw2xJfbweU2tmX	3KOaA2+6IjmFPfm4ChIJ	G/YgcyfRCYJvINjaZbG8	820	\N	2017-04-25 12:49:03.176	{}
jF4pKbh4uItDsGWk+zIb	SBdioRVUMTzSJjoTQ8iG	6nZX4L8s1IhtMhuhuR5N	360	\N	2017-04-26 01:00:44.404	{}
GyY9+bJECEv5cz3bB9Q9	nbFMJA7w8Ms8VOsgI8Uj	5UymsDKtiT8nojcNMHiE	784	\N	2017-04-26 16:06:31.856	{}
zK9CnDHoekpT0laF+Wah	budgvhf/oqc9FWtiR59c	oOi90UWp1RUxmEV27qcb	740	\N	2017-04-25 20:25:47.879	{}
bB9B0j0Xr7lb6OJztend	TMTdMrgBYgxYoTLKWv35	OTS756rcFuq0vI0/iK2F	127	\N	2017-04-25 19:12:20.598	{}
C59rso2+cIdGaDohkkzO	SBdioRVUMTzSJjoTQ8iG	KlDHviOp+M9hNwpHzIHr	565	\N	2017-04-24 00:52:01.062	{}
nwnAzuc1A8lCtUNSZcxy	YPGpbTqv9aeZHXxBNgIC	7oKb3eotaOIq/6fH21SB	162	\N	2017-04-26 10:24:29.871	{}
ZrHI0TYkQ/qJFmufkbUa	ZNerBKfcGYvzcUKaYlqg	tUaeThVJdUmUI65k4V5a	565	\N	2017-04-25 02:11:26.317	{}
njYEBuqPlmaTvOFEqRca	CBp22Vfd78M4NgkRafEo	AZuCEH8NKwFkKPAY5zu0	77	\N	2017-04-24 05:11:36.916	{}
qHqev84zbvJF+4XDFfBz	VErp5+HZdn3Yz2G88TZh	xwE31xNhq7y8ZpE8xp74	563	\N	2017-04-24 19:56:46.677	{}
G64LGfncjb+IKTtOMGH8	budgvhf/oqc9FWtiR59c	9h1y3jT8QdTsJyWDBN9/	911	\N	2017-04-26 05:20:30.295	{}
E/s+Bjdrk3GF6EHasSFv	VErp5+HZdn3Yz2G88TZh	h/3xVKiMhgdDiOgrhXOr	998	\N	2017-04-24 09:36:01.295	{}
/xjBobGuXqaYoUtlsVOd	ZNerBKfcGYvzcUKaYlqg	seC63h8LBMblqrbw6Frf	114	\N	2017-04-26 17:49:23.551	{}
OUQyemEpIRIuy4KC/g4N	sAxdggjzUR7+K6sSxnyU	ipYmBwlB92y3YqJdgWNe	436	\N	2017-04-24 15:17:54.128	{}
jNEh/Y9KOdti4AtwmVi8	nbFMJA7w8Ms8VOsgI8Uj	v1rRQbhc0QjrTM9qLAhF	245	\N	2017-04-24 19:59:01.278	{}
qoLPda1pJA9xrGLdfaVH	SBdioRVUMTzSJjoTQ8iG	3WNHhJ3+oJHtmxcgQUt4	752	\N	2017-04-24 20:33:02.933	{}
XRYZNzoMRPyAULjomykQ	kMjFmLjttJpQS3rzutBf	3X9dONX0LY0emmuX0eUz	991	\N	2017-04-25 08:47:15.307	{}
FoZhZoGMS+B3zCK4jdOm	Mooca+XNOJQaJb6IILB6	TpswmmeORDk7x6YfjmgG	867	\N	2017-04-25 16:59:57.644	{}
fEa+e2pIqkh8eGslDK5p	kMjFmLjttJpQS3rzutBf	fNii742XpZLFUrFrMjra	570	\N	2017-04-26 13:15:52.685	{}
icbxCxwjaS6WY3dYw1u/	y90eN2IFt6lwJmUaK9TF	D028RZHGbY/vg6GxTF8g	503	\N	2017-04-24 09:00:58.424	{}
uGgbNCa18MXYT3423jys	3KOaA2+6IjmFPfm4ChIJ	r5hYJ4ncw8RlduUdaNQV	217	\N	2017-04-26 04:37:36.015	{}
gw/+cjZc2bAummVo7Ns2	nbFMJA7w8Ms8VOsgI8Uj	x8k7gwa028UtrRnWF8Ww	152	\N	2017-04-25 22:18:59.499	{}
a8PflIWtV3n7PO6mgmQ5	0/Dg4ohpw1BIoLvDgRkh	r/D+I2PRPOq/BdZsJPpv	933	\N	2017-04-26 19:13:20.568	{}
pnwpXFmhviqQWiarnV7V	ljr+mdhFYpVziaRs0plq	hQRuq8f/hgPLqc8AhKwS	221	\N	2017-04-24 23:20:00.137	{}
L2y7uSre3q2tCockggkI	budgvhf/oqc9FWtiR59c	4hD7zTOsl4VKDE38IGtu	548	\N	2017-04-25 01:44:36.394	{}
MK/1T/RT5wsoLRdRlxzr	3KOaA2+6IjmFPfm4ChIJ	suaClrRcqF0t/3y6MPkz	404	\N	2017-04-26 02:00:10.619	{}
9rnLLuPNpqXqE10v3Fxg	+2fxb2EecC80U2DcxPMF	90rzm8CmU5i6sQc09s7w	650	\N	2017-04-26 16:50:07.537	{}
quX+7G28sIYb96O+vdwr	XklfmXtmNz7WRzaFwJPY	t/Qp+NsPlhH4+Tl9/+zo	144	\N	2017-04-24 12:09:02.299	{}
Usvqw82pW+0dL3V38Tva	rc+ccdAK8F4ROpIC299B	Hd8N9/oMVmZQvOdq/fZz	389	\N	2017-04-26 20:49:19.483	{}
u+cbb7AZdCqYEmn28has	Mooca+XNOJQaJb6IILB6	FXBqK5/VD72osVdn9gTI	220	\N	2017-04-26 20:43:47.298	{}
k+YrbMoeLkUsVhOqO/qw	XklfmXtmNz7WRzaFwJPY	lbPRQGwEGVVX0tMaFqjK	552	\N	2017-04-26 19:57:51.028	{}
EN3Dqatollaxz1UVxdf7	CBp22Vfd78M4NgkRafEo	6AYJ9KIBgzssNJKnehTE	77	\N	2017-04-25 21:59:13.331	{}
qtNhYr2LuCTV5z572iW7	3KOaA2+6IjmFPfm4ChIJ	39cDe41sSsEr/lK5S1Vo	404	\N	2017-04-26 00:19:14.437	{}
e5ncY2in0xuaufewOwiY	/cFEfNMpFxRDc1+1PpSb	IwmjgVG3LWbN7xiCvQMz	945	\N	2017-04-25 00:27:57.077	{}
jPPbCGLKJrcTu2oZerx9	YPGpbTqv9aeZHXxBNgIC	AmAEjgwBQXRIiSZgh5zl	153	\N	2017-04-24 22:29:50.175	{}
yUCpI5O40AIkk+mGp6JI	sAxdggjzUR7+K6sSxnyU	qNdc5CCjXwI+TaxPpsB3	398	\N	2017-04-26 14:03:18.678	{}
cNJ7RVNIrwbt8ebpSufj	XklfmXtmNz7WRzaFwJPY	uAilmTb74J1YAhGlKvos	769	\N	2017-04-26 17:57:47.553	{}
xUOvEfnv27VHOu1YhWL2	/cFEfNMpFxRDc1+1PpSb	RrSDtsqnl4Yx6+HuhZyH	889	\N	2017-04-25 08:39:02.922	{}
1ci8w4Tcer+nPvMetu3n	YPGpbTqv9aeZHXxBNgIC	GxXvg2onZYVHoHekIfvb	229	\N	2017-04-26 02:00:11.551	{}
I15W8CVit2ItxfoZeGHA	ZNerBKfcGYvzcUKaYlqg	iwKfni67D2UnHsByOeqk	583	\N	2017-04-26 02:26:12.971	{}
bsqnjlXUIu9/IcSV/QxF	Mooca+XNOJQaJb6IILB6	MELlCoAwXQXItCWmU0lE	388	\N	2017-04-25 14:32:48.406	{}
k76PRSVXR81glTCTOf4N	Hjjd3Ns0lvG3cs9jj4N7	n6/fSHNaG282XxezuPlt	242	\N	2017-04-24 06:20:32.379	{}
B3ucaGd/7/peTnMjriF4	ZNerBKfcGYvzcUKaYlqg	lVg1zcAhUcbs0gLpcXpt	72	\N	2017-04-26 07:14:54.332	{}
Ca5sC0s6brgrZw5+af81	rc+ccdAK8F4ROpIC299B	e4Zd4xL9xwgJasjMUO/8	823	\N	2017-04-24 12:46:31.97	{}
xgd3TcOfcytnmZesLssg	XklfmXtmNz7WRzaFwJPY	+YM7zAEystclHZhUHI+W	729	\N	2017-04-25 21:57:20.888	{}
R0W0RZijUt7exNzwkP1n	ZNerBKfcGYvzcUKaYlqg	BSlm/K3brY9BOBRVln7A	754	\N	2017-04-26 03:46:06.11	{}
aNO+eHKJ3SZ8TLpw6227	+2fxb2EecC80U2DcxPMF	FK8oH09U2URGASVqs1RX	53	\N	2017-04-26 17:03:36.38	{}
H7t1CJu6S+Rfe2Z4ccw9	ZNerBKfcGYvzcUKaYlqg	30BwIBEo+MscPUXx1bId	829	\N	2017-04-24 10:17:02.961	{}
KSue/RLhmxSXKkTREl04	3KOaA2+6IjmFPfm4ChIJ	I8wW9sHyEaBDZyRsns0R	711	\N	2017-04-25 17:35:31.158	{}
GSC2bTOiURjDG6QRIf/C	sAxdggjzUR7+K6sSxnyU	F5R6Nlcc8dIbuOtHLmAl	808	\N	2017-04-26 01:49:09.094	{}
xUYkJKD6nCtOFKP+MJB2	budgvhf/oqc9FWtiR59c	7IyTJXQtQlihf6rCSsrA	964	\N	2017-04-25 04:00:18.998	{}
re+edqJ/MRhQj2hZWnED	/cFEfNMpFxRDc1+1PpSb	XZbEc4KRdVRBOFXFk6bd	780	\N	2017-04-26 14:17:33.293	{}
u3saLpvfE6mS7xNhQrGb	rc+ccdAK8F4ROpIC299B	pSI0Aq8pGfn+3ovvusbW	694	\N	2017-04-25 03:13:40.884	{}
OdOe2DgNQPLUYvQ4vSjW	3KOaA2+6IjmFPfm4ChIJ	F2WTu+/aHLxxFKLjqkGx	150	\N	2017-04-26 16:18:02.827	{}
/7+Hdtdx138U72PWNt6x	Mooca+XNOJQaJb6IILB6	G/02ZcW33qaWaxiM5+Fm	788	\N	2017-04-24 12:48:54.357	{}
RRk+YdEjTrMCgNYswT/I	VErp5+HZdn3Yz2G88TZh	hDjW2XmrE03O/PhzQpPM	80	\N	2017-04-26 09:22:52.683	{}
AaBlc3dX4RAbRBgUyB7m	rc+ccdAK8F4ROpIC299B	eXk1zNQOV2RTSC3v6qAR	522	\N	2017-04-25 04:42:05.935	{}
Lkf1UrbxpXTNzi9bnnah	sAxdggjzUR7+K6sSxnyU	NiRtPkH7fyIw3cVBi1sk	753	\N	2017-04-24 12:02:30.117	{}
C2ONnNtqHTOWnTaFDPBM	budgvhf/oqc9FWtiR59c	S4qRZAyWmkJNWw5nd/qA	315	\N	2017-04-24 09:48:09.433	{}
AgLlv/VGsgMiyLTFM1j6	/cFEfNMpFxRDc1+1PpSb	h+PmeJ3UBluI5W2JWafo	249	\N	2017-04-26 13:02:25.467	{}
D0iddSDHUZo3MTqdsYQ4	Hjjd3Ns0lvG3cs9jj4N7	bcIP9xWQa69qDOkrnVpc	733	\N	2017-04-26 09:21:06.368	{}
NwiIO8rbnHchDtB9lMkL	3KOaA2+6IjmFPfm4ChIJ	9NAJAUdB/fRIvdS1Bekq	564	\N	2017-04-25 22:30:02.351	{}
cv31mFpgjUi4CrwDtkWn	TMTdMrgBYgxYoTLKWv35	PEhsx6FsCBsbL9K900vy	470	\N	2017-04-26 10:22:46.811	{}
pj9Gd6O6LGl6kXF52CeF	SBdioRVUMTzSJjoTQ8iG	ps9KFHZQWJhlTPKjoREV	129	\N	2017-04-24 19:46:06.891	{}
DhSBLdV9oqSPaD4mAZR5	0/Dg4ohpw1BIoLvDgRkh	rHloRQdFWHyF04VfHGlq	802	\N	2017-04-24 11:50:38.782	{}
w/jNy0SoOSccJgIdXbJE	y90eN2IFt6lwJmUaK9TF	G/YgcyfRCYJvINjaZbG8	246	\N	2017-04-25 02:08:34.323	{}
d0VkB8KHFwqndWL18/cP	TMTdMrgBYgxYoTLKWv35	81J07pnV9BrsCx21/oX4	46	\N	2017-04-25 09:03:41.714	{}
1ljZniOqsLSYnSKmiZBP	kMjFmLjttJpQS3rzutBf	3CTVMkbsITB79i6OEmUe	395	\N	2017-04-26 03:51:43.37	{}
ELQLYfTX6bY1dMRRkAYD	VErp5+HZdn3Yz2G88TZh	CsSDxrvAtWNb5NrBj5Bc	195	\N	2017-04-24 16:38:07.81	{}
z/kuTIx/QSfqNAPOgAgO	YPGpbTqv9aeZHXxBNgIC	DmsPTclCfjOyoh2xW5WR	144	\N	2017-04-26 11:34:13.859	{}
0hYyKbys8hjRmbYiLRBz	Hjjd3Ns0lvG3cs9jj4N7	hN3Y/AhQqtDWM/dUsNGe	969	\N	2017-04-24 02:18:32.66	{}
5tOAjPvR0sWQJ6iT11AA	Hjjd3Ns0lvG3cs9jj4N7	CHv+0CYlbIplUtmCCU7K	276	\N	2017-04-26 03:36:35.937	{}
XWYotYa9W1/Jzzq3h0MJ	kMjFmLjttJpQS3rzutBf	2qz1cQ23UnhdcEBw5KiS	463	\N	2017-04-24 09:54:33.613	{}
1QA5tmem4iHmDxraIHe7	ZNerBKfcGYvzcUKaYlqg	AZuCEH8NKwFkKPAY5zu0	766	\N	2017-04-25 17:00:41.108	{}
H40SE+3LdR7EBdOBY1hZ	Hjjd3Ns0lvG3cs9jj4N7	rUnSDBKcEohBm52vsdAD	973	\N	2017-04-24 15:14:24.139	{}
mYrssQBhzVAyIOkrv7IZ	ZNerBKfcGYvzcUKaYlqg	qzYWi0Fbdg6J4kFUUiTh	919	\N	2017-04-26 05:55:23.932	{}
atdKNRYRv13L/Jv8V16R	Hjjd3Ns0lvG3cs9jj4N7	VSW1UK99KY7AA/zDbtmz	404	\N	2017-04-24 01:34:32.144	{}
LwKQkVXIP+2otgaclerD	ZNerBKfcGYvzcUKaYlqg	rEzlHP0CCqU32go9uLwG	148	\N	2017-04-25 09:27:18.883	{}
p/9g2oq9NDnkViKuOlcS	CBp22Vfd78M4NgkRafEo	24c2duv4VpBnQRfTUZu7	783	\N	2017-04-25 07:12:28.497	{}
pgb7WGytEL1t1uq1OVtA	0/Dg4ohpw1BIoLvDgRkh	T4u53Q0zqk+jtd2EN0L+	139	\N	2017-04-24 14:18:20.599	{}
mYnZlng2ByJSw7PtMRgA	kMjFmLjttJpQS3rzutBf	phlzm1ueK3NjTse+7HWB	213	\N	2017-04-24 01:08:31.167	{}
6zjYaEnV7AxCCShIEV44	ZNerBKfcGYvzcUKaYlqg	3WNHhJ3+oJHtmxcgQUt4	724	\N	2017-04-25 09:54:35.398	{}
PJKFZznkqaC/Ubj5nZos	3KOaA2+6IjmFPfm4ChIJ	PahC0hXDjwj48Ja7J7K3	429	\N	2017-04-26 19:33:14.707	{}
Me8nVRzTKOC0khHIIdGt	0/Dg4ohpw1BIoLvDgRkh	TpswmmeORDk7x6YfjmgG	181	\N	2017-04-25 05:24:40.108	{}
95xJJqqnEzNt0vXen2ab	XklfmXtmNz7WRzaFwJPY	OAj872OQpjpTQwsbaJUt	732	\N	2017-04-26 06:56:56.932	{}
W934Y9RzaPipKGHMu4Yv	0/Dg4ohpw1BIoLvDgRkh	9Yh7/h20AH5gQBC5qt0t	658	\N	2017-04-25 10:31:00.676	{}
EO/mmVFesomDRWsM6B8j	SBdioRVUMTzSJjoTQ8iG	yMhaF3jPG+xcBc6AWT1z	848	\N	2017-04-24 19:02:03.129	{}
CCzAg5BvvImLorrqEBAa	CBp22Vfd78M4NgkRafEo	PUepN4xl3NZ9DLebk1IB	909	\N	2017-04-24 19:58:59.344	{}
rcK1w3qi/CSEOidBMRLn	0/Dg4ohpw1BIoLvDgRkh	1yVUMqjG23kktwrYcfvZ	121	\N	2017-04-24 12:31:23.217	{}
QiHLTiquMTYBT1DcPFEi	rc+ccdAK8F4ROpIC299B	6bsl/HFLkGmxu/QwO6rL	543	\N	2017-04-24 01:28:57.42	{}
M3IxykSXKomFjgeGJBJP	/cFEfNMpFxRDc1+1PpSb	1ctb8YKUVQi5Zenj9Dk4	590	\N	2017-04-26 11:34:57.323	{}
7i2e4TUmv+9IxGcROWrl	ZNerBKfcGYvzcUKaYlqg	wDRLWNMtGzfCRao1kUni	744	\N	2017-04-24 00:07:06.805	{}
PyO4c3HPMPGZQLL8THWV	YPGpbTqv9aeZHXxBNgIC	epoKi5MTnaZX4epgkw10	693	\N	2017-04-25 02:21:39.431	{}
FmVJpZgfKgyXAQC+pOLp	VErp5+HZdn3Yz2G88TZh	pHz0wDcklqaLHl1dG38J	48	\N	2017-04-26 11:17:20.171	{}
Ew2h3I5JsuC+OINUiaL0	rc+ccdAK8F4ROpIC299B	FXBqK5/VD72osVdn9gTI	184	\N	2017-04-26 08:06:17.349	{}
nw6Qs2znM1lqAmY4VUcL	rc+ccdAK8F4ROpIC299B	Rtk4hpi1RqA2quKlPW2G	695	\N	2017-04-25 05:05:26.62	{}
NLn4Q6ygW0JXdPNanhW5	CBp22Vfd78M4NgkRafEo	6AYJ9KIBgzssNJKnehTE	872	\N	2017-04-24 16:22:53.604	{}
249fUSyIu9oxY+tbgaGN	VErp5+HZdn3Yz2G88TZh	4FmnQ8vDltvpfQAUAkPJ	44	\N	2017-04-26 20:11:32.563	{}
gZPPaC1PVUBccVdXOCtw	budgvhf/oqc9FWtiR59c	AmAEjgwBQXRIiSZgh5zl	384	\N	2017-04-25 01:56:36.896	{}
QwMDhV6D7ymbd/oF43Xc	VErp5+HZdn3Yz2G88TZh	qNdc5CCjXwI+TaxPpsB3	186	\N	2017-04-24 07:31:34.087	{}
ipL1PS8c6FkHjdo0ck8+	ZNerBKfcGYvzcUKaYlqg	uAilmTb74J1YAhGlKvos	417	\N	2017-04-25 08:01:49.479	{}
qlJ/KTfSVF0EG4sJmDUb	CBp22Vfd78M4NgkRafEo	zuIbn+M1EbpSql8XiiC8	705	\N	2017-04-24 08:32:19.661	{}
UBKZNCzRAJl/I8tcNr71	y90eN2IFt6lwJmUaK9TF	Pp5r6s9stYSZgMkZ/5oe	12	\N	2017-04-26 08:42:05.113	{}
amdVb/GqbElptq2fd6Jr	YPGpbTqv9aeZHXxBNgIC	iwKfni67D2UnHsByOeqk	689	\N	2017-04-26 13:41:55.593	{}
EG9C8CwpyZU9VP5sMOns	nbFMJA7w8Ms8VOsgI8Uj	T/2Z1wdnNt21ziRUs22X	801	\N	2017-04-24 12:31:33.946	{}
m3bd7sQW7+L4kvnenwW/	sAxdggjzUR7+K6sSxnyU	g6/GNKiVzKsdale/1x5t	839	\N	2017-04-24 08:48:38.665	{}
DjC6oXH8UiidBIZhtIFO	kMjFmLjttJpQS3rzutBf	lVg1zcAhUcbs0gLpcXpt	827	\N	2017-04-24 05:52:45.473	{}
bj5+YQgIr+CiybXKR4mv	Hjjd3Ns0lvG3cs9jj4N7	e4Zd4xL9xwgJasjMUO/8	526	\N	2017-04-24 00:52:05.1	{}
tFlAQxOwubnt5UrQTvOK	kMjFmLjttJpQS3rzutBf	+YM7zAEystclHZhUHI+W	281	\N	2017-04-24 11:46:49.418	{}
pKKqBFjaZiTvuEd1pkvn	VErp5+HZdn3Yz2G88TZh	BSlm/K3brY9BOBRVln7A	205	\N	2017-04-25 13:34:32.078	{}
Nh/U0yzJmRaBYo75qAxc	Hjjd3Ns0lvG3cs9jj4N7	HYgifAP03ClpWYHs1khi	132	\N	2017-04-26 13:23:51.222	{}
RWMSEKGeUuXTJefsyWWj	kMjFmLjttJpQS3rzutBf	30BwIBEo+MscPUXx1bId	473	\N	2017-04-24 14:01:00.873	{}
YpEKyGnqFQYPuZy1QXC5	+2fxb2EecC80U2DcxPMF	I8wW9sHyEaBDZyRsns0R	669	\N	2017-04-25 10:46:40.798	{}
FrowV8nRkYZ7zBA/n+jq	XklfmXtmNz7WRzaFwJPY	MNKD+ha4kRIlVB4KZg3e	163	\N	2017-04-26 16:36:25.394	{}
HDSyR/s3AlrwMRWHkw5i	CBp22Vfd78M4NgkRafEo	7IyTJXQtQlihf6rCSsrA	640	\N	2017-04-25 02:06:50.987	{}
+r/20GCkhl9qnDEvb7ci	nbFMJA7w8Ms8VOsgI8Uj	pSI0Aq8pGfn+3ovvusbW	375	\N	2017-04-24 20:57:41.968	{}
NKOUG5zLSZb8i+QZMng3	0/Dg4ohpw1BIoLvDgRkh	F2WTu+/aHLxxFKLjqkGx	942	\N	2017-04-24 01:56:50.173	{}
uBVWtQ+s/qIycn+Z6/lv	3KOaA2+6IjmFPfm4ChIJ	W25X3lW9EAIv9MtQh4me	879	\N	2017-04-24 02:48:59.784	{}
J3q1wcJ/fqeFwrlYtg0y	+2fxb2EecC80U2DcxPMF	hDjW2XmrE03O/PhzQpPM	583	\N	2017-04-24 04:44:56.313	{}
a5HoudDrpJiLCF+ge0iu	XklfmXtmNz7WRzaFwJPY	0y7YnwAXjiXk8HUdHw1E	911	\N	2017-04-24 18:29:32.237	{}
ok4ts1vE0bVPMsaDQcbw	sAxdggjzUR7+K6sSxnyU	ke61s5CpqYjIIWAOeW5i	477	\N	2017-04-24 01:12:22.488	{}
OWacP1mcp9OVfnKIygxs	CBp22Vfd78M4NgkRafEo	vAZkS8QPrcDtMw5o1MS9	759	\N	2017-04-24 14:12:59.255	{}
uvA7Yhs0fgcG9CeSYWRX	ZNerBKfcGYvzcUKaYlqg	8Qv/+tJ0qfJMUx3ZxvpC	651	\N	2017-04-24 02:37:09.675	{}
AENbpHdWlJdqZWzqo0uB	XklfmXtmNz7WRzaFwJPY	0y7YnwAXjiXk8HUdHw1E	28	\N	2017-04-25 16:24:35.917	{}
60Ufp4zRFMS586RCNDjd	Hjjd3Ns0lvG3cs9jj4N7	5hGREKNihF2KzXWq+HWi	289	\N	2017-04-26 21:03:21.774	{}
8TO/gP6ewNo6zhfoaZnz	0/Dg4ohpw1BIoLvDgRkh	5TfY0LRjZ2+LNXGrf0j4	282	\N	2017-04-26 13:31:15.601	{}
RpEge1TXuSfVLymPq8BR	sAxdggjzUR7+K6sSxnyU	rSuTrmYO7TdYcpi/YLmk	813	\N	2017-04-26 09:43:32.047	{}
kBReC1QU4mX4V63WHYaW	nbFMJA7w8Ms8VOsgI8Uj	xIohQGLCgvtS6erUIsjW	447	\N	2017-04-24 09:20:40.812	{}
7OtMcnjAQK2p8eWsREjv	XklfmXtmNz7WRzaFwJPY	TUwlpMuG00jsAIYle4VE	671	\N	2017-04-26 11:30:31.065	{}
qAUuU7NjGqU1+RHK17Rn	/cFEfNMpFxRDc1+1PpSb	It9+V9XyWP0DUQQAmDGz	102	\N	2017-04-26 21:40:09.402	{}
fjHYIy5I7WrwkDewm/5r	sAxdggjzUR7+K6sSxnyU	TSom2O175aH7i2gKvaqu	202	\N	2017-04-25 04:45:46.085	{}
AP92xxfVYtt3G5vpb2km	ljr+mdhFYpVziaRs0plq	r7re5G873EEj5mt21Uoe	594	\N	2017-04-25 22:58:04.227	{}
BAyuM5S3rYEfAouSoT2O	ZNerBKfcGYvzcUKaYlqg	GdsuYQmmf+KF1Qk2zFVM	696	\N	2017-04-26 12:15:24.254	{}
hRX9yrsR2rDaw0l7Y0DF	TMTdMrgBYgxYoTLKWv35	SOn/5UePJyI9tFyw0dY2	607	\N	2017-04-26 15:14:57.512	{}
+uZwk16H8/GSc674KCnx	Mooca+XNOJQaJb6IILB6	rA2rJlfJpLkm2bdVGxHv	852	\N	2017-04-25 06:47:35.399	{}
2TYt3qFT+srVtWSlseFa	Hjjd3Ns0lvG3cs9jj4N7	dS5zsb0zLP6rbksyOwp0	403	\N	2017-04-26 19:10:18.95	{}
xjuQ+e1FHtsLYSHA9SFM	XklfmXtmNz7WRzaFwJPY	J78Y5U2YyfU9Kgw+3m3+	669	\N	2017-04-24 13:38:33.049	{}
JAIMNzXMTfbhNlDTYCEv	0/Dg4ohpw1BIoLvDgRkh	zj9zjQd2YzyS/PIoQzK/	589	\N	2017-04-25 07:29:35.267	{}
HwVSYJBkAfZdVsmD/SQb	XklfmXtmNz7WRzaFwJPY	Nhjw4XwI181eyg+T6Y/h	348	\N	2017-04-24 16:07:22.812	{}
yyZV3q6+6NFwws2P0KXv	Mooca+XNOJQaJb6IILB6	4cepSjfZZjoPZ7XoBhHP	272	\N	2017-04-26 11:54:24.512	{}
5CMwKuQGlh6Y/TeTfy4D	Mooca+XNOJQaJb6IILB6	jDaJkPoABLYpc2XoZOSS	357	\N	2017-04-26 22:14:06.357	{}
68k9HXV8xZddYQwAI9LL	+2fxb2EecC80U2DcxPMF	kjiMj23AWZv3MZpaZ+GV	56	\N	2017-04-25 03:48:00.59	{}
UfOY4Em/+WN1JRsKQCB4	sAxdggjzUR7+K6sSxnyU	jp9fgwOlSHGmsJE0bYvl	716	\N	2017-04-24 18:53:49.475	{}
gY3S0p0SdJz5pB39RGc+	sAxdggjzUR7+K6sSxnyU	WpvXGk5wmK9jpS1xtxhy	945	\N	2017-04-24 14:35:49.806	{}
FjWnB6a4Jna/stRrNUVS	ljr+mdhFYpVziaRs0plq	PzUQaEXjTuyK6HhipV7O	126	\N	2017-04-25 22:17:57.929	{}
WkjJDPy7j/IjJoubY43s	SBdioRVUMTzSJjoTQ8iG	4PynPgsyCEAiE1BGjGmE	704	\N	2017-04-26 14:27:26.202	{}
bKz0rToxb32upWpnMT/F	3KOaA2+6IjmFPfm4ChIJ	27SKcp51d2jyQLc8ZWEQ	24	\N	2017-04-24 08:27:32.673	{}
hOh2lniKWzwe93VI5ZDo	y90eN2IFt6lwJmUaK9TF	1VjkjAiDllfTffQV5Htp	585	\N	2017-04-25 04:05:49.144	{}
OHNdWHWMvFIFSLqf2yAr	XklfmXtmNz7WRzaFwJPY	RCNHGWVzNUypSWbbMc4v	846	\N	2017-04-25 20:13:51.552	{}
6ge29s4ibHFeD3RtPG4K	SBdioRVUMTzSJjoTQ8iG	3cmZYcR+hE74XsfWiNjU	907	\N	2017-04-25 14:25:14.052	{}
hEhXN49n8Murw1GvFRrr	ljr+mdhFYpVziaRs0plq	kBmTBAtF04d018cSOd6V	329	\N	2017-04-26 22:08:15.227	{}
ygZHcPeys79WKAj8yAH8	sAxdggjzUR7+K6sSxnyU	V0OxKik9wty+9vcZIlj2	743	\N	2017-04-26 06:40:12.169	{}
MgPZCIlmfJbnDHl52DIt	SBdioRVUMTzSJjoTQ8iG	zh36n/IfyyGSoI9mzFpR	162	\N	2017-04-25 20:26:51.551	{}
ehUiOH7VeCohMgRxkEhU	kMjFmLjttJpQS3rzutBf	E7LTtGDjrbMV2na8Xf7r	148	\N	2017-04-24 04:12:21.026	{}
7NgM4BUNIqbrVEGbj2Sv	ljr+mdhFYpVziaRs0plq	Efn0ZXmQQHM2csE7lT2L	544	\N	2017-04-25 06:27:44.67	{}
Mr4AYiMYVVOjxZpq/IxL	nbFMJA7w8Ms8VOsgI8Uj	le4JGLRYApAsSmKs48ld	968	\N	2017-04-26 09:13:00.434	{}
5oaD7bFUulXkrG8g+ODn	ljr+mdhFYpVziaRs0plq	s9oTfzBw7BNJ6uG2SjjU	814	\N	2017-04-26 19:15:10.833	{}
rLcCBg1O/n385RB+9AAT	+2fxb2EecC80U2DcxPMF	nX9Dl0ZeyLiXiKO7EYdE	229	\N	2017-04-25 22:26:29.632	{}
eWtx4QYoaYWDzW8MD6sm	YPGpbTqv9aeZHXxBNgIC	M3/j26SVcwmdT8BK6oxI	155	\N	2017-04-24 03:27:58.415	{}
041kF0kwSdH8jH/M8Czr	Mooca+XNOJQaJb6IILB6	s9YxFFx66Y/JlQ6bdzym	747	\N	2017-04-25 22:57:19.184	{}
Bio6LQQ52IZWUxPjv9dP	ljr+mdhFYpVziaRs0plq	wA+nsnAmde7GMr9UqQN9	495	\N	2017-04-26 06:19:21.746	{}
1KWPKYDzASCRdcreLhHg	ljr+mdhFYpVziaRs0plq	wly1tmIwh3MnlmyBkVWn	672	\N	2017-04-24 01:20:03.251	{}
p16SCufiUkcaDpup+zoY	ZNerBKfcGYvzcUKaYlqg	SHGmDrxzSZN0bxGqjWrP	2	\N	2017-04-25 18:17:47.579	{}
UxY9WO6tn0Q9RgMAiTNX	rc+ccdAK8F4ROpIC299B	cdgMRFBTHjh2+YQA5K0C	131	\N	2017-04-25 17:57:35.628	{}
VoocU7K4IIGdjwHX1GBb	3KOaA2+6IjmFPfm4ChIJ	cP6076ZyJg3Aw87bdi/S	542	\N	2017-04-24 18:21:05.932	{}
6MlertoPApBryPOpAO10	sAxdggjzUR7+K6sSxnyU	pfGZBb7Quxu5lc2opSX1	356	\N	2017-04-25 22:30:17.54	{}
d4GS3e94yUBaHBUT0G5I	CBp22Vfd78M4NgkRafEo	mFbNmViDpjR/kFfiC0mL	207	\N	2017-04-25 06:31:37.978	{}
uuJ8qZsKq/V+ROUVtUJw	Mooca+XNOJQaJb6IILB6	rQjQbYVt6R9tq9q33Kh0	348	\N	2017-04-26 11:46:32.989	{}
Y6koAAYc2gsoRJIOElTL	SBdioRVUMTzSJjoTQ8iG	OKyyiU0t3npJlMr34VoG	954	\N	2017-04-24 17:13:43.499	{}
AQDxpjW0VzP3E/q2V9fX	kMjFmLjttJpQS3rzutBf	WoDRA+j+ATuPuDII3h0W	531	\N	2017-04-25 05:29:55.782	{}
q6z89dfrh2yHxuc7HZ0j	CBp22Vfd78M4NgkRafEo	NwKr3qJ2d0ay+aIttGZz	45	\N	2017-04-25 13:49:46.693	{}
E0w6M5ktSfh0I5F1/Ls3	ljr+mdhFYpVziaRs0plq	5P9K7aBmAS6CUeb0m2kb	2	\N	2017-04-26 08:48:22.612	{}
+OMe9eFauDYuSZMFaalH	TMTdMrgBYgxYoTLKWv35	zqw5IrJpj+TXw2e0kIrl	193	\N	2017-04-24 22:06:23.213	{}
0pKLcMQVT6iuR3dyo9Hm	XklfmXtmNz7WRzaFwJPY	ajaA6rWXZEk/UL7T/1FI	444	\N	2017-04-25 17:24:47.445	{}
JEgL2imSqX22d9C4XYZS	3KOaA2+6IjmFPfm4ChIJ	aGjYXwObyvnJVtLVGYCo	819	\N	2017-04-24 09:36:34.933	{}
ZL/yX1BsdYmInZ+cKQWo	nbFMJA7w8Ms8VOsgI8Uj	NHpdc/KZjW9u2yHp9hT+	303	\N	2017-04-24 03:07:05.732	{}
17ZLqKiwOnVCsshw8o6O	+2fxb2EecC80U2DcxPMF	CssMNy8lEi+icRqGdWTJ	853	\N	2017-04-24 09:51:51.682	{}
1ZSH/hVMjkjcBLdGnEfL	kMjFmLjttJpQS3rzutBf	KFw81jBVeKzOHvQyZ+jX	301	\N	2017-04-24 13:46:23.747	{}
WJyeV9AgiV0T2jpGGCbm	/cFEfNMpFxRDc1+1PpSb	oeCoF79mWiQflANJb9bS	316	\N	2017-04-25 20:19:17.117	{}
YNL4I3qUuoAqiP3iH7ks	budgvhf/oqc9FWtiR59c	6mBCso8hB9II4KLPgmi9	393	\N	2017-04-25 02:51:15.217	{}
mAHAvXmCfJXb0qFNFqPz	ljr+mdhFYpVziaRs0plq	NzSnKMGSe1qFW+fFfrMI	767	\N	2017-04-26 23:35:17.583	{}
6rqF2hw1FZCEGxYpVLRC	Hjjd3Ns0lvG3cs9jj4N7	VyiEGsnkNytK4YW7dF1c	310	\N	2017-04-24 09:36:03.515	{}
4j1Pjq7gmnotLbDd0GFa	Mooca+XNOJQaJb6IILB6	FCR9FppSwAMOV+DllY4Y	728	\N	2017-04-25 16:49:01.378	{}
9TS5+K9XxkL4oxsWgAqb	XklfmXtmNz7WRzaFwJPY	qc3VP65iUopl/UIGI42i	336	\N	2017-04-26 13:49:02.639	{}
VEXXttMHlw3nFNp3tVa3	Hjjd3Ns0lvG3cs9jj4N7	MiPOqDJMuj9iXXyCIYst	335	\N	2017-04-26 05:16:44.571	{}
z4WT4Uk/RgV258cxv3jT	rc+ccdAK8F4ROpIC299B	1K9NI6uOrHNs2V9QSz4K	328	\N	2017-04-24 07:24:44.946	{}
k2/6cEYhNHKDM7JDWsjb	+2fxb2EecC80U2DcxPMF	iiSfUTrIANPu+59NPq25	881	\N	2017-04-24 05:04:14.559	{}
c0gqM2J2B6w9WdHgmV6b	ZNerBKfcGYvzcUKaYlqg	0y7YnwAXjiXk8HUdHw1E	821	\N	2017-04-25 03:28:15.707	{}
jqscksc935GNAR+6yD27	CBp22Vfd78M4NgkRafEo	B7fAevV3J5shq9LZU80N	704	\N	2017-04-25 22:58:17.891	{}
jto/uyOK++1u1Bb/AOQh	ZNerBKfcGYvzcUKaYlqg	RNjg4BGiEg3yQri5yh54	655	\N	2017-04-25 08:29:42.167	{}
hxYgdWQPENXg6MxITfOR	Mooca+XNOJQaJb6IILB6	gARnv45PiZksvoIJaTf3	851	\N	2017-04-26 09:18:20.406	{}
nxEo+kYxDdt84G2U8H60	Hjjd3Ns0lvG3cs9jj4N7	noJgLUV1hnfx/0t3gvaP	711	\N	2017-04-26 02:21:50.962	{}
Rc4BHoat9+DM6GpVylwi	VErp5+HZdn3Yz2G88TZh	IY4k7bB5U+EkZ2Qn/2nU	701	\N	2017-04-25 11:16:04.554	{}
48Ixhzzx+xPpjHn2FanP	VErp5+HZdn3Yz2G88TZh	TUwlpMuG00jsAIYle4VE	190	\N	2017-04-26 23:02:24.687	{}
z2fsu85/xcpH8UwFhSoX	0/Dg4ohpw1BIoLvDgRkh	VN4QUl4eYsOz7k7xlq0d	889	\N	2017-04-24 15:26:09.232	{}
TWVFVaRilOoH04Go06/Q	ZNerBKfcGYvzcUKaYlqg	RJZlYd9NeGndiasoJ042	512	\N	2017-04-25 16:19:55.496	{}
Q99n7s69verREMB1FRjr	sAxdggjzUR7+K6sSxnyU	9Lm4ehC9uq+z4PHZoPGl	851	\N	2017-04-25 20:14:34.446	{}
tv8bGkBRxCj8kOaoBQvZ	kMjFmLjttJpQS3rzutBf	iYlqVN7/0PCnWNeaT/nL	668	\N	2017-04-24 05:14:33.923	{}
AxHuYzflGzeWV74MeZlq	y90eN2IFt6lwJmUaK9TF	aPDGLrRUB4meVjgwSXMV	187	\N	2017-04-25 02:23:21.339	{}
xjRDACsg8B01l9tYieyr	y90eN2IFt6lwJmUaK9TF	tcah/OliB/nPR/KU/FFk	239	\N	2017-04-26 05:47:29.61	{}
ENSSRxpMRBK8gYrM7+to	y90eN2IFt6lwJmUaK9TF	rOMcnQ6NHOL6jLI4ksP5	466	\N	2017-04-24 13:50:35.374	{}
MIkxjGMTNq77Ob+CisP8	y90eN2IFt6lwJmUaK9TF	nHh8alY9hEQ6/jWDV3Eu	31	\N	2017-04-26 11:54:58.487	{}
192vv44AG+VsMZayWhHF	Mooca+XNOJQaJb6IILB6	Nhjw4XwI181eyg+T6Y/h	92	\N	2017-04-26 04:54:58.353	{}
LyVDTDNzJugvR5NS6TOP	budgvhf/oqc9FWtiR59c	4cepSjfZZjoPZ7XoBhHP	451	\N	2017-04-25 13:39:37.262	{}
ezQs6Kid3mQzMTtxY4bP	Hjjd3Ns0lvG3cs9jj4N7	jDaJkPoABLYpc2XoZOSS	419	\N	2017-04-26 23:03:27.781	{}
j9DhrpJO74JAzZSivUQv	budgvhf/oqc9FWtiR59c	kjiMj23AWZv3MZpaZ+GV	311	\N	2017-04-25 00:59:15.985	{}
Yft+1nBpSySIc73d2p2C	XklfmXtmNz7WRzaFwJPY	jp9fgwOlSHGmsJE0bYvl	528	\N	2017-04-25 02:43:38.356	{}
KMUY+ewH8hrlztY7xvAA	3KOaA2+6IjmFPfm4ChIJ	qO2DCoUGcx4T46CYX3Hf	873	\N	2017-04-26 19:57:11.371	{}
4UYVOySufCw31Q03IY9l	ljr+mdhFYpVziaRs0plq	Rlbp92RoIO9r8b7bHfgQ	841	\N	2017-04-26 18:40:10.894	{}
tQYoPKQfP99NoAWsY2JG	SBdioRVUMTzSJjoTQ8iG	B8ymtG32dC230Zvp4RZf	369	\N	2017-04-26 16:17:08.057	{}
Oq3NL/YYWmiRrk+kysQA	+2fxb2EecC80U2DcxPMF	27SKcp51d2jyQLc8ZWEQ	596	\N	2017-04-26 10:21:32.167	{}
BMOjN2JIyU57+IgW/1Fz	Hjjd3Ns0lvG3cs9jj4N7	lz3lsqHd7FpE1XRkaFzx	567	\N	2017-04-25 08:23:43.502	{}
wWtC/eu5iJNWejzL/GBT	Mooca+XNOJQaJb6IILB6	Dl+3gibdyaFA9M5jcc3+	730	\N	2017-04-26 20:58:40.808	{}
/Mdavxj5tvY2KeD5UjDS	/cFEfNMpFxRDc1+1PpSb	MLqhPcFbAe8nEIC7jcTK	575	\N	2017-04-24 18:39:06.702	{}
pM6MgOAQuUglnj0MWm4v	CBp22Vfd78M4NgkRafEo	epToVAs65GfRK5IPM87T	475	\N	2017-04-25 23:53:41.678	{}
zU5nq1Rg+w8Eq6zmdYyU	y90eN2IFt6lwJmUaK9TF	Wf6qGvpBstEZ8AqzSJaL	605	\N	2017-04-24 17:37:53.406	{}
C+S/fVJ1Q98HVBm1XGTP	ZNerBKfcGYvzcUKaYlqg	zh36n/IfyyGSoI9mzFpR	95	\N	2017-04-25 18:19:55.771	{}
oXl/48dZHs7ba1BnfMmB	0/Dg4ohpw1BIoLvDgRkh	3hkeSfHvHoeuiXEbbppA	535	\N	2017-04-25 13:39:16.22	{}
UnW9Qsg9kICdC46En3sh	y90eN2IFt6lwJmUaK9TF	OUXekNWDkMDjn6VidOCj	242	\N	2017-04-24 20:11:58.197	{}
LpyHEdZ/rxfuHw2Hucmu	y90eN2IFt6lwJmUaK9TF	2z3DhxYYYpAcRZFMlLyY	817	\N	2017-04-26 19:22:54.322	{}
P9+xTKZD3O0CI3DIAqKE	Hjjd3Ns0lvG3cs9jj4N7	H31SnYmpYR/rlIAJoton	670	\N	2017-04-24 01:20:02.862	{}
qlRSTVJeAZKennOmnRIE	sAxdggjzUR7+K6sSxnyU	iw1PYpVdDWJhaYFiUfmJ	716	\N	2017-04-24 18:39:48.729	{}
egjvugGSd2FQ6G98KZRx	sAxdggjzUR7+K6sSxnyU	/yHf7kZgBtaeYkpRauVK	428	\N	2017-04-26 17:56:05.851	{}
uvAr4SO7niV0tNS1YhX1	YPGpbTqv9aeZHXxBNgIC	LT+/mL3LeaKodL6O2fEj	835	\N	2017-04-26 23:24:59.071	{}
38c+48co5p9WyckQ3HUc	y90eN2IFt6lwJmUaK9TF	jk/pYGojXuQ+7VqwkITi	729	\N	2017-04-25 20:31:22.992	{}
/A/T4/xtsfacQ5m0S+SY	YPGpbTqv9aeZHXxBNgIC	Il8B8/6HlXYzQkk7c4oi	79	\N	2017-04-25 17:38:27.451	{}
LJzpNxmFToD98u6Z6xU7	3KOaA2+6IjmFPfm4ChIJ	zir3Xihafv6fFOgN+7oS	529	\N	2017-04-24 08:42:51.34	{}
kXPUs3aLSca80EQ8xBST	SBdioRVUMTzSJjoTQ8iG	TBfShKrtDSTpdWtjzaHX	732	\N	2017-04-25 12:18:11.421	{}
AGDYZObtLnp3LbQXcYZ3	nbFMJA7w8Ms8VOsgI8Uj	8y4BTF9k9ge6fZOBU/fX	538	\N	2017-04-24 16:27:24.991	{}
YEpgpghJzhCwuhHEhQzY	+2fxb2EecC80U2DcxPMF	ZQouLIe5ALw7muhqrXsW	368	\N	2017-04-26 17:11:32.325	{}
AM9n+9SEYjJ797OxqOpJ	budgvhf/oqc9FWtiR59c	pfGZBb7Quxu5lc2opSX1	252	\N	2017-04-24 05:24:33.648	{}
/eQAWK2DPbFzv2ogtkA2	sAxdggjzUR7+K6sSxnyU	fZABmEr1loM+9UGJHfjP	701	\N	2017-04-25 07:33:22.386	{}
8xpBxUMm3iJeodP6zrRX	Hjjd3Ns0lvG3cs9jj4N7	MHV2N45I5170tCyqF8VH	120	\N	2017-04-25 01:48:55.029	{}
am39DRZpaBph8jvxAdKa	kMjFmLjttJpQS3rzutBf	vicnrIDeZ+S3BmlRRf4O	446	\N	2017-04-26 01:13:09.49	{}
A6cbWYtulUsW/OFbtmp3	ZNerBKfcGYvzcUKaYlqg	XpNf5i0UcdaaBXIKEhcT	411	\N	2017-04-25 11:50:19.17	{}
DVyb0TlsUSuCOq+N26YS	0/Dg4ohpw1BIoLvDgRkh	WoDRA+j+ATuPuDII3h0W	213	\N	2017-04-24 14:15:58.875	{}
HtKH0vpWGetGwONjW267	kMjFmLjttJpQS3rzutBf	NwKr3qJ2d0ay+aIttGZz	595	\N	2017-04-25 13:19:58.734	{}
Hxdi0TpcAgUczKmbkUJp	SBdioRVUMTzSJjoTQ8iG	ONSFH3XJ408919tyRHQE	944	\N	2017-04-25 16:41:45.22	{}
xAhlg2t+c56VzC1P2eYy	ljr+mdhFYpVziaRs0plq	zqw5IrJpj+TXw2e0kIrl	190	\N	2017-04-25 13:06:51.078	{}
1lozoPFtzYBCeDl1MvyR	YPGpbTqv9aeZHXxBNgIC	ajaA6rWXZEk/UL7T/1FI	974	\N	2017-04-26 13:37:02.443	{}
CWVzjZC2Ab8JpfdmAx1Y	ljr+mdhFYpVziaRs0plq	ZE1MEIAaV5uvjhiv9rrj	388	\N	2017-04-25 11:12:15.111	{}
JLWjwy/Usr4stYHaDk3n	+2fxb2EecC80U2DcxPMF	/aJCdRh0I4xfGr90oNhM	918	\N	2017-04-26 17:19:39.938	{}
OhXElES/8PFvCUSdC/Zm	ljr+mdhFYpVziaRs0plq	CssMNy8lEi+icRqGdWTJ	385	\N	2017-04-25 08:27:04.297	{}
mXMHixq0o7MkC3YlhnTb	YPGpbTqv9aeZHXxBNgIC	S8u8+4NCKCaySJsQuKaZ	335	\N	2017-04-26 03:27:12.578	{}
TYu602UJHt806wBHTH8x	y90eN2IFt6lwJmUaK9TF	ouZZDeCDdH2/AqrDIz3K	385	\N	2017-04-24 14:20:20.61	{}
6S0SSo5gPu/SWHfHQctQ	SBdioRVUMTzSJjoTQ8iG	lRXokT5Q5bNbg3sUf56u	654	\N	2017-04-26 19:31:22.007	{}
kWyPL3skTdbkLtGC50nx	nbFMJA7w8Ms8VOsgI8Uj	hvT2qrj67N55lyujGU5r	689	\N	2017-04-24 15:20:43.302	{}
Z5Y9Ircgs6RQA76ZCG7b	YPGpbTqv9aeZHXxBNgIC	F0eUSMIjeOV7xXRhc8/V	486	\N	2017-04-26 07:28:03.862	{}
WEj9fOREUS7PcEg/hXSq	SBdioRVUMTzSJjoTQ8iG	9et4NqcYlzqX3h6U2ote	790	\N	2017-04-24 22:59:53.104	{}
XbMhom2QqP2W8T4GJnrb	/cFEfNMpFxRDc1+1PpSb	MiPOqDJMuj9iXXyCIYst	909	\N	2017-04-26 03:55:16.303	{}
QpLja7nJSTraBpX1AOBI	nbFMJA7w8Ms8VOsgI8Uj	1K9NI6uOrHNs2V9QSz4K	237	\N	2017-04-25 09:13:12.946	{}
isWy+Eb6sI9FpT2LfxJm	kMjFmLjttJpQS3rzutBf	8Qv/+tJ0qfJMUx3ZxvpC	257	\N	2017-04-24 23:11:32.174	{}
JO3NSV7jxaW+nIDFxMZa	nbFMJA7w8Ms8VOsgI8Uj	Am8ebcat/RSZisrFkz9H	288	\N	2017-04-26 16:38:51.494	{}
nLunMCqu09b/uuvLsitv	3KOaA2+6IjmFPfm4ChIJ	5hGREKNihF2KzXWq+HWi	646	\N	2017-04-26 20:10:36.015	{}
d9eKWswu7sLwYcbYD2ki	nbFMJA7w8Ms8VOsgI8Uj	7lMCD7HY0vYTGgaUV2Lr	364	\N	2017-04-26 16:22:01.736	{}
st08o+92Yxo8b1FKApEq	VErp5+HZdn3Yz2G88TZh	oV8VM2b8XUdz1PKYUnh/	652	\N	2017-04-26 02:05:57.122	{}
vmZY2GwRH61C3kHtz/sF	XklfmXtmNz7WRzaFwJPY	xIohQGLCgvtS6erUIsjW	861	\N	2017-04-26 21:18:37.505	{}
xvBK9kXO2v/3+ft9Hl3J	XklfmXtmNz7WRzaFwJPY	Pcw/1YKdUzzJGCF6I5wD	217	\N	2017-04-24 12:10:45.002	{}
TOfq81ZnKmESa1/9ONVC	YPGpbTqv9aeZHXxBNgIC	It9+V9XyWP0DUQQAmDGz	529	\N	2017-04-25 02:50:07.609	{}
WQgCMfupy66WMQ2GaFmS	ljr+mdhFYpVziaRs0plq	TSom2O175aH7i2gKvaqu	27	\N	2017-04-25 04:51:48.815	{}
c/tgZiwLnU96NAhJpiMX	YPGpbTqv9aeZHXxBNgIC	r7re5G873EEj5mt21Uoe	553	\N	2017-04-25 06:48:11.53	{}
IR/NzV0xsoPKU4aI7A5f	0/Dg4ohpw1BIoLvDgRkh	OcSENzY89YL/kaVxjVm8	363	\N	2017-04-25 04:37:02.602	{}
V43r/V+RXn+PRWJHS8YN	/cFEfNMpFxRDc1+1PpSb	w6immwaZ9hsNUWRE2z16	873	\N	2017-04-25 07:34:35.777	{}
JmEK7OD25+CNlD3PFxaD	/cFEfNMpFxRDc1+1PpSb	rA2rJlfJpLkm2bdVGxHv	75	\N	2017-04-25 15:57:15.2	{}
aJBugS05d+xaNQsLTCzA	+2fxb2EecC80U2DcxPMF	dS5zsb0zLP6rbksyOwp0	968	\N	2017-04-25 23:42:01.535	{}
waPsxP2PdGFR9VA1TXKq	ZNerBKfcGYvzcUKaYlqg	J78Y5U2YyfU9Kgw+3m3+	343	\N	2017-04-25 23:35:09.608	{}
RxJKG5QQ+lmmPVDZCVeI	kMjFmLjttJpQS3rzutBf	zj9zjQd2YzyS/PIoQzK/	371	\N	2017-04-24 05:06:13.99	{}
M+VlKOukNuwdv+/Rw7qP	ljr+mdhFYpVziaRs0plq	KG3vCwDgqtP5QHqbA+vS	40	\N	2017-04-25 21:12:16.759	{}
90uPnOKKl0IohIQ89xu4	Hjjd3Ns0lvG3cs9jj4N7	4cepSjfZZjoPZ7XoBhHP	827	\N	2017-04-24 04:13:12.458	{}
ecVHhk/hV39wlXv5Gbh2	budgvhf/oqc9FWtiR59c	jDaJkPoABLYpc2XoZOSS	705	\N	2017-04-25 22:20:04.583	{}
GeANBrWa91kEvwL/DpFl	SBdioRVUMTzSJjoTQ8iG	kjiMj23AWZv3MZpaZ+GV	383	\N	2017-04-24 08:56:47.736	{}
47QCnl6M5xcfx/7JQPLW	SBdioRVUMTzSJjoTQ8iG	jp9fgwOlSHGmsJE0bYvl	503	\N	2017-04-25 16:16:36.163	{}
sYsZKcAXy16bl4LdqFQP	budgvhf/oqc9FWtiR59c	WpvXGk5wmK9jpS1xtxhy	398	\N	2017-04-24 06:06:01.827	{}
5f9r5WCeq+cW3fnGbJdc	ljr+mdhFYpVziaRs0plq	L0NxU05u7Ov2/KrzGZQM	126	\N	2017-04-25 10:21:33.668	{}
+WX59z5S9pjpcVzGUbix	Hjjd3Ns0lvG3cs9jj4N7	4PynPgsyCEAiE1BGjGmE	241	\N	2017-04-26 15:02:51.191	{}
TpsAT2JnQqPZvnXiGZT/	nbFMJA7w8Ms8VOsgI8Uj	im68qDXZnQxfTNTAb0cg	10	\N	2017-04-24 01:24:15.528	{}
syDBx6kHzcfcp2Mbi5C7	VErp5+HZdn3Yz2G88TZh	lz3lsqHd7FpE1XRkaFzx	641	\N	2017-04-26 13:58:44.956	{}
2glVj5msWv97Tk/KhBVq	Mooca+XNOJQaJb6IILB6	je4FHDnIgi7I+HF/Yeyq	655	\N	2017-04-24 21:07:26.09	{}
PoVnWrTqybzWV/1B3DeK	rc+ccdAK8F4ROpIC299B	Dl+3gibdyaFA9M5jcc3+	830	\N	2017-04-25 07:51:02.183	{}
UrlZgNjgeaXJfP7Eaz0I	SBdioRVUMTzSJjoTQ8iG	MLqhPcFbAe8nEIC7jcTK	487	\N	2017-04-26 12:54:47.115	{}
w/xkPN7oVVxfFqflHuge	Hjjd3Ns0lvG3cs9jj4N7	kBmTBAtF04d018cSOd6V	932	\N	2017-04-26 03:08:57.506	{}
haxNQBWORGXVbpd8ppcR	/cFEfNMpFxRDc1+1PpSb	V0OxKik9wty+9vcZIlj2	125	\N	2017-04-24 17:14:48.406	{}
Tv381WFzzm1QTgV6SUXw	/cFEfNMpFxRDc1+1PpSb	HfCm4BtERVRsbDhb98UZ	142	\N	2017-04-25 14:45:29.275	{}
FfugyRtQlBIjTEcDXesI	3KOaA2+6IjmFPfm4ChIJ	E7LTtGDjrbMV2na8Xf7r	880	\N	2017-04-25 09:12:59.082	{}
mxd7mcVXXUiImbMwWG5/	TMTdMrgBYgxYoTLKWv35	Efn0ZXmQQHM2csE7lT2L	253	\N	2017-04-26 07:18:05.518	{}
egnslTcmk8lCHOx0HYeX	sAxdggjzUR7+K6sSxnyU	le4JGLRYApAsSmKs48ld	293	\N	2017-04-26 05:44:38.934	{}
i5d7pPW1LS7sdZ74DkUN	3KOaA2+6IjmFPfm4ChIJ	s9oTfzBw7BNJ6uG2SjjU	152	\N	2017-04-25 04:03:35.938	{}
41RUGvRA0vEP+ery2Bde	Hjjd3Ns0lvG3cs9jj4N7	H31SnYmpYR/rlIAJoton	960	\N	2017-04-24 08:45:54.751	{}
YPTlNJrppp5sRnInz5NK	nbFMJA7w8Ms8VOsgI8Uj	/yHf7kZgBtaeYkpRauVK	308	\N	2017-04-24 03:53:00.3	{}
Ba8V08FD68LGex1iBNLf	rc+ccdAK8F4ROpIC299B	JOlzZm4MXf39utdNmLLR	250	\N	2017-04-25 22:32:45.41	{}
Pc73HDTy1JzreyMBHNGm	CBp22Vfd78M4NgkRafEo	s9YxFFx66Y/JlQ6bdzym	794	\N	2017-04-24 15:12:26.531	{}
M+K0G7oZ8vr7opo1DKr2	3KOaA2+6IjmFPfm4ChIJ	Il8B8/6HlXYzQkk7c4oi	473	\N	2017-04-25 19:02:35.235	{}
VXKTIF4ew/XhYBYAzkAb	XklfmXtmNz7WRzaFwJPY	wly1tmIwh3MnlmyBkVWn	415	\N	2017-04-25 12:17:23.741	{}
MmCcHVC6yusnlzLNWv1K	budgvhf/oqc9FWtiR59c	TBfShKrtDSTpdWtjzaHX	392	\N	2017-04-24 12:11:03.857	{}
jxJnR2ytY9JIwuv4aMBM	CBp22Vfd78M4NgkRafEo	cdgMRFBTHjh2+YQA5K0C	326	\N	2017-04-24 20:07:41.155	{}
ohObNXawTzsrRYLaSbYP	ljr+mdhFYpVziaRs0plq	ZQouLIe5ALw7muhqrXsW	871	\N	2017-04-26 08:56:12.672	{}
277t4lkD3bdaoIjhGzaY	y90eN2IFt6lwJmUaK9TF	JXXjP3p9+2zvuRLVjrS1	398	\N	2017-04-26 15:29:39.479	{}
yR9KYRDm8DVRh7EVHXUm	y90eN2IFt6lwJmUaK9TF	mFbNmViDpjR/kFfiC0mL	336	\N	2017-04-25 01:21:34.306	{}
mrWolIKPdpp2ISU8RFQH	SBdioRVUMTzSJjoTQ8iG	rQjQbYVt6R9tq9q33Kh0	693	\N	2017-04-25 03:38:10.434	{}
BIFMP+7GlnHn9oSU/FtC	sAxdggjzUR7+K6sSxnyU	OKyyiU0t3npJlMr34VoG	207	\N	2017-04-25 15:19:22.96	{}
CwFv6/IZokqgesb0Pil8	rc+ccdAK8F4ROpIC299B	QEY68y2xEetxgT7qP8tN	418	\N	2017-04-24 09:14:24.988	{}
nV44NCz3m+yZSz31qJEc	kMjFmLjttJpQS3rzutBf	NwKr3qJ2d0ay+aIttGZz	957	\N	2017-04-26 07:53:38.593	{}
HFAIa70pbF/bAl92ScI2	/cFEfNMpFxRDc1+1PpSb	5P9K7aBmAS6CUeb0m2kb	33	\N	2017-04-25 17:05:19.325	{}
xER08Vpbbjx0WMJrxjVL	TMTdMrgBYgxYoTLKWv35	zqw5IrJpj+TXw2e0kIrl	112	\N	2017-04-25 16:37:03.612	{}
TWblrxIDqreBtYIps/S5	YPGpbTqv9aeZHXxBNgIC	ajaA6rWXZEk/UL7T/1FI	560	\N	2017-04-24 12:56:12.864	{}
mVOKwyWAxy4Ujo4VIIAO	XklfmXtmNz7WRzaFwJPY	ZE1MEIAaV5uvjhiv9rrj	305	\N	2017-04-26 14:47:11.315	{}
wx57xHzY/co7lLl73zRo	CBp22Vfd78M4NgkRafEo	gFACGkEeaEUSsxE5uNT2	266	\N	2017-04-26 00:33:45.214	{}
i+CGvcziT+zq6aKryYfp	ZNerBKfcGYvzcUKaYlqg	+qvxrpY4NjzEfB1iABFA	92	\N	2017-04-24 08:48:46.546	{}
IObPK/qdIwGRj/YF8OGm	rc+ccdAK8F4ROpIC299B	rm64MZT9j+3qLxX5WAYR	336	\N	2017-04-25 13:58:12.02	{}
8bSqKVPbfl/H3z6TTdEW	kMjFmLjttJpQS3rzutBf	xpf1Shnu1p1dKY93w3Rl	108	\N	2017-04-25 11:38:41.099	{}
gBmxvQAMCLqL8o3ZbkbV	+2fxb2EecC80U2DcxPMF	lRXokT5Q5bNbg3sUf56u	558	\N	2017-04-25 03:10:11.009	{}
nt/64cVRyVqibvTXLueE	0/Dg4ohpw1BIoLvDgRkh	NzSnKMGSe1qFW+fFfrMI	296	\N	2017-04-25 04:17:06.46	{}
66xgF645AOrrW72URtvm	ljr+mdhFYpVziaRs0plq	VyiEGsnkNytK4YW7dF1c	574	\N	2017-04-25 04:54:47.239	{}
OuD9kBoYFBORm4Bf6evw	+2fxb2EecC80U2DcxPMF	I7XHsAEyKo9TRYR8CnQW	381	\N	2017-04-26 22:13:15.323	{}
3tzLAiy+AyewIXha7xlx	+2fxb2EecC80U2DcxPMF	mkHADJK7ssgDeFTAlffW	905	\N	2017-04-25 08:35:16.384	{}
otHMVM4QxbDKdCL4Zd/w	Mooca+XNOJQaJb6IILB6	Nt1n/jGh+g9CSFVeZFwt	740	\N	2017-04-25 21:44:19.628	{}
jvqK14lXztC918YkVSxy	y90eN2IFt6lwJmUaK9TF	Am8ebcat/RSZisrFkz9H	308	\N	2017-04-24 11:33:19.429	{}
1g5I4ZjhAg/4sncqkLrh	VErp5+HZdn3Yz2G88TZh	5hGREKNihF2KzXWq+HWi	56	\N	2017-04-25 07:29:13.281	{}
BxPggWTjxabGzttrQFYv	rc+ccdAK8F4ROpIC299B	5TfY0LRjZ2+LNXGrf0j4	183	\N	2017-04-25 20:52:29.014	{}
CNle5m9hK+Z959eQn7da	YPGpbTqv9aeZHXxBNgIC	rSuTrmYO7TdYcpi/YLmk	100	\N	2017-04-24 19:05:05.54	{}
G8GJLhz+Fhrgd4lDFB2E	0/Dg4ohpw1BIoLvDgRkh	WEnpWBr7Km73V19/xU6n	261	\N	2017-04-25 09:45:21.147	{}
UEjQiw9WvGmC7w7K7zsf	y90eN2IFt6lwJmUaK9TF	IY4k7bB5U+EkZ2Qn/2nU	218	\N	2017-04-24 16:41:23.518	{}
eDw+eNuJrpV4goHTmJKc	Hjjd3Ns0lvG3cs9jj4N7	3wL1s1/Ku8HE5CgISX7O	539	\N	2017-04-25 05:37:31.315	{}
y7Izvn52jHOBqjoOYbfc	ZNerBKfcGYvzcUKaYlqg	VN4QUl4eYsOz7k7xlq0d	775	\N	2017-04-24 02:39:58.66	{}
4k5SBpeWliKHhknEVT52	Hjjd3Ns0lvG3cs9jj4N7	9Lm4ehC9uq+z4PHZoPGl	869	\N	2017-04-24 03:50:41.621	{}
ctY7MCoXFLDkT/2PvYnV	+2fxb2EecC80U2DcxPMF	iYlqVN7/0PCnWNeaT/nL	228	\N	2017-04-26 17:46:02.341	{}
oHE6QrpB2JWsPfVK7p2R	Hjjd3Ns0lvG3cs9jj4N7	aPDGLrRUB4meVjgwSXMV	950	\N	2017-04-25 16:40:10.739	{}
fEXcJY3LTpK7U3OOxmoG	CBp22Vfd78M4NgkRafEo	dS5zsb0zLP6rbksyOwp0	449	\N	2017-04-25 16:52:38.072	{}
jy/DJYx5d67N/bcLYIYp	VErp5+HZdn3Yz2G88TZh	J78Y5U2YyfU9Kgw+3m3+	601	\N	2017-04-24 14:45:56.15	{}
3GNm5ZsFFDUNYIU0TZ/D	nbFMJA7w8Ms8VOsgI8Uj	zj9zjQd2YzyS/PIoQzK/	592	\N	2017-04-24 19:52:03.064	{}
XBqdtsPdPTNWtb02yaEP	0/Dg4ohpw1BIoLvDgRkh	KG3vCwDgqtP5QHqbA+vS	422	\N	2017-04-24 01:26:35.046	{}
1RKocMk+b8ScOGTd5ISy	/cFEfNMpFxRDc1+1PpSb	oW+uHFo+0wBrztV7u5yu	688	\N	2017-04-26 12:49:53.583	{}
QFiogeInFAVAFs7zwXAW	Hjjd3Ns0lvG3cs9jj4N7	Wl5H14SxxtlMduGDei9P	398	\N	2017-04-25 07:47:45.293	{}
8XHCX7KYar68LkfQA422	ljr+mdhFYpVziaRs0plq	Gu6rmhUDAvOXySQ1i99+	319	\N	2017-04-24 08:19:14.02	{}
n1iooO80V3cpXY3GdP6B	kMjFmLjttJpQS3rzutBf	aKibXbmwRjGZbincWFUN	876	\N	2017-04-26 09:54:25.346	{}
M8/pBW2il/hx69jbrR6b	0/Dg4ohpw1BIoLvDgRkh	WpvXGk5wmK9jpS1xtxhy	478	\N	2017-04-24 02:42:36.208	{}
KTSWcUA0tg7rOwXmT7j4	CBp22Vfd78M4NgkRafEo	L0NxU05u7Ov2/KrzGZQM	19	\N	2017-04-26 02:32:15.461	{}
L6v1ujgMfvs24pTCpza4	VErp5+HZdn3Yz2G88TZh	4PynPgsyCEAiE1BGjGmE	639	\N	2017-04-25 00:46:55.085	{}
1Rb4kn64WDRWcQ6rZYuj	Hjjd3Ns0lvG3cs9jj4N7	im68qDXZnQxfTNTAb0cg	584	\N	2017-04-24 00:49:26.783	{}
XOzKy+VvtdU3gL5KAjEk	XklfmXtmNz7WRzaFwJPY	LB2cJljpW4d4pE2Ds0gg	152	\N	2017-04-25 14:41:09.448	{}
xV8gi1v1aNt1nUuGGX5E	sAxdggjzUR7+K6sSxnyU	je4FHDnIgi7I+HF/Yeyq	107	\N	2017-04-24 23:32:25.195	{}
XF1ogCDk+3cqLk06UX31	nbFMJA7w8Ms8VOsgI8Uj	Dl+3gibdyaFA9M5jcc3+	95	\N	2017-04-25 10:01:40.22	{}
T+ZwcUIxtXZm0gLqEG7+	+2fxb2EecC80U2DcxPMF	RCNHGWVzNUypSWbbMc4v	504	\N	2017-04-26 19:03:15.225	{}
1zZFol5Rb6fNBc9sSZ0N	/cFEfNMpFxRDc1+1PpSb	epToVAs65GfRK5IPM87T	153	\N	2017-04-24 06:37:33.452	{}
IRnmfoqK8GUxHuM13TAB	nbFMJA7w8Ms8VOsgI8Uj	Wf6qGvpBstEZ8AqzSJaL	244	\N	2017-04-24 02:47:53.308	{}
VGLnpzZvVDRBWJUkkXJY	budgvhf/oqc9FWtiR59c	HfCm4BtERVRsbDhb98UZ	57	\N	2017-04-25 09:45:39.785	{}
3qI7pyKcbgTpFih7fjZD	budgvhf/oqc9FWtiR59c	3hkeSfHvHoeuiXEbbppA	934	\N	2017-04-25 01:45:51.695	{}
WpCObqxyifIVEsaIg8uP	SBdioRVUMTzSJjoTQ8iG	OUXekNWDkMDjn6VidOCj	371	\N	2017-04-26 08:35:16.374	{}
3aWjWGj08aL3f/2T62gp	YPGpbTqv9aeZHXxBNgIC	2z3DhxYYYpAcRZFMlLyY	17	\N	2017-04-24 12:52:22.617	{}
99GmrXpY8JIKLu2lfse2	Hjjd3Ns0lvG3cs9jj4N7	H31SnYmpYR/rlIAJoton	184	\N	2017-04-25 00:55:50.035	{}
ohlVCLGOsb0UTLlQB8D6	sAxdggjzUR7+K6sSxnyU	/yHf7kZgBtaeYkpRauVK	708	\N	2017-04-24 01:51:03.748	{}
c9Z+ss7CGff0PSZcR/bU	ZNerBKfcGYvzcUKaYlqg	oJwS+ChHV31ZxmnvRyLH	374	\N	2017-04-25 16:53:44.71	{}
w40pX5j4/6Jwdqcu1BVj	SBdioRVUMTzSJjoTQ8iG	s9YxFFx66Y/JlQ6bdzym	862	\N	2017-04-24 00:40:46.102	{}
BVQ7k3AlMbtl0T2G0AKZ	3KOaA2+6IjmFPfm4ChIJ	rMyid2BKanhr6Ip04p4f	433	\N	2017-04-26 08:56:19.062	{}
iEjVUSFgV1GlaVk5g5L3	/cFEfNMpFxRDc1+1PpSb	zir3Xihafv6fFOgN+7oS	427	\N	2017-04-24 08:04:36.308	{}
FnRy8aayGyOJfDuHO9pb	ZNerBKfcGYvzcUKaYlqg	kbB/H9iyJ0aFOlYXnFjm	59	\N	2017-04-24 03:25:33.787	{}
CDhVeDzZH2S2FFP0AeAu	Hjjd3Ns0lvG3cs9jj4N7	cP6076ZyJg3Aw87bdi/S	647	\N	2017-04-26 18:00:50.147	{}
AdzOfHtBpYaPybmvrayQ	Hjjd3Ns0lvG3cs9jj4N7	++w2i4ZL0tNtE9yX1zRw	464	\N	2017-04-24 21:43:20.085	{}
JELfH+tYsj49qaoJLtGU	ZNerBKfcGYvzcUKaYlqg	c+6qiAgPmJP66XA0Vf3S	504	\N	2017-04-26 20:24:29.84	{}
XE4iN3pB98wF2FmXZMIQ	ZNerBKfcGYvzcUKaYlqg	mFbNmViDpjR/kFfiC0mL	679	\N	2017-04-26 08:03:37.909	{}
DnGcg4/GO8yE9MVy41j3	sAxdggjzUR7+K6sSxnyU	rQjQbYVt6R9tq9q33Kh0	319	\N	2017-04-26 00:06:45.691	{}
JiNYR0ma0bGOTJs/+PwC	+2fxb2EecC80U2DcxPMF	OKyyiU0t3npJlMr34VoG	997	\N	2017-04-26 08:01:03.065	{}
DEKrcYlME0bsn3f356hT	ZNerBKfcGYvzcUKaYlqg	WoDRA+j+ATuPuDII3h0W	944	\N	2017-04-26 16:46:45.89	{}
D64gLC70S2tN/7X2IRUi	XklfmXtmNz7WRzaFwJPY	NwKr3qJ2d0ay+aIttGZz	293	\N	2017-04-25 06:46:56.455	{}
Df/rxZx7xnZITTryLQlz	0/Dg4ohpw1BIoLvDgRkh	ukZPrMn23AA30qryOIlR	775	\N	2017-04-26 23:59:32.94	{}
tp+ptio4x1+SvnzMaJKh	y90eN2IFt6lwJmUaK9TF	QNefNh8nB6OjhGAjgmv1	128	\N	2017-04-26 07:31:15.155	{}
+4oOL2m/o0Ws4snzGB6F	/cFEfNMpFxRDc1+1PpSb	rLeakL8zAPimGnvBTUuH	217	\N	2017-04-26 10:32:27.665	{}
u90YConWgc3EIk5MUyqY	Mooca+XNOJQaJb6IILB6	3WjXm/DLIZX5tqBVnVxl	697	\N	2017-04-26 00:58:52.609	{}
wvq+Xm8vi2dAro/E6jMH	Mooca+XNOJQaJb6IILB6	/aJCdRh0I4xfGr90oNhM	184	\N	2017-04-25 04:53:03.624	{}
P6Bjjd5PM2p5DiM93YL2	kMjFmLjttJpQS3rzutBf	+qvxrpY4NjzEfB1iABFA	720	\N	2017-04-24 10:38:23.487	{}
3emgC4Favms5hxxEp0to	/cFEfNMpFxRDc1+1PpSb	S8u8+4NCKCaySJsQuKaZ	68	\N	2017-04-25 12:02:14.458	{}
vrYP/lV1KOr6rkUHp05b	sAxdggjzUR7+K6sSxnyU	xpf1Shnu1p1dKY93w3Rl	92	\N	2017-04-25 02:53:56.125	{}
AtbfswLYhz/Bjblok6wx	VErp5+HZdn3Yz2G88TZh	lRXokT5Q5bNbg3sUf56u	67	\N	2017-04-24 10:50:50.93	{}
VuIZb6GB9Qsn+T4ZLIha	y90eN2IFt6lwJmUaK9TF	hvT2qrj67N55lyujGU5r	53	\N	2017-04-25 15:40:19.022	{}
DkjYTnIXLHw523WsbC7T	CBp22Vfd78M4NgkRafEo	F0eUSMIjeOV7xXRhc8/V	632	\N	2017-04-24 09:04:32.283	{}
Ef0TVjqubhfmzJcA44Fc	Hjjd3Ns0lvG3cs9jj4N7	I7XHsAEyKo9TRYR8CnQW	801	\N	2017-04-25 14:18:21.124	{}
D7TmbpFH2lvkeOl85bT3	kMjFmLjttJpQS3rzutBf	Ub/sXysP22nn+MDXBePE	767	\N	2017-04-26 05:52:26.86	{}
lnICVHsXzSIuzLQXPXyV	ZNerBKfcGYvzcUKaYlqg	1K9NI6uOrHNs2V9QSz4K	988	\N	2017-04-25 06:44:18.354	{}
+UEaj7XHyWe2uXRXlXtt	nbFMJA7w8Ms8VOsgI8Uj	jz5nWB/ep4b/Gbk8fezU	803	\N	2017-04-24 21:57:23.917	{}
DGrgyED/G3V58k3R+dZ3	ZNerBKfcGYvzcUKaYlqg	yM72CTeWPZWaxu/bymH/	612	\N	2017-04-26 05:58:43.142	{}
ZmiU0YhSYfq6+ieQqZYv	rc+ccdAK8F4ROpIC299B	rx8uS+H3aAhi2J41Qbb4	792	\N	2017-04-24 09:11:07.09	{}
D/pmz0t41p0DhxAO7Eg+	rc+ccdAK8F4ROpIC299B	Am8ebcat/RSZisrFkz9H	505	\N	2017-04-24 21:12:45.786	{}
zrlOkV9GaNoCoSM2vrt3	kMjFmLjttJpQS3rzutBf	Gdl0Z2TWZxlFoa5Hivrm	554	\N	2017-04-26 08:17:48.128	{}
sDIuWGSzW5IT9/eHO7nP	budgvhf/oqc9FWtiR59c	7lMCD7HY0vYTGgaUV2Lr	39	\N	2017-04-25 16:23:06.836	{}
03R+/W7jJSW1f55koRze	rc+ccdAK8F4ROpIC299B	oV8VM2b8XUdz1PKYUnh/	386	\N	2017-04-24 23:02:08.992	{}
ZucfFYSkLUclJfdIf3/0	kMjFmLjttJpQS3rzutBf	noJgLUV1hnfx/0t3gvaP	713	\N	2017-04-25 07:39:18.082	{}
7/m2Zq7crJeQkUOS2djR	TMTdMrgBYgxYoTLKWv35	IY4k7bB5U+EkZ2Qn/2nU	708	\N	2017-04-24 03:42:43.107	{}
2ZzWsN2ncHKg2vh5hHnC	ZNerBKfcGYvzcUKaYlqg	3wL1s1/Ku8HE5CgISX7O	474	\N	2017-04-24 00:00:12.547	{}
leBxvTqBFJerSiO0nbt6	YPGpbTqv9aeZHXxBNgIC	VN4QUl4eYsOz7k7xlq0d	402	\N	2017-04-26 17:12:03.476	{}
9TeG4fUMvH9koxbuKEJc	Mooca+XNOJQaJb6IILB6	RJZlYd9NeGndiasoJ042	394	\N	2017-04-25 21:24:55.066	{}
5TlcjLnWHbcH04sHeuo3	+2fxb2EecC80U2DcxPMF	OcSENzY89YL/kaVxjVm8	875	\N	2017-04-25 10:28:57.878	{}
97dCQ5JaSLgN7rht+w20	CBp22Vfd78M4NgkRafEo	w6immwaZ9hsNUWRE2z16	98	\N	2017-04-25 09:51:36.241	{}
qRAtUZuPIn6Ze3qQwGUf	budgvhf/oqc9FWtiR59c	aPDGLrRUB4meVjgwSXMV	625	\N	2017-04-24 16:59:44.006	{}
DB93bWP1qLAsrzCHcotd	XklfmXtmNz7WRzaFwJPY	tcah/OliB/nPR/KU/FFk	844	\N	2017-04-25 05:56:29.653	{}
na6I7Rq9SF487elP7CIa	+2fxb2EecC80U2DcxPMF	rOMcnQ6NHOL6jLI4ksP5	414	\N	2017-04-26 20:30:11.498	{}
CsY/Mmf/0JLD/pYTgPHe	XklfmXtmNz7WRzaFwJPY	nHh8alY9hEQ6/jWDV3Eu	529	\N	2017-04-24 22:46:29.479	{}
j2xuvBN8/AaBy5aVF403	+2fxb2EecC80U2DcxPMF	oW+uHFo+0wBrztV7u5yu	672	\N	2017-04-24 20:32:01.389	{}
xb2cjB1wOrg6k7Btrs7B	SBdioRVUMTzSJjoTQ8iG	Wl5H14SxxtlMduGDei9P	451	\N	2017-04-25 22:36:02.644	{}
cBsS9l4VTFg6wzCHtb7/	rc+ccdAK8F4ROpIC299B	opiv+xPgg6MFq2FCVGFl	231	\N	2017-04-26 10:38:37.058	{}
nVzj97kx3EWbZo0yxSHK	kMjFmLjttJpQS3rzutBf	aKibXbmwRjGZbincWFUN	878	\N	2017-04-26 21:28:19.934	{}
5KaQpjVRv1oRog3YSreY	rc+ccdAK8F4ROpIC299B	qO2DCoUGcx4T46CYX3Hf	153	\N	2017-04-25 20:12:19.864	{}
4HhLt/VgJgmv9J9eCTUk	+2fxb2EecC80U2DcxPMF	Rlbp92RoIO9r8b7bHfgQ	881	\N	2017-04-26 15:15:08.418	{}
aiTADzHgORxggiSyYrqo	SBdioRVUMTzSJjoTQ8iG	B8ymtG32dC230Zvp4RZf	849	\N	2017-04-24 19:21:20.987	{}
Kwu1oifsrwRZtRe+QhDJ	Hjjd3Ns0lvG3cs9jj4N7	j+4ifTxeztqIKOxhHoHA	832	\N	2017-04-26 09:44:54.905	{}
5CfgzI4lngx4xllvdFgU	TMTdMrgBYgxYoTLKWv35	je4FHDnIgi7I+HF/Yeyq	713	\N	2017-04-24 21:53:07.341	{}
weh7WBH1VYohhGPK3mNA	ZNerBKfcGYvzcUKaYlqg	RCNHGWVzNUypSWbbMc4v	247	\N	2017-04-24 03:00:24.187	{}
iE/EW/A49HBWo2dz9QhA	ljr+mdhFYpVziaRs0plq	3cmZYcR+hE74XsfWiNjU	931	\N	2017-04-26 23:37:33.474	{}
Lfnmx/ZrEAciZziTuqVC	nbFMJA7w8Ms8VOsgI8Uj	kBmTBAtF04d018cSOd6V	147	\N	2017-04-24 02:15:06.244	{}
UTnTZxm62tRKl/008mbp	CBp22Vfd78M4NgkRafEo	V0OxKik9wty+9vcZIlj2	84	\N	2017-04-24 07:58:41.696	{}
L1S8PkMt7qpC4Sdp4zC+	budgvhf/oqc9FWtiR59c	7fpAjnqgvgim9uOUCpOM	41	\N	2017-04-26 02:19:48.289	{}
gcmgpkjaM6wMZZsbimJE	nbFMJA7w8Ms8VOsgI8Uj	7fpAjnqgvgim9uOUCpOM	374	\N	2017-04-26 04:42:31.653	{}
mZq7/hviUw/GuwDTlayD	VErp5+HZdn3Yz2G88TZh	Efn0ZXmQQHM2csE7lT2L	87	\N	2017-04-24 23:41:00.204	{}
H+2748Ephz79l/6oTa/7	rc+ccdAK8F4ROpIC299B	le4JGLRYApAsSmKs48ld	207	\N	2017-04-25 04:48:28.213	{}
VlFuXhApRDF9Glr0SgV+	3KOaA2+6IjmFPfm4ChIJ	s9oTfzBw7BNJ6uG2SjjU	643	\N	2017-04-24 19:02:07.731	{}
PoHee7it9+rxBeEws1wn	ljr+mdhFYpVziaRs0plq	KDKFvPfKSPlpKJxx1qVu	672	\N	2017-04-26 22:12:53.365	{}
phq69E4pj6/BiA7E3I3Z	VErp5+HZdn3Yz2G88TZh	nX9Dl0ZeyLiXiKO7EYdE	892	\N	2017-04-26 02:17:53.767	{}
tnzdAS/32acJsgjM3KIU	ZNerBKfcGYvzcUKaYlqg	G4VGkYaV7birSYRbEZkt	285	\N	2017-04-24 08:18:27.341	{}
DGtyci6pz7Fa8YuF+LqI	nbFMJA7w8Ms8VOsgI8Uj	LT+/mL3LeaKodL6O2fEj	417	\N	2017-04-26 07:56:03.388	{}
5iVXwW1sOZdiTf2uVdpN	budgvhf/oqc9FWtiR59c	wA+nsnAmde7GMr9UqQN9	316	\N	2017-04-25 16:46:18.234	{}
jZ6zXWLk3fizgwLliH2Z	Mooca+XNOJQaJb6IILB6	wA+nsnAmde7GMr9UqQN9	752	\N	2017-04-26 16:22:11.809	{}
YcR7KuKznRYVzoUSlf9j	3KOaA2+6IjmFPfm4ChIJ	zir3Xihafv6fFOgN+7oS	853	\N	2017-04-24 20:41:51.275	{}
1dQgmWJGX8EyXvzJv1pn	Mooca+XNOJQaJb6IILB6	kbB/H9iyJ0aFOlYXnFjm	830	\N	2017-04-25 15:26:37.79	{}
v8PFe4/bN/+zQMupaOC3	/cFEfNMpFxRDc1+1PpSb	8y4BTF9k9ge6fZOBU/fX	498	\N	2017-04-25 09:46:13.888	{}
bJt/BVh27m3n1BrENtPB	rc+ccdAK8F4ROpIC299B	++w2i4ZL0tNtE9yX1zRw	22	\N	2017-04-26 04:05:07.007	{}
q3HgRPE7bTPM2ffQBur0	nbFMJA7w8Ms8VOsgI8Uj	pfGZBb7Quxu5lc2opSX1	581	\N	2017-04-25 08:16:09.185	{}
L43LBDL2D5C7duuLMmiG	Hjjd3Ns0lvG3cs9jj4N7	fZABmEr1loM+9UGJHfjP	246	\N	2017-04-26 23:08:36.289	{}
s5QTR6GNm5MfLRljndBy	ljr+mdhFYpVziaRs0plq	mFbNmViDpjR/kFfiC0mL	898	\N	2017-04-24 01:10:55.858	{}
y+u3kxvACeuZpXxaGykQ	3KOaA2+6IjmFPfm4ChIJ	CSjeSw4nrRJMO9QqYohD	171	\N	2017-04-26 11:53:33.301	{}
N+LmC0JidPJcaPkMRKPF	0/Dg4ohpw1BIoLvDgRkh	OKyyiU0t3npJlMr34VoG	184	\N	2017-04-25 17:35:34.284	{}
/detet5MSuuEB0IHb/8j	rc+ccdAK8F4ROpIC299B	QEY68y2xEetxgT7qP8tN	24	\N	2017-04-24 04:35:54.821	{}
BuLVVzxfTndZnTW50oMM	SBdioRVUMTzSJjoTQ8iG	ukZPrMn23AA30qryOIlR	365	\N	2017-04-26 10:37:19.402	{}
8H63DhGEXlREZZU2sG2h	y90eN2IFt6lwJmUaK9TF	MCFnBgsCJuoIGwB5BfNy	414	\N	2017-04-24 13:35:55.142	{}
RS8mQ54WpgON4hnmh3cy	VErp5+HZdn3Yz2G88TZh	GzHTBQ++NW43kRFRZ5FD	895	\N	2017-04-24 12:28:31.147	{}
/tP4xAf0uf4mv7PQUSTo	TMTdMrgBYgxYoTLKWv35	3WjXm/DLIZX5tqBVnVxl	872	\N	2017-04-24 01:55:07.243	{}
Ia7oTqulU/m60K+1G2RY	XklfmXtmNz7WRzaFwJPY	/aJCdRh0I4xfGr90oNhM	180	\N	2017-04-26 02:35:38.372	{}
RyJguKhCVjwRY20z8Cex	SBdioRVUMTzSJjoTQ8iG	CssMNy8lEi+icRqGdWTJ	67	\N	2017-04-24 04:59:35.857	{}
fKkmjqKepUa9gR3Eu7Fa	sAxdggjzUR7+K6sSxnyU	S8u8+4NCKCaySJsQuKaZ	9	\N	2017-04-26 13:55:36.578	{}
f9X3wDbHQXGYcv3GezKp	sAxdggjzUR7+K6sSxnyU	xpf1Shnu1p1dKY93w3Rl	917	\N	2017-04-25 04:33:44.588	{}
EUgKaHh2u+uVQzGu6NqJ	nbFMJA7w8Ms8VOsgI8Uj	ouZZDeCDdH2/AqrDIz3K	912	\N	2017-04-25 04:06:37.567	{}
C0d/ZQK20RAo+R6AA8k5	CBp22Vfd78M4NgkRafEo	NzSnKMGSe1qFW+fFfrMI	663	\N	2017-04-26 10:37:55.225	{}
pgEyl/2BiTNoXipZq2nX	YPGpbTqv9aeZHXxBNgIC	hvT2qrj67N55lyujGU5r	252	\N	2017-04-24 11:34:45.582	{}
2VAN/uVoQDwAIMR9nI4p	0/Dg4ohpw1BIoLvDgRkh	FCR9FppSwAMOV+DllY4Y	455	\N	2017-04-24 21:11:26.14	{}
RZo4w04XcTptOdS1lzwo	ZNerBKfcGYvzcUKaYlqg	I7XHsAEyKo9TRYR8CnQW	217	\N	2017-04-24 08:14:53.949	{}
bHEtV5DdeV02Ftzestc/	VErp5+HZdn3Yz2G88TZh	Ub/sXysP22nn+MDXBePE	106	\N	2017-04-25 12:28:09.203	{}
n8SltPgyMiQS5zSp7FyN	3KOaA2+6IjmFPfm4ChIJ	Nt1n/jGh+g9CSFVeZFwt	820	\N	2017-04-24 13:32:26.298	{}
DLbdn9XZHAKf9IyQg056	SBdioRVUMTzSJjoTQ8iG	HGy5qKtixcrZTyVQk3lH	875	\N	2017-04-25 22:03:27.656	{}
lmwRuBurWm+2DtAo7Fsw	y90eN2IFt6lwJmUaK9TF	B7fAevV3J5shq9LZU80N	293	\N	2017-04-24 23:08:18.582	{}
X2fc6ssB9wJIsy4rtH1M	ZNerBKfcGYvzcUKaYlqg	5TfY0LRjZ2+LNXGrf0j4	473	\N	2017-04-25 04:10:36.788	{}
heysp+H7cjD8MZjqaqes	CBp22Vfd78M4NgkRafEo	gARnv45PiZksvoIJaTf3	345	\N	2017-04-24 00:00:30.095	{}
jOdNZiyhJ5wW3tM87mkh	XklfmXtmNz7WRzaFwJPY	xIohQGLCgvtS6erUIsjW	67	\N	2017-04-26 05:22:19.131	{}
sx8TRCQUz9DMNaaMzPER	nbFMJA7w8Ms8VOsgI8Uj	Pcw/1YKdUzzJGCF6I5wD	5	\N	2017-04-24 03:47:28.748	{}
V0iIZGG+BPGggX9F+Q2g	Mooca+XNOJQaJb6IILB6	3wL1s1/Ku8HE5CgISX7O	157	\N	2017-04-24 07:34:04.563	{}
caHmQTtNdW7GenbEkUIO	budgvhf/oqc9FWtiR59c	VN4QUl4eYsOz7k7xlq0d	188	\N	2017-04-24 16:41:36.904	{}
BvH8pobQbEsuuZUZVzFi	YPGpbTqv9aeZHXxBNgIC	r7re5G873EEj5mt21Uoe	515	\N	2017-04-24 08:34:28.895	{}
AzRNC+tdskzCcZJo2u5F	nbFMJA7w8Ms8VOsgI8Uj	GdsuYQmmf+KF1Qk2zFVM	805	\N	2017-04-25 21:00:54.951	{}
joTzJWjqHmRWVN9B02Hq	budgvhf/oqc9FWtiR59c	SOn/5UePJyI9tFyw0dY2	475	\N	2017-04-25 17:27:31.981	{}
ZuQi7bSYATjjgP/wNzi0	XklfmXtmNz7WRzaFwJPY	rA2rJlfJpLkm2bdVGxHv	872	\N	2017-04-26 17:16:59.678	{}
dthREtcRGo/jV4VTiMyP	CBp22Vfd78M4NgkRafEo	tcah/OliB/nPR/KU/FFk	663	\N	2017-04-26 18:43:46.344	{}
BszlR5bSQg+R4GwX+d1s	budgvhf/oqc9FWtiR59c	rOMcnQ6NHOL6jLI4ksP5	682	\N	2017-04-25 18:59:07.131	{}
RSFOF9cf4LmrQTMkbgkI	0/Dg4ohpw1BIoLvDgRkh	nHh8alY9hEQ6/jWDV3Eu	939	\N	2017-04-24 10:29:40.252	{}
bP98ak1INfYsjho5am9j	Hjjd3Ns0lvG3cs9jj4N7	Nhjw4XwI181eyg+T6Y/h	370	\N	2017-04-24 20:43:35.393	{}
92IL6c2vEZU0ah9bbHlK	3KOaA2+6IjmFPfm4ChIJ	4cepSjfZZjoPZ7XoBhHP	35	\N	2017-04-24 06:46:14.749	{}
RESvqQnefhAkKpY3nBs6	sAxdggjzUR7+K6sSxnyU	Gu6rmhUDAvOXySQ1i99+	402	\N	2017-04-24 12:35:47.931	{}
VLWzLNNP+X9xQXIBtHMm	ljr+mdhFYpVziaRs0plq	kjiMj23AWZv3MZpaZ+GV	353	\N	2017-04-25 08:11:24.179	{}
+M1nMfhnYCFbd3FEBjOc	ZNerBKfcGYvzcUKaYlqg	WpvXGk5wmK9jpS1xtxhy	359	\N	2017-04-25 02:25:41.262	{}
A1MrB47vhCaL+Q12tnEk	nbFMJA7w8Ms8VOsgI8Uj	PzUQaEXjTuyK6HhipV7O	761	\N	2017-04-26 07:24:16.72	{}
JMqtn8Qr7l3Np1qzxMu1	/cFEfNMpFxRDc1+1PpSb	4PynPgsyCEAiE1BGjGmE	703	\N	2017-04-26 23:02:59.264	{}
P5SsubdBANKXcIUmQj+B	budgvhf/oqc9FWtiR59c	27SKcp51d2jyQLc8ZWEQ	456	\N	2017-04-24 21:36:25.417	{}
pxxpc4nbYAcoOR2+NfBx	budgvhf/oqc9FWtiR59c	lz3lsqHd7FpE1XRkaFzx	84	\N	2017-04-26 20:02:20.488	{}
r+5inHu+XDTYPO3NkfQs	Hjjd3Ns0lvG3cs9jj4N7	1VjkjAiDllfTffQV5Htp	581	\N	2017-04-25 20:17:45.179	{}
MhXMfkotgy4W7aRiRqHS	+2fxb2EecC80U2DcxPMF	Dl+3gibdyaFA9M5jcc3+	252	\N	2017-04-24 10:08:03.072	{}
K8aNtz2i9EWJ7295IaCl	3KOaA2+6IjmFPfm4ChIJ	MLqhPcFbAe8nEIC7jcTK	166	\N	2017-04-26 04:58:52.495	{}
TR0aXBXlx/XfVXUoxHCz	ZNerBKfcGYvzcUKaYlqg	kBmTBAtF04d018cSOd6V	440	\N	2017-04-24 02:34:32.104	{}
VDhuzir/Sr+Bn1qYnPYg	SBdioRVUMTzSJjoTQ8iG	Wf6qGvpBstEZ8AqzSJaL	347	\N	2017-04-24 23:50:21.427	{}
q5WwNC6CLdIgdW8QD3P7	XklfmXtmNz7WRzaFwJPY	zh36n/IfyyGSoI9mzFpR	445	\N	2017-04-26 15:40:56.159	{}
IMSUIkDxSlXXj6uSsMjA	VErp5+HZdn3Yz2G88TZh	rI/ioSq1692GF+II7QJT	676	\N	2017-04-26 00:53:48.495	{}
4zCNOcV+63YyZaueLtd5	VErp5+HZdn3Yz2G88TZh	OUXekNWDkMDjn6VidOCj	100	\N	2017-04-26 09:40:22.009	{}
qXmLlO0dyiKdSjA/za1u	+2fxb2EecC80U2DcxPMF	2z3DhxYYYpAcRZFMlLyY	235	\N	2017-04-25 20:07:01.05	{}
GvvMIAfZ9PqudNPHxfFk	XklfmXtmNz7WRzaFwJPY	H31SnYmpYR/rlIAJoton	637	\N	2017-04-25 00:52:12.643	{}
3uETbZz9bkE5qiKQkhf6	YPGpbTqv9aeZHXxBNgIC	nX9Dl0ZeyLiXiKO7EYdE	688	\N	2017-04-25 06:36:24.307	{}
QBMI+Yi5GKFNNg9mOb9s	y90eN2IFt6lwJmUaK9TF	M3/j26SVcwmdT8BK6oxI	204	\N	2017-04-26 11:12:29.338	{}
R0uB/0LBnOGCQCvCFnw6	nbFMJA7w8Ms8VOsgI8Uj	s9YxFFx66Y/JlQ6bdzym	874	\N	2017-04-24 07:29:56.008	{}
XF0NDg/bDsAv3R2878kc	Mooca+XNOJQaJb6IILB6	wA+nsnAmde7GMr9UqQN9	764	\N	2017-04-26 12:15:39.118	{}
BzGn0rDTddjRXs/S7eo3	kMjFmLjttJpQS3rzutBf	rMyid2BKanhr6Ip04p4f	753	\N	2017-04-24 17:30:29.615	{}
Tc0+oopUhj4dtIJbSmyq	nbFMJA7w8Ms8VOsgI8Uj	wly1tmIwh3MnlmyBkVWn	308	\N	2017-04-26 09:33:31.639	{}
BCgoxJfOiWKGuK/q+Yah	/cFEfNMpFxRDc1+1PpSb	TBfShKrtDSTpdWtjzaHX	966	\N	2017-04-25 01:59:34.894	{}
jFsRAWKzrsnpERxpBA73	nbFMJA7w8Ms8VOsgI8Uj	cdgMRFBTHjh2+YQA5K0C	971	\N	2017-04-24 12:14:52.363	{}
AnxyN8aYyTEYtsOtF0W+	/cFEfNMpFxRDc1+1PpSb	ZQouLIe5ALw7muhqrXsW	15	\N	2017-04-24 00:08:15.542	{}
898lcihaYCE/NNzAPwGJ	y90eN2IFt6lwJmUaK9TF	c+6qiAgPmJP66XA0Vf3S	134	\N	2017-04-24 22:35:22.522	{}
dnS5C05I9bNU/yXLmNVG	ljr+mdhFYpVziaRs0plq	fZABmEr1loM+9UGJHfjP	721	\N	2017-04-26 18:49:39.719	{}
ZZ23+HZWVml9UATHfSuC	ZNerBKfcGYvzcUKaYlqg	MHV2N45I5170tCyqF8VH	963	\N	2017-04-24 21:15:12.5	{}
Rv/Nd6BJQbMjPi1GAt4R	ljr+mdhFYpVziaRs0plq	vicnrIDeZ+S3BmlRRf4O	705	\N	2017-04-24 16:01:38.602	{}
FOF8DtNuXngOfe3N6Uif	TMTdMrgBYgxYoTLKWv35	XpNf5i0UcdaaBXIKEhcT	763	\N	2017-04-26 08:38:38.5	{}
uywXHGbXHNk7pWUA49rX	nbFMJA7w8Ms8VOsgI8Uj	QEY68y2xEetxgT7qP8tN	890	\N	2017-04-24 12:18:05.802	{}
KqV4vc/RUZlPe/4ej+jK	Mooca+XNOJQaJb6IILB6	5P9K7aBmAS6CUeb0m2kb	142	\N	2017-04-26 03:24:01.22	{}
MyRb9AUamQvV5oOB3s1A	CBp22Vfd78M4NgkRafEo	QNefNh8nB6OjhGAjgmv1	60	\N	2017-04-25 23:42:55.318	{}
pWqyhICSetD33B7MuwGH	YPGpbTqv9aeZHXxBNgIC	rLeakL8zAPimGnvBTUuH	815	\N	2017-04-25 15:16:35.281	{}
NqgCOzYRAWMBXxVsBgIR	/cFEfNMpFxRDc1+1PpSb	aGjYXwObyvnJVtLVGYCo	62	\N	2017-04-25 16:48:11.977	{}
7vDmvtdwqkc1Tzgy2QAx	Hjjd3Ns0lvG3cs9jj4N7	NHpdc/KZjW9u2yHp9hT+	295	\N	2017-04-26 01:42:39.907	{}
1KSh8cZ3T7YyaecOCReo	rc+ccdAK8F4ROpIC299B	gFACGkEeaEUSsxE5uNT2	680	\N	2017-04-26 22:38:15.174	{}
sLJ887kkeQ3mtsrbKwnW	ljr+mdhFYpVziaRs0plq	KFw81jBVeKzOHvQyZ+jX	914	\N	2017-04-24 19:20:56.302	{}
gm1snO8cd+GfbBrjzWyb	+2fxb2EecC80U2DcxPMF	rm64MZT9j+3qLxX5WAYR	24	\N	2017-04-25 00:14:53.922	{}
IwR7Uh/6RMRaQ4zWyWT3	TMTdMrgBYgxYoTLKWv35	xpf1Shnu1p1dKY93w3Rl	69	\N	2017-04-25 18:36:41.413	{}
AgTezsZYtmWc521+dGCV	ZNerBKfcGYvzcUKaYlqg	6mBCso8hB9II4KLPgmi9	457	\N	2017-04-24 10:39:36.211	{}
ZGdw6vqVe34UoaJzgW/p	ZNerBKfcGYvzcUKaYlqg	NzSnKMGSe1qFW+fFfrMI	834	\N	2017-04-24 13:12:53.274	{}
Fislm00k3IFHwhPwQmn0	sAxdggjzUR7+K6sSxnyU	VyiEGsnkNytK4YW7dF1c	612	\N	2017-04-26 18:26:13.754	{}
L8LqlogWB5+ErwAPsL4h	ZNerBKfcGYvzcUKaYlqg	FCR9FppSwAMOV+DllY4Y	319	\N	2017-04-25 13:48:30.612	{}
kl46q3oSJMn6e5FYqmF+	Mooca+XNOJQaJb6IILB6	qc3VP65iUopl/UIGI42i	606	\N	2017-04-24 19:27:24.15	{}
F8B14s7ULzXMeNJen3c8	rc+ccdAK8F4ROpIC299B	mkHADJK7ssgDeFTAlffW	789	\N	2017-04-24 22:02:41.796	{}
zpw+kOfvGVc7Tk5Ajhvs	y90eN2IFt6lwJmUaK9TF	Nt1n/jGh+g9CSFVeZFwt	625	\N	2017-04-24 01:18:49.164	{}
8IWxW4VuiDCagKQDPJMF	ZNerBKfcGYvzcUKaYlqg	f0qjb19SRn/DnfvT81V5	271	\N	2017-04-26 01:12:53.057	{}
hl8R4O8RtfUzPuKS8/TN	YPGpbTqv9aeZHXxBNgIC	Gdl0Z2TWZxlFoa5Hivrm	642	\N	2017-04-26 15:33:12.08	{}
IM8wlu8rSyBWeMY7flsv	budgvhf/oqc9FWtiR59c	gARnv45PiZksvoIJaTf3	545	\N	2017-04-26 16:54:34.474	{}
QDMt4eCRDqmzExbdUQAc	budgvhf/oqc9FWtiR59c	B0vIkryw2gzIwcN14/Yf	654	\N	2017-04-24 05:35:58.078	{}
qRes89lVHcK9ST/d18vX	SBdioRVUMTzSJjoTQ8iG	IY4k7bB5U+EkZ2Qn/2nU	341	\N	2017-04-25 21:05:36.537	{}
p5ZGnHBI+6VJiH3VAkiX	/cFEfNMpFxRDc1+1PpSb	TUwlpMuG00jsAIYle4VE	785	\N	2017-04-24 21:50:25.259	{}
pVc7FnQJxR0sgE24yXXR	CBp22Vfd78M4NgkRafEo	eBS4D67nfeXkGdYInKsS	610	\N	2017-04-25 00:00:54.777	{}
2UYySi/ozWo3KMnaqlb7	/cFEfNMpFxRDc1+1PpSb	RJZlYd9NeGndiasoJ042	926	\N	2017-04-25 15:23:04.718	{}
cowfUk9jZGzxo38SE1EM	budgvhf/oqc9FWtiR59c	r7re5G873EEj5mt21Uoe	964	\N	2017-04-26 00:03:52.071	{}
66n80Nypxd4ZDF7W1OjJ	ljr+mdhFYpVziaRs0plq	GdsuYQmmf+KF1Qk2zFVM	236	\N	2017-04-25 05:21:24.784	{}
40aGpsf1L2t15ZxfSxH0	CBp22Vfd78M4NgkRafEo	SOn/5UePJyI9tFyw0dY2	350	\N	2017-04-25 00:03:47.403	{}
qERF+iMWc4Zni/DvlgHs	XklfmXtmNz7WRzaFwJPY	rA2rJlfJpLkm2bdVGxHv	592	\N	2017-04-26 18:14:13.056	{}
A4xoScnSCsJi6F1Y/tUi	rc+ccdAK8F4ROpIC299B	tcah/OliB/nPR/KU/FFk	141	\N	2017-04-26 13:26:52.702	{}
BTLz0B2MDfq+WydSu4Cz	rc+ccdAK8F4ROpIC299B	rOMcnQ6NHOL6jLI4ksP5	341	\N	2017-04-26 05:33:38.341	{}
SI9ZNKglfYq/IA+z2bBP	Mooca+XNOJQaJb6IILB6	nHh8alY9hEQ6/jWDV3Eu	93	\N	2017-04-24 13:46:46.264	{}
CTttz4BEtRh7XHi3VJ7S	Mooca+XNOJQaJb6IILB6	Nhjw4XwI181eyg+T6Y/h	240	\N	2017-04-24 23:51:22.114	{}
LWT8as8uyjvanJzKS4xd	y90eN2IFt6lwJmUaK9TF	qSYZk+T+UUvdsPGqZKA6	365	\N	2017-04-26 13:12:07.426	{}
jKpvPijSXftRFMqa4cR6	CBp22Vfd78M4NgkRafEo	jDaJkPoABLYpc2XoZOSS	302	\N	2017-04-24 12:13:39.749	{}
FaLsWSqlBkGO4TFIWsPO	3KOaA2+6IjmFPfm4ChIJ	opiv+xPgg6MFq2FCVGFl	331	\N	2017-04-26 15:03:12.707	{}
CuqopwBVujva8niVY2e4	sAxdggjzUR7+K6sSxnyU	aKibXbmwRjGZbincWFUN	460	\N	2017-04-25 04:39:50.257	{}
2FKlmXzuVInhbl3mKIp3	Mooca+XNOJQaJb6IILB6	L0NxU05u7Ov2/KrzGZQM	1	\N	2017-04-25 08:14:14.27	{}
45CB0Jo05nZrqZIKKUWA	nbFMJA7w8Ms8VOsgI8Uj	Rlbp92RoIO9r8b7bHfgQ	872	\N	2017-04-24 10:05:38.834	{}
c87a6wxV2Y8FK2hKRjM4	SBdioRVUMTzSJjoTQ8iG	B8ymtG32dC230Zvp4RZf	747	\N	2017-04-25 02:14:45.646	{}
EboLFxVh0KwkbbhHnEqp	ZNerBKfcGYvzcUKaYlqg	j+4ifTxeztqIKOxhHoHA	348	\N	2017-04-25 00:37:39.073	{}
0ep9SG9koUmouS9Wttxs	/cFEfNMpFxRDc1+1PpSb	1VjkjAiDllfTffQV5Htp	513	\N	2017-04-24 06:26:29.305	{}
vyaAM14LNPM6KCLLKc2g	/cFEfNMpFxRDc1+1PpSb	Dl+3gibdyaFA9M5jcc3+	574	\N	2017-04-26 13:17:08.014	{}
kJMi0W3ic8oweGoWH6R0	TMTdMrgBYgxYoTLKWv35	MLqhPcFbAe8nEIC7jcTK	327	\N	2017-04-25 15:22:23.972	{}
F+M3ckBq81eY3LO1TDQN	3KOaA2+6IjmFPfm4ChIJ	kBmTBAtF04d018cSOd6V	133	\N	2017-04-26 08:52:42.532	{}
OPPLZncxPm4hqP6amUJS	3KOaA2+6IjmFPfm4ChIJ	V0OxKik9wty+9vcZIlj2	83	\N	2017-04-26 03:01:09.061	{}
uLizRMfKJ5wk0vzRLyHk	ljr+mdhFYpVziaRs0plq	HfCm4BtERVRsbDhb98UZ	782	\N	2017-04-24 13:22:31.94	{}
ksMSd3BKZer1/VVJSpPs	ljr+mdhFYpVziaRs0plq	rI/ioSq1692GF+II7QJT	866	\N	2017-04-26 16:38:34.603	{}
yxySx4481lDgOhQzNOvr	CBp22Vfd78M4NgkRafEo	Efn0ZXmQQHM2csE7lT2L	822	\N	2017-04-24 16:23:32.169	{}
88hZuGQ4oITYYXyMxwWr	0/Dg4ohpw1BIoLvDgRkh	le4JGLRYApAsSmKs48ld	428	\N	2017-04-25 13:19:16.865	{}
nKXBQBE1ggXosOCmZ2VN	budgvhf/oqc9FWtiR59c	KDKFvPfKSPlpKJxx1qVu	947	\N	2017-04-25 09:01:07.727	{}
Bs3vELuPBCoQjCGd1JDR	/cFEfNMpFxRDc1+1PpSb	iw1PYpVdDWJhaYFiUfmJ	255	\N	2017-04-25 01:29:36.978	{}
TU6ZyAuNOwHShLiTbqD6	ljr+mdhFYpVziaRs0plq	/yHf7kZgBtaeYkpRauVK	609	\N	2017-04-26 00:41:40.358	{}
kwJpmv1tag0MP8nEm75H	Mooca+XNOJQaJb6IILB6	JOlzZm4MXf39utdNmLLR	621	\N	2017-04-25 04:27:13.118	{}
07KqS16PBElbotHRE+e7	TMTdMrgBYgxYoTLKWv35	jk/pYGojXuQ+7VqwkITi	678	\N	2017-04-26 05:20:58.587	{}
FS3oPfTYYTcMZG3SjzDu	CBp22Vfd78M4NgkRafEo	rMyid2BKanhr6Ip04p4f	215	\N	2017-04-25 12:57:45.562	{}
EAZnNtKDjVentYd8pF5N	kMjFmLjttJpQS3rzutBf	zir3Xihafv6fFOgN+7oS	370	\N	2017-04-25 04:08:10.44	{}
cDSw4FwwL254QukEOeRz	sAxdggjzUR7+K6sSxnyU	TBfShKrtDSTpdWtjzaHX	686	\N	2017-04-26 20:54:06.149	{}
E2+/x8RvXyZs/AIA462C	/cFEfNMpFxRDc1+1PpSb	8y4BTF9k9ge6fZOBU/fX	400	\N	2017-04-26 20:09:04.583	{}
W3noUcmQ2Xp5x58OzBmZ	SBdioRVUMTzSJjoTQ8iG	ZQouLIe5ALw7muhqrXsW	201	\N	2017-04-24 01:09:10.684	{}
ldxyxlAMxepH0Udq0Q4r	/cFEfNMpFxRDc1+1PpSb	JXXjP3p9+2zvuRLVjrS1	712	\N	2017-04-25 06:46:00.664	{}
3/hrdy89h89qEojK2/7R	nbFMJA7w8Ms8VOsgI8Uj	fZABmEr1loM+9UGJHfjP	375	\N	2017-04-24 11:25:57.122	{}
KJeOY43n2JFVf7cEejvt	rc+ccdAK8F4ROpIC299B	MHV2N45I5170tCyqF8VH	2	\N	2017-04-24 20:59:29.283	{}
DfMZbqkV5Od8JzjaD4lT	sAxdggjzUR7+K6sSxnyU	CSjeSw4nrRJMO9QqYohD	449	\N	2017-04-26 10:09:56.037	{}
QvFvHjTfGv02PX5xyHeX	kMjFmLjttJpQS3rzutBf	7ra24sQu++1ZU3aE7eKC	166	\N	2017-04-25 15:03:56.053	{}
sB3xz25huMUHvVkxJfFr	3KOaA2+6IjmFPfm4ChIJ	QEY68y2xEetxgT7qP8tN	523	\N	2017-04-26 01:08:54.797	{}
G3FhLIWDVxWoQybr/EAN	budgvhf/oqc9FWtiR59c	ukZPrMn23AA30qryOIlR	86	\N	2017-04-26 22:35:57.22	{}
pRNb56gbzHSUE8piJTjP	/cFEfNMpFxRDc1+1PpSb	ONSFH3XJ408919tyRHQE	307	\N	2017-04-25 18:26:32.622	{}
q6j4cp0862/87bdYriEJ	0/Dg4ohpw1BIoLvDgRkh	zqw5IrJpj+TXw2e0kIrl	443	\N	2017-04-24 08:57:02.217	{}
7dmxLBimzR6MBf9EReBi	/cFEfNMpFxRDc1+1PpSb	ajaA6rWXZEk/UL7T/1FI	427	\N	2017-04-26 08:52:04.377	{}
9Dhi6hfOV1HDutDkTksr	TMTdMrgBYgxYoTLKWv35	ZE1MEIAaV5uvjhiv9rrj	331	\N	2017-04-24 07:53:04.69	{}
nW/VHjRbvxfPzXv4vGtR	y90eN2IFt6lwJmUaK9TF	NHpdc/KZjW9u2yHp9hT+	381	\N	2017-04-26 16:31:34.08	{}
yn676hamd78RQQhXJxFI	budgvhf/oqc9FWtiR59c	CssMNy8lEi+icRqGdWTJ	565	\N	2017-04-25 12:08:26.722	{}
S8/eH5TbrFXTqru6KkwH	ljr+mdhFYpVziaRs0plq	KFw81jBVeKzOHvQyZ+jX	997	\N	2017-04-25 08:01:20.008	{}
yyGspMFGOWiyx37e/0jN	+2fxb2EecC80U2DcxPMF	oeCoF79mWiQflANJb9bS	613	\N	2017-04-26 01:26:59.104	{}
LPli8IFdN8ojM7I9RC1g	+2fxb2EecC80U2DcxPMF	ouZZDeCDdH2/AqrDIz3K	756	\N	2017-04-25 10:03:31.613	{}
iXJiokRpVKCEaA79Nya6	budgvhf/oqc9FWtiR59c	NzSnKMGSe1qFW+fFfrMI	216	\N	2017-04-24 03:47:58.011	{}
P7HDttWgobPjqBekn7uj	nbFMJA7w8Ms8VOsgI8Uj	VyiEGsnkNytK4YW7dF1c	945	\N	2017-04-24 06:38:36.762	{}
uk/CkpybCPjLeHL/MGbe	budgvhf/oqc9FWtiR59c	FCR9FppSwAMOV+DllY4Y	702	\N	2017-04-26 19:55:54.926	{}
h6EAdSTgn805GEvGE7/p	SBdioRVUMTzSJjoTQ8iG	9et4NqcYlzqX3h6U2ote	635	\N	2017-04-26 00:00:48.306	{}
yoKTLjD/4kNlZ/7wtTPo	0/Dg4ohpw1BIoLvDgRkh	qc3VP65iUopl/UIGI42i	809	\N	2017-04-26 14:20:26.169	{}
M1Ol8JeLqexQ8aAO4blp	VErp5+HZdn3Yz2G88TZh	Nt1n/jGh+g9CSFVeZFwt	660	\N	2017-04-25 00:23:02.287	{}
5I4pPAfrWogUk/8I7POZ	CBp22Vfd78M4NgkRafEo	1K9NI6uOrHNs2V9QSz4K	16	\N	2017-04-25 01:56:03.802	{}
NXTo5VQzJmmD4ki01sZM	3KOaA2+6IjmFPfm4ChIJ	Gdl0Z2TWZxlFoa5Hivrm	223	\N	2017-04-25 06:26:59.502	{}
Zo29mRtai4R/+Yln3qH8	budgvhf/oqc9FWtiR59c	gARnv45PiZksvoIJaTf3	415	\N	2017-04-25 05:16:07.748	{}
FiI/xF8+5Bpiehjm3bh8	XklfmXtmNz7WRzaFwJPY	B0vIkryw2gzIwcN14/Yf	71	\N	2017-04-24 02:50:54.669	{}
SbfJqPVEfC6KQRXXUECk	0/Dg4ohpw1BIoLvDgRkh	WEnpWBr7Km73V19/xU6n	54	\N	2017-04-25 11:35:53.799	{}
8yULJzBC5tcjnc2/mi/s	SBdioRVUMTzSJjoTQ8iG	Pcw/1YKdUzzJGCF6I5wD	311	\N	2017-04-24 14:54:04.552	{}
8ExwU9xCISNnan4FXeNt	TMTdMrgBYgxYoTLKWv35	3wL1s1/Ku8HE5CgISX7O	931	\N	2017-04-24 04:04:36.152	{}
9uhEiyS6GLGii4Me5hb8	YPGpbTqv9aeZHXxBNgIC	VN4QUl4eYsOz7k7xlq0d	860	\N	2017-04-25 22:20:56.582	{}
a4I8N5jxumrCG/YEdhb8	XklfmXtmNz7WRzaFwJPY	9Lm4ehC9uq+z4PHZoPGl	517	\N	2017-04-26 05:55:05.442	{}
Zn1QuytZmX/RtYb8JBH+	0/Dg4ohpw1BIoLvDgRkh	iYlqVN7/0PCnWNeaT/nL	54	\N	2017-04-25 04:34:27.127	{}
3qNCLs0R/PQaIKTPlegI	ljr+mdhFYpVziaRs0plq	aPDGLrRUB4meVjgwSXMV	888	\N	2017-04-24 14:06:38.9	{}
DsWn/RZBJyYng+TJAHst	Mooca+XNOJQaJb6IILB6	tcah/OliB/nPR/KU/FFk	966	\N	2017-04-26 21:55:18.644	{}
mbXxfKFipwEpLZbhEkoA	CBp22Vfd78M4NgkRafEo	J78Y5U2YyfU9Kgw+3m3+	600	\N	2017-04-25 11:32:51.422	{}
D3gtzmW0Lr0ozS5R2bkA	+2fxb2EecC80U2DcxPMF	zj9zjQd2YzyS/PIoQzK/	342	\N	2017-04-26 09:45:31.571	{}
eYbsfYnBhnwjAEaEhTnw	ZNerBKfcGYvzcUKaYlqg	Nhjw4XwI181eyg+T6Y/h	498	\N	2017-04-26 11:53:45.924	{}
GV9HiZq0ofqW87OiJ4/n	Mooca+XNOJQaJb6IILB6	qSYZk+T+UUvdsPGqZKA6	10	\N	2017-04-26 08:51:20.969	{}
yrvT5VjRPa+RRSKxnVIO	rc+ccdAK8F4ROpIC299B	Wl5H14SxxtlMduGDei9P	511	\N	2017-04-24 07:39:44.077	{}
xhjyliEfKCsOy6J1ga3I	SBdioRVUMTzSJjoTQ8iG	opiv+xPgg6MFq2FCVGFl	122	\N	2017-04-24 18:58:34.137	{}
872n/H8xMSNaIPM/X4dc	XklfmXtmNz7WRzaFwJPY	aKibXbmwRjGZbincWFUN	358	\N	2017-04-25 05:17:55.371	{}
BKx0N8v5yebPDx3nDyvV	budgvhf/oqc9FWtiR59c	WpvXGk5wmK9jpS1xtxhy	304	\N	2017-04-24 03:07:48.579	{}
xSJqyBy1KrABS2/qPoso	rc+ccdAK8F4ROpIC299B	L0NxU05u7Ov2/KrzGZQM	408	\N	2017-04-24 14:37:42.057	{}
eRxtoWKJOEx8ZAVTekp9	rc+ccdAK8F4ROpIC299B	Rlbp92RoIO9r8b7bHfgQ	464	\N	2017-04-26 02:44:14.715	{}
VBefTCLRv2Pltr104uXo	TMTdMrgBYgxYoTLKWv35	im68qDXZnQxfTNTAb0cg	866	\N	2017-04-25 02:43:36.913	{}
sP8g+cJ9WFZ74jLWO6nY	Mooca+XNOJQaJb6IILB6	LB2cJljpW4d4pE2Ds0gg	879	\N	2017-04-26 23:25:43.528	{}
J0tqEesrWnfEydTv2fsQ	/cFEfNMpFxRDc1+1PpSb	1VjkjAiDllfTffQV5Htp	736	\N	2017-04-26 10:15:25.24	{}
ffJ5BYMp326zeMPHy9KQ	VErp5+HZdn3Yz2G88TZh	RCNHGWVzNUypSWbbMc4v	505	\N	2017-04-25 19:42:47.284	{}
wYT4pLQTKHlGKL7QT8xl	ZNerBKfcGYvzcUKaYlqg	3cmZYcR+hE74XsfWiNjU	55	\N	2017-04-24 06:45:32.602	{}
CD1Xp9ZBx+mOTouhn/Mj	rc+ccdAK8F4ROpIC299B	Wf6qGvpBstEZ8AqzSJaL	0	\N	2017-04-26 08:21:24.555	{}
MFQI0d4j30x3IrF0grol	YPGpbTqv9aeZHXxBNgIC	V0OxKik9wty+9vcZIlj2	171	\N	2017-04-24 21:57:27.258	{}
4HNPHIX8hOep08putKE+	ljr+mdhFYpVziaRs0plq	7fpAjnqgvgim9uOUCpOM	443	\N	2017-04-24 21:08:31.733	{}
Y8ZRRstSseJATFuX+5zP	XklfmXtmNz7WRzaFwJPY	3hkeSfHvHoeuiXEbbppA	65	\N	2017-04-26 15:13:47.893	{}
CCTl4XjdeXkzZj140072	ljr+mdhFYpVziaRs0plq	OUXekNWDkMDjn6VidOCj	328	\N	2017-04-25 15:08:42.388	{}
aaOv7Xic8a6+V/sLrP3C	YPGpbTqv9aeZHXxBNgIC	2z3DhxYYYpAcRZFMlLyY	851	\N	2017-04-26 11:06:28.058	{}
m6zB7ElOcgzaGOP7bd3a	y90eN2IFt6lwJmUaK9TF	s9oTfzBw7BNJ6uG2SjjU	60	\N	2017-04-24 21:40:38.807	{}
tZRZOYWgkXaMuFEpcO4S	Mooca+XNOJQaJb6IILB6	nX9Dl0ZeyLiXiKO7EYdE	680	\N	2017-04-25 19:42:49.624	{}
q7k3Ve0NcalOLshNujNU	ZNerBKfcGYvzcUKaYlqg	G4VGkYaV7birSYRbEZkt	695	\N	2017-04-24 10:44:22.623	{}
yhUe7vkwD3ToTa9JDjFd	sAxdggjzUR7+K6sSxnyU	LT+/mL3LeaKodL6O2fEj	70	\N	2017-04-24 14:05:41.865	{}
Mc49/RTwPkUyAvD8xEE3	CBp22Vfd78M4NgkRafEo	jk/pYGojXuQ+7VqwkITi	711	\N	2017-04-24 11:37:09.278	{}
LV5yMKvQWcjnODkXkKRV	nbFMJA7w8Ms8VOsgI8Uj	Il8B8/6HlXYzQkk7c4oi	135	\N	2017-04-26 19:22:37.452	{}
ogi2cJ3pYHWPiKdumow2	/cFEfNMpFxRDc1+1PpSb	SHGmDrxzSZN0bxGqjWrP	167	\N	2017-04-24 09:35:08.624	{}
XWJMgfw2eQd59x8gr5ha	SBdioRVUMTzSJjoTQ8iG	cdgMRFBTHjh2+YQA5K0C	976	\N	2017-04-26 20:42:29.865	{}
iN3IEeo3JTB0NJbR/2rd	0/Dg4ohpw1BIoLvDgRkh	cP6076ZyJg3Aw87bdi/S	776	\N	2017-04-24 11:52:18.175	{}
9oKJ8Q9jHPz1+p5KfoFx	y90eN2IFt6lwJmUaK9TF	++w2i4ZL0tNtE9yX1zRw	529	\N	2017-04-25 08:17:44.205	{}
f2e6tDbswQdJGA/f61Mn	sAxdggjzUR7+K6sSxnyU	JXXjP3p9+2zvuRLVjrS1	707	\N	2017-04-26 23:41:48.384	{}
nyQ5a9sr71HtTuaYveEx	CBp22Vfd78M4NgkRafEo	mFbNmViDpjR/kFfiC0mL	671	\N	2017-04-25 03:14:14.227	{}
hLUYisr1jLFBn2abqW/u	Hjjd3Ns0lvG3cs9jj4N7	CSjeSw4nrRJMO9QqYohD	859	\N	2017-04-25 21:22:03.435	{}
OxGArYprJJ+u1/bDunAS	XklfmXtmNz7WRzaFwJPY	7ra24sQu++1ZU3aE7eKC	502	\N	2017-04-25 11:23:49.222	{}
OywY9Nh4+ldwX4PfdJCy	Mooca+XNOJQaJb6IILB6	WoDRA+j+ATuPuDII3h0W	859	\N	2017-04-26 21:06:02.06	{}
+Jeh6DTRkyy+75Ny8uY3	Hjjd3Ns0lvG3cs9jj4N7	ukZPrMn23AA30qryOIlR	734	\N	2017-04-25 05:03:35.771	{}
sXxiLhRgJNRx1PwbaoTO	SBdioRVUMTzSJjoTQ8iG	MCFnBgsCJuoIGwB5BfNy	369	\N	2017-04-24 18:02:57.928	{}
olhqDYe+9Ww3y7HWASmg	Mooca+XNOJQaJb6IILB6	GzHTBQ++NW43kRFRZ5FD	912	\N	2017-04-26 17:44:52.662	{}
kLKRC6rhJ4nuCPkFqV+j	y90eN2IFt6lwJmUaK9TF	aGjYXwObyvnJVtLVGYCo	71	\N	2017-04-24 18:42:59.118	{}
CZKqkj1+Oz+nF4bI7h9B	budgvhf/oqc9FWtiR59c	3WjXm/DLIZX5tqBVnVxl	236	\N	2017-04-26 03:04:29.018	{}
rfGkjpcZtG2/TsruQ/PV	sAxdggjzUR7+K6sSxnyU	NHpdc/KZjW9u2yHp9hT+	968	\N	2017-04-26 16:29:12.131	{}
cXiHw3UmH0ubaPA2EvZO	SBdioRVUMTzSJjoTQ8iG	CssMNy8lEi+icRqGdWTJ	129	\N	2017-04-25 00:58:47.474	{}
S4HVsNUmlO+Ftx+MKkz8	Mooca+XNOJQaJb6IILB6	KFw81jBVeKzOHvQyZ+jX	797	\N	2017-04-24 19:17:27.07	{}
MswTDPaIW0ykYeDnvcry	+2fxb2EecC80U2DcxPMF	xpf1Shnu1p1dKY93w3Rl	140	\N	2017-04-25 06:49:47.098	{}
6CGZi/F7QX4TnhHl0x8z	3KOaA2+6IjmFPfm4ChIJ	lRXokT5Q5bNbg3sUf56u	818	\N	2017-04-26 16:14:50.311	{}
zdVfcjtTdqgGm6KiHtrI	rc+ccdAK8F4ROpIC299B	hvT2qrj67N55lyujGU5r	289	\N	2017-04-25 08:38:18.918	{}
xYVnkwsuwXIjCEebZOKS	Mooca+XNOJQaJb6IILB6	F0eUSMIjeOV7xXRhc8/V	780	\N	2017-04-25 19:45:18.573	{}
I2MM789EMTgAklPf0Th8	CBp22Vfd78M4NgkRafEo	9et4NqcYlzqX3h6U2ote	484	\N	2017-04-25 00:09:34.445	{}
0WZZZj2FS0grN15wLx4v	y90eN2IFt6lwJmUaK9TF	Ub/sXysP22nn+MDXBePE	119	\N	2017-04-25 08:02:34.897	{}
b7fmmFi4+HdFl2Qm7RAE	0/Dg4ohpw1BIoLvDgRkh	1K9NI6uOrHNs2V9QSz4K	251	\N	2017-04-26 07:20:57.759	{}
czsjkvt7Xps4ZtwwajTj	TMTdMrgBYgxYoTLKWv35	HGy5qKtixcrZTyVQk3lH	484	\N	2017-04-24 09:34:48.326	{}
0mcQvI68kQOiF/Vhc0u7	XklfmXtmNz7WRzaFwJPY	yM72CTeWPZWaxu/bymH/	44	\N	2017-04-24 00:37:54.645	{}
xhqbOsuqApatQfr2ELdq	rc+ccdAK8F4ROpIC299B	rx8uS+H3aAhi2J41Qbb4	217	\N	2017-04-26 06:39:23.336	{}
wYoxZAqA1qFBlWHM2b73	y90eN2IFt6lwJmUaK9TF	RNjg4BGiEg3yQri5yh54	374	\N	2017-04-26 14:22:10.294	{}
hFHa1Cmb06/+f+9Zix4j	nbFMJA7w8Ms8VOsgI8Uj	gARnv45PiZksvoIJaTf3	499	\N	2017-04-26 17:07:23.303	{}
huxYEQk2OkVCKCme0zHu	/cFEfNMpFxRDc1+1PpSb	B0vIkryw2gzIwcN14/Yf	649	\N	2017-04-26 23:37:56.307	{}
MBC2N+2rmsGGhvLWsijQ	SBdioRVUMTzSJjoTQ8iG	IY4k7bB5U+EkZ2Qn/2nU	60	\N	2017-04-24 08:39:41.73	{}
R0TfaUA8AfwC0kBsCMoT	SBdioRVUMTzSJjoTQ8iG	TUwlpMuG00jsAIYle4VE	756	\N	2017-04-25 18:39:51.23	{}
dPT1Gg4UhNnWj92nUG1k	Mooca+XNOJQaJb6IILB6	eBS4D67nfeXkGdYInKsS	518	\N	2017-04-26 10:53:21.521	{}
WQkuZctyhNenUu6LTb7C	YPGpbTqv9aeZHXxBNgIC	RJZlYd9NeGndiasoJ042	427	\N	2017-04-26 10:50:52.089	{}
rLjFCflZLsKB+bUUoHbf	/cFEfNMpFxRDc1+1PpSb	r7re5G873EEj5mt21Uoe	373	\N	2017-04-25 22:56:49.074	{}
1l7HJO8uU02CYc7lzCvO	TMTdMrgBYgxYoTLKWv35	iYlqVN7/0PCnWNeaT/nL	670	\N	2017-04-24 06:11:13.172	{}
BmJ26lNt/wQnM33C3rM7	ZNerBKfcGYvzcUKaYlqg	aPDGLrRUB4meVjgwSXMV	170	\N	2017-04-26 08:09:46.025	{}
G3RUuIn+TJ6W3svo4gYo	XklfmXtmNz7WRzaFwJPY	rA2rJlfJpLkm2bdVGxHv	675	\N	2017-04-24 12:58:19.946	{}
99ro3dX6s0WRFC9HkjgD	y90eN2IFt6lwJmUaK9TF	J78Y5U2YyfU9Kgw+3m3+	187	\N	2017-04-24 15:40:10.109	{}
SFUnWcC8nAKnPTOFje9V	ZNerBKfcGYvzcUKaYlqg	rOMcnQ6NHOL6jLI4ksP5	802	\N	2017-04-25 09:25:19.556	{}
236UlqOB5o4+6cd2TXXl	CBp22Vfd78M4NgkRafEo	nHh8alY9hEQ6/jWDV3Eu	613	\N	2017-04-25 17:00:44.785	{}
dOyI0aPtg470Q1lE7+Lo	budgvhf/oqc9FWtiR59c	4cepSjfZZjoPZ7XoBhHP	381	\N	2017-04-24 12:26:19.456	{}
mYIdqV3PMI7Fg93T4cVU	3KOaA2+6IjmFPfm4ChIJ	jDaJkPoABLYpc2XoZOSS	747	\N	2017-04-25 18:41:11.751	{}
K9n9Q6DsF5msiA/kHQQr	y90eN2IFt6lwJmUaK9TF	opiv+xPgg6MFq2FCVGFl	21	\N	2017-04-25 07:38:47.794	{}
V3eA7i8kclaYvqxJbuo8	Mooca+XNOJQaJb6IILB6	aKibXbmwRjGZbincWFUN	917	\N	2017-04-26 09:21:41.409	{}
OsDDIp/KEpgMNxhiBxAV	CBp22Vfd78M4NgkRafEo	qO2DCoUGcx4T46CYX3Hf	648	\N	2017-04-24 12:40:56.076	{}
WwodjkrAK1vi8dqAgcjy	Mooca+XNOJQaJb6IILB6	Rlbp92RoIO9r8b7bHfgQ	715	\N	2017-04-24 17:36:41.397	{}
QGOdU0hhAbQm8RV2gzvo	VErp5+HZdn3Yz2G88TZh	B8ymtG32dC230Zvp4RZf	417	\N	2017-04-24 08:19:37.368	{}
6q55t7qS/KnUex5g56g6	/cFEfNMpFxRDc1+1PpSb	27SKcp51d2jyQLc8ZWEQ	729	\N	2017-04-26 04:35:49.852	{}
IaJNM6D0WWC1/xPHO+kP	y90eN2IFt6lwJmUaK9TF	je4FHDnIgi7I+HF/Yeyq	706	\N	2017-04-25 16:13:56.953	{}
rD/LxL8J3mRp7M70iXBE	nbFMJA7w8Ms8VOsgI8Uj	RCNHGWVzNUypSWbbMc4v	10	\N	2017-04-25 01:40:14.796	{}
n1IVa8fzp/4Az+zAncHK	y90eN2IFt6lwJmUaK9TF	3cmZYcR+hE74XsfWiNjU	794	\N	2017-04-24 12:59:09.124	{}
lgJO0RIAGoxVIx6uDbwf	YPGpbTqv9aeZHXxBNgIC	Wf6qGvpBstEZ8AqzSJaL	257	\N	2017-04-26 18:50:05.822	{}
mcXI3Zek593mkhoyqAu5	sAxdggjzUR7+K6sSxnyU	HfCm4BtERVRsbDhb98UZ	770	\N	2017-04-26 18:11:23.405	{}
ZYyurWhVnBCbSNQ7f6Tc	nbFMJA7w8Ms8VOsgI8Uj	7fpAjnqgvgim9uOUCpOM	204	\N	2017-04-25 03:10:21.944	{}
nAHe8fnQTki9gg6o5+u+	ZNerBKfcGYvzcUKaYlqg	Efn0ZXmQQHM2csE7lT2L	340	\N	2017-04-24 00:56:17.201	{}
9fiIjD8vVHbddD6DNa7y	nbFMJA7w8Ms8VOsgI8Uj	OUXekNWDkMDjn6VidOCj	814	\N	2017-04-24 08:25:26.906	{}
S5vbiZf3/NJ3QFwXVNnR	rc+ccdAK8F4ROpIC299B	2z3DhxYYYpAcRZFMlLyY	13	\N	2017-04-25 03:30:49.594	{}
Lrtz+XPKQozsxxWEgTYn	/cFEfNMpFxRDc1+1PpSb	KDKFvPfKSPlpKJxx1qVu	43	\N	2017-04-25 18:08:52.731	{}
qg5B1xuurbs0p9+0gU6A	y90eN2IFt6lwJmUaK9TF	/yHf7kZgBtaeYkpRauVK	74	\N	2017-04-25 21:40:17.775	{}
7srZTVYFxWKvFnYKGXZ6	YPGpbTqv9aeZHXxBNgIC	oJwS+ChHV31ZxmnvRyLH	453	\N	2017-04-26 07:35:21.546	{}
8VVU6UoVpom4xl41scIK	+2fxb2EecC80U2DcxPMF	s9YxFFx66Y/JlQ6bdzym	644	\N	2017-04-25 19:24:57.187	{}
iciBKY6Zd23oO7Fj9uPu	SBdioRVUMTzSJjoTQ8iG	wA+nsnAmde7GMr9UqQN9	971	\N	2017-04-25 10:27:12.986	{}
9LrSbnaaTz1gvsnK1zeo	ljr+mdhFYpVziaRs0plq	SHGmDrxzSZN0bxGqjWrP	293	\N	2017-04-24 14:18:58.829	{}
+VGswIN5YjvriB7txgKN	CBp22Vfd78M4NgkRafEo	cdgMRFBTHjh2+YQA5K0C	542	\N	2017-04-26 21:36:30.737	{}
lsZlUyLQe8CsSJ2TMqlg	kMjFmLjttJpQS3rzutBf	cP6076ZyJg3Aw87bdi/S	768	\N	2017-04-25 14:38:21.014	{}
OQqNzwinZXyVwsr3k1NP	rc+ccdAK8F4ROpIC299B	++w2i4ZL0tNtE9yX1zRw	460	\N	2017-04-25 06:37:37.801	{}
sF0DvSNeBpuY2FzhsB2F	TMTdMrgBYgxYoTLKWv35	c+6qiAgPmJP66XA0Vf3S	929	\N	2017-04-26 06:17:10.963	{}
KMHRoVnN3AQXDAVzytC4	Hjjd3Ns0lvG3cs9jj4N7	fZABmEr1loM+9UGJHfjP	964	\N	2017-04-24 14:06:39.976	{}
RyRp3gxxAAEjTcvWYmLR	+2fxb2EecC80U2DcxPMF	MHV2N45I5170tCyqF8VH	514	\N	2017-04-24 22:10:15.289	{}
2DwqP3sFLZva2/phOHS3	budgvhf/oqc9FWtiR59c	CSjeSw4nrRJMO9QqYohD	593	\N	2017-04-24 17:47:41.32	{}
wlaQNrjROSefesyto/NK	YPGpbTqv9aeZHXxBNgIC	7ra24sQu++1ZU3aE7eKC	831	\N	2017-04-25 03:55:15.898	{}
TQnywFBe3+MfpmF6cBzJ	+2fxb2EecC80U2DcxPMF	QEY68y2xEetxgT7qP8tN	32	\N	2017-04-24 01:42:54.536	{}
55XbUP0mMejPNbS51AJk	CBp22Vfd78M4NgkRafEo	ukZPrMn23AA30qryOIlR	50	\N	2017-04-26 12:15:52.864	{}
Bkpx/Xpu1daTnt4JH0hL	rc+ccdAK8F4ROpIC299B	MCFnBgsCJuoIGwB5BfNy	91	\N	2017-04-24 08:07:29.704	{}
IQx2apFgh6LpXIVDmGmj	budgvhf/oqc9FWtiR59c	GzHTBQ++NW43kRFRZ5FD	228	\N	2017-04-25 00:30:23.261	{}
q6Pvbo764XUnAATyqcqp	sAxdggjzUR7+K6sSxnyU	aGjYXwObyvnJVtLVGYCo	500	\N	2017-04-25 23:00:09.197	{}
9qGfGblhfROmSJFvW1hN	YPGpbTqv9aeZHXxBNgIC	ZE1MEIAaV5uvjhiv9rrj	257	\N	2017-04-24 04:05:47.632	{}
oIGZ+WyfWECymaJDYSjE	ZNerBKfcGYvzcUKaYlqg	/aJCdRh0I4xfGr90oNhM	172	\N	2017-04-25 15:51:55.876	{}
4qZuKxKn29XGlEtVKK8G	sAxdggjzUR7+K6sSxnyU	+qvxrpY4NjzEfB1iABFA	745	\N	2017-04-26 04:42:14.045	{}
WIWzRdknbTkVLciNJ456	nbFMJA7w8Ms8VOsgI8Uj	S8u8+4NCKCaySJsQuKaZ	89	\N	2017-04-26 22:52:02.028	{}
Rg0A2K35VF+cGUy2f/BZ	YPGpbTqv9aeZHXxBNgIC	ouZZDeCDdH2/AqrDIz3K	429	\N	2017-04-26 05:15:39.23	{}
64eRZ8su7iehh3RrkiRU	rc+ccdAK8F4ROpIC299B	lRXokT5Q5bNbg3sUf56u	257	\N	2017-04-24 18:20:11.845	{}
+9nMCmQ+fJ1ctkrWZ3IU	SBdioRVUMTzSJjoTQ8iG	hvT2qrj67N55lyujGU5r	683	\N	2017-04-24 09:23:24.698	{}
60BBf+ND4CSq9F6KQhFu	CBp22Vfd78M4NgkRafEo	FCR9FppSwAMOV+DllY4Y	130	\N	2017-04-26 16:08:15.812	{}
dswnDRHd9p8Lw+/FxGeu	3KOaA2+6IjmFPfm4ChIJ	qc3VP65iUopl/UIGI42i	781	\N	2017-04-24 17:43:31.506	{}
QBL5kK/gfdWzB02Msxo8	/cFEfNMpFxRDc1+1PpSb	qc3VP65iUopl/UIGI42i	286	\N	2017-04-26 15:55:04.956	{}
mCSNu6zJHsiPUbxqYHWJ	/cFEfNMpFxRDc1+1PpSb	Nt1n/jGh+g9CSFVeZFwt	694	\N	2017-04-24 04:14:48.505	{}
2CE5gaxVGmGQd77YW06+	budgvhf/oqc9FWtiR59c	f0qjb19SRn/DnfvT81V5	361	\N	2017-04-26 13:44:47.771	{}
IZByK5NJvHyl+YsuoVDx	SBdioRVUMTzSJjoTQ8iG	yM72CTeWPZWaxu/bymH/	652	\N	2017-04-24 04:31:05.18	{}
zVbG96Rw4t1HLMB2dw6R	rc+ccdAK8F4ROpIC299B	K8jnojebJRcDY56cIbvD	281	\N	2017-04-26 22:45:12.649	{}
WdMRWo1kvOw78DOK0kc4	Hjjd3Ns0lvG3cs9jj4N7	smn3EXH1b3UgW30PEXIS	501	\N	2017-04-25 06:33:28.864	{}
pyh2UyZ0x5oOvgu776E6	XklfmXtmNz7WRzaFwJPY	f0qjb19SRn/DnfvT81V5	901	\N	2017-04-26 05:38:03.115	{}
yx2WnItnKTmlrSJkOn+W	SBdioRVUMTzSJjoTQ8iG	KcxbhjqNxwK3sDm7fNDD	927	\N	2017-04-26 12:23:49.117	{}
PrrmuqJN6ZT6XY8wuykQ	budgvhf/oqc9FWtiR59c	rx8uS+H3aAhi2J41Qbb4	846	\N	2017-04-24 05:02:31.885	{}
prZfgCN1dbQsT7kyEKHi	kMjFmLjttJpQS3rzutBf	MJ0LwHcCTowW4jJbBAfF	978	\N	2017-04-25 12:20:34.878	{}
lwwEsYAwSRn+J1aH9THY	nbFMJA7w8Ms8VOsgI8Uj	Ww+SwPycvd0cdKnIAHGW	905	\N	2017-04-26 21:24:23.698	{}
wGvOwAJfzN7iqewHNQN1	sAxdggjzUR7+K6sSxnyU	4vF7okM8tNQczNYSx9QH	972	\N	2017-04-26 22:39:04.557	{}
IH0kgWaOL9LhS9JZVgW7	XklfmXtmNz7WRzaFwJPY	oqH7I/342a8ecO0ty6fR	730	\N	2017-04-26 14:35:06.037	{}
anNdZYr3I3mDOVHJgjQH	sAxdggjzUR7+K6sSxnyU	VBHlcHQF4aYRjQ1CCYo+	437	\N	2017-04-26 19:53:08.27	{}
5Gl2S93GywRjwYFDUTyM	SBdioRVUMTzSJjoTQ8iG	8mZiabWksAbmv9Y7hZNh	20	\N	2017-04-24 11:46:55.512	{}
jCvjv7V8yIg5hPYoafwk	CBp22Vfd78M4NgkRafEo	FslrTC6TqYUZ1P11q9Or	716	\N	2017-04-25 05:49:35.512	{}
9boOwh9HvxsAVxJG4IWo	+2fxb2EecC80U2DcxPMF	clfMGedLL8JpM3dWFCNq	362	\N	2017-04-24 13:37:46.426	{}
S63WwGMd4oflktVUPhNG	SBdioRVUMTzSJjoTQ8iG	ReAH5yJ/ylOvxgZ+wV0+	284	\N	2017-04-24 05:06:20.614	{}
zOQCMwsdpYWxny5wPUWe	+2fxb2EecC80U2DcxPMF	6L/5GjyMuNKl9DMghK9+	890	\N	2017-04-24 03:42:30.61	{}
LQbOu/abp8HBRy/uJQSo	sAxdggjzUR7+K6sSxnyU	0NSoTy+0pfuOXb8lFv4E	755	\N	2017-04-25 01:57:04.492	{}
RcaIlxgmfTylWdbBqEtn	CBp22Vfd78M4NgkRafEo	fdzah3/A9olQ1GKFPVue	447	\N	2017-04-26 01:56:39.615	{}
uYpDoXMuSpZUVRI0o36g	ZNerBKfcGYvzcUKaYlqg	fgitB1bKB2fA2EOY/0oz	120	\N	2017-04-26 20:48:47.376	{}
BQ+TDMqgD90VE3R2cXZg	0/Dg4ohpw1BIoLvDgRkh	KDJhMSnr1eiypx8bJOQY	525	\N	2017-04-26 20:24:43.335	{}
RFu3M1MR0kacskgGt+Qr	kMjFmLjttJpQS3rzutBf	wcBZD3vVwQN69RQpQ4Wn	522	\N	2017-04-26 23:01:42.124	{}
xexUnP4CNmzWsOwU1ynJ	YPGpbTqv9aeZHXxBNgIC	UI2CoZVy16uWrilGL82b	333	\N	2017-04-25 23:10:30.333	{}
/fSGp/gUmmX7KnQVAFXL	/cFEfNMpFxRDc1+1PpSb	5YiOCCzoJ2mJo02p1kvu	52	\N	2017-04-26 17:34:30.25	{}
tiIwNPn2qH9ucjbqqiD1	sAxdggjzUR7+K6sSxnyU	teHOEl79foxJD3bAW7yN	455	\N	2017-04-25 22:33:26.282	{}
tGC+fb0USYpbQx9jl2HX	rc+ccdAK8F4ROpIC299B	4T2/FEU1rk9EBkOM4WS/	186	\N	2017-04-26 05:17:33.923	{}
1coUQpZ2u+lX5PgciqYB	3KOaA2+6IjmFPfm4ChIJ	wtnJ2wRu5rcRYbEJ6Nc/	156	\N	2017-04-24 10:36:25.245	{}
0Wmy9mrJRpLnUwpxPgaD	Hjjd3Ns0lvG3cs9jj4N7	/HbDAxDTaPCsDW/pnuVS	522	\N	2017-04-24 23:18:39.231	{}
Qi2yZulkrDUJGlbbMCUp	nbFMJA7w8Ms8VOsgI8Uj	6c7CxJwbLV7ynVGRTVbJ	351	\N	2017-04-24 07:21:33.479	{}
1PWC/ohDc2H5gWss99Ij	TMTdMrgBYgxYoTLKWv35	kGFlLfdoEcyBGmUjYl2B	982	\N	2017-04-26 00:28:20.887	{}
yZNODBpoIrkg98BHx1GR	YPGpbTqv9aeZHXxBNgIC	ws7Gu4Z4ogyANRcR/Pqu	361	\N	2017-04-26 07:27:33.301	{}
TMtBoSlaV5uNsIvj+iX5	SBdioRVUMTzSJjoTQ8iG	j8wpHa1dz9/2R58FIjas	120	\N	2017-04-24 20:18:10.567	{}
bxhTbO0j2WgH9r1/U2J5	+2fxb2EecC80U2DcxPMF	YQzTnDdAtc6eW+V5kNlM	491	\N	2017-04-25 15:18:38.919	{}
r4u+7IZTgQXyFp7ztxBg	budgvhf/oqc9FWtiR59c	g3E7JHmvJBhrStjDU6Kg	504	\N	2017-04-24 13:22:32.252	{}
BwBnbiDnmQOvXgrYpLx4	budgvhf/oqc9FWtiR59c	uPo+ls/nuLTv/aiymjpc	890	\N	2017-04-26 20:42:20.444	{}
+jsBP+8tq55x8uCWFRfS	ljr+mdhFYpVziaRs0plq	YLN08iEuZj4o5R4ynFgJ	259	\N	2017-04-24 20:16:01.957	{}
oHlTk3YH3cTYesaBfANP	CBp22Vfd78M4NgkRafEo	QE5m3KxzvLHfaC1d2pOH	5	\N	2017-04-24 07:14:48.785	{}
SN1QzRhPCjbzxd4pxV9/	budgvhf/oqc9FWtiR59c	xFpV4IKIb2U1avAPgBEw	106	\N	2017-04-24 17:21:35.394	{}
SETIBUc9CJjV/t0EcD9r	/cFEfNMpFxRDc1+1PpSb	/C0qISaxJZxIMn5rVJKD	577	\N	2017-04-24 11:21:09.131	{}
DQxh91JHBdcZEYGSKFQY	budgvhf/oqc9FWtiR59c	GCLUq70/kcl8o7wTECso	426	\N	2017-04-25 04:10:26.047	{}
Dia08xcAhdLc2LhDhquY	0/Dg4ohpw1BIoLvDgRkh	mYExKKMHZR3kXvZZY8Cm	376	\N	2017-04-24 06:41:38.648	{}
LbD3G0HogysW4FFKvcpK	3KOaA2+6IjmFPfm4ChIJ	VYU0Y6j2zI5AaOt4+lbk	111	\N	2017-04-26 19:51:51.161	{}
rkfR3k2TJRm7ykk9AKja	sAxdggjzUR7+K6sSxnyU	Rb+4vnuEzJHMz4oK5SlP	75	\N	2017-04-26 14:23:36.528	{}
uhsrlgp3tNhVSUmmMx5i	nbFMJA7w8Ms8VOsgI8Uj	pUZS6bfzCplu36OTqd9B	924	\N	2017-04-24 05:54:55.91	{}
xabBPJpgGvfcZwcFAGhD	VErp5+HZdn3Yz2G88TZh	idh9OQ6SIbE99dmoxoyD	472	\N	2017-04-25 05:16:15	{}
TyX7L9AFPEsXVpgebpjO	VErp5+HZdn3Yz2G88TZh	1qE101biu++LikStH2No	186	\N	2017-04-24 04:16:28.969	{}
rcPZhr4ZmnW6gZA9SK0V	sAxdggjzUR7+K6sSxnyU	clX6Pr6Dseqcg6rG6R+p	706	\N	2017-04-26 23:34:53.851	{}
bRAY1H9hpZak4V6F3iQE	SBdioRVUMTzSJjoTQ8iG	SUG1SDEbNmeTtzMYgIiy	635	\N	2017-04-25 06:05:28.652	{}
hA1jeHIMolY4+fhSMAkW	VErp5+HZdn3Yz2G88TZh	WL8anNOZoBM6m6mQAXZU	772	\N	2017-04-25 11:11:25.297	{}
qXSWLRkRdn09jui0QxRB	YPGpbTqv9aeZHXxBNgIC	ymsMzngU1IQvcDZCCQto	279	\N	2017-04-26 05:32:35.275	{}
DKhKqoQRCnXgC81kVl7U	kMjFmLjttJpQS3rzutBf	vAJ8Et17IvumOjMTusA1	291	\N	2017-04-26 08:34:05.063	{}
rml+DbJjfz7lhB65lail	0/Dg4ohpw1BIoLvDgRkh	KlH3+Uce7khqB0/Nmq1W	716	\N	2017-04-25 15:18:15.385	{}
iOxp5U2ZU3PnOPx7ECFl	VErp5+HZdn3Yz2G88TZh	a50pTP8E49XAQh5LJUUl	402	\N	2017-04-26 14:37:19.238	{}
JIlsKq7J/N46zGVrYiji	Mooca+XNOJQaJb6IILB6	D5HmQl9D2u9DEcoKhcuR	723	\N	2017-04-26 12:57:06.3	{}
ruGqo1YvfMY0mCEtByqK	sAxdggjzUR7+K6sSxnyU	TRfmmjCxHNcRKi0Gh+NJ	672	\N	2017-04-25 01:31:59.455	{}
ucA586R9+4hmaUaa/4KJ	Mooca+XNOJQaJb6IILB6	Gu4LTbW72m9jLkrtyTKP	103	\N	2017-04-26 21:17:07.92	{}
yob82uQtzbfzeIp7VZEq	ljr+mdhFYpVziaRs0plq	2CdS4rjMjTjxvr5jDXk+	717	\N	2017-04-24 08:34:00.79	{}
iRwRWRPtcSvLFJ5Okvwf	0/Dg4ohpw1BIoLvDgRkh	zeNYSwQcreNIDwDi1Wxd	812	\N	2017-04-24 16:05:22.162	{}
J1biS3NASb3pFxhWK61v	TMTdMrgBYgxYoTLKWv35	bLFa4S8BjWZFHzr/ii8E	164	\N	2017-04-25 09:00:14.609	{}
kFKd0gIsMrIX6ONF5tm7	TMTdMrgBYgxYoTLKWv35	Xwipggg/xJTsdjMuMOjI	10	\N	2017-04-26 05:33:15.77	{}
7dL4QpILy6/cSzZlDSG+	XklfmXtmNz7WRzaFwJPY	Xg63oCrDld8T7hrSPaIr	659	\N	2017-04-26 02:49:26.224	{}
9q9vUStzjkWIBskx8rFr	CBp22Vfd78M4NgkRafEo	+MwnavUgUpUHkc8af6R5	852	\N	2017-04-26 09:55:49.813	{}
ZlApAduUbZaqIEZ5Opzd	CBp22Vfd78M4NgkRafEo	NDb6Ri8u0F51nSUlE6H0	85	\N	2017-04-24 21:39:49.212	{}
a/wi5IC/HeWBIc8pQPCL	YPGpbTqv9aeZHXxBNgIC	xqV2Sb04tBodIPV9twXY	722	\N	2017-04-26 16:16:24.821	{}
h0D3gsCM60zC6A+VXo9p	y90eN2IFt6lwJmUaK9TF	Ce3gHT/m1USeJFR0EeyX	200	\N	2017-04-24 05:19:31.428	{}
irg8OzmlOzRvwWh0FowE	ljr+mdhFYpVziaRs0plq	JNCUf59fexGE2RtFdeFl	784	\N	2017-04-25 19:26:48.167	{}
q+QmXZu9AZpJc7ohIAH/	kMjFmLjttJpQS3rzutBf	0kdDzr3LnJry8zC1cU1W	534	\N	2017-04-24 20:21:54.214	{}
0jQAobUMLEk4tf/OilZQ	XklfmXtmNz7WRzaFwJPY	1nN3SsIefEwI4KPJp0/i	318	\N	2017-04-26 07:21:30.799	{}
vIg9uGR65h8RQy/x6guJ	Hjjd3Ns0lvG3cs9jj4N7	HjTXXwBTFx8XPyM1k1jt	21	\N	2017-04-25 22:53:36.557	{}
ZZzZcMuSWCz9BLV9C/g+	ZNerBKfcGYvzcUKaYlqg	jz5nWB/ep4b/Gbk8fezU	276	\N	2017-04-24 19:16:15.329	{}
xSewgsPTXMTfWxHqEUgG	3KOaA2+6IjmFPfm4ChIJ	huJP+RuKzkZlJ9OKL2tF	656	\N	2017-04-24 00:56:44.498	{}
EOOZRLS4tWi/uWkGy0FH	3KOaA2+6IjmFPfm4ChIJ	K8jnojebJRcDY56cIbvD	308	\N	2017-04-24 10:25:48.646	{}
V4Xz3fSFweEQhEDNL4ZN	SBdioRVUMTzSJjoTQ8iG	smn3EXH1b3UgW30PEXIS	539	\N	2017-04-26 13:46:14.737	{}
GmZgixM5KdQIOJED034k	+2fxb2EecC80U2DcxPMF	Ww+SwPycvd0cdKnIAHGW	726	\N	2017-04-26 00:21:08.424	{}
DsiyuoUHfo/g9eGd5WpG	rc+ccdAK8F4ROpIC299B	hzeqvgFyWhnRWTclKHqy	672	\N	2017-04-25 10:37:26.776	{}
lPQc1bT8sCRKotXEISWJ	VErp5+HZdn3Yz2G88TZh	Hnc6d1cgHlwRPkHJzm+L	71	\N	2017-04-26 13:58:11.775	{}
92Twq62mVi5qa+19qjid	VErp5+HZdn3Yz2G88TZh	VBHlcHQF4aYRjQ1CCYo+	65	\N	2017-04-24 07:51:57.512	{}
5GSSUTf+ZsUd8XER6U+W	+2fxb2EecC80U2DcxPMF	eoTUy32lA5l+k2+QZfQQ	883	\N	2017-04-25 00:30:03.679	{}
3xplDBKPuNkPwfCshuK/	SBdioRVUMTzSJjoTQ8iG	uCzXZ/h+0lceva5eoAFl	910	\N	2017-04-26 22:23:27.158	{}
yR49OdBApQgCJ1oJSJXp	ZNerBKfcGYvzcUKaYlqg	eQYdo0lwWg/0maBPX6Ky	669	\N	2017-04-25 19:32:46.59	{}
TUzDNqpfERuxkWngZJ/d	rc+ccdAK8F4ROpIC299B	ReAH5yJ/ylOvxgZ+wV0+	457	\N	2017-04-24 04:20:45.196	{}
Ky/l7cVCSsik8WvaDk/L	sAxdggjzUR7+K6sSxnyU	6L/5GjyMuNKl9DMghK9+	321	\N	2017-04-24 07:25:02.333	{}
iLK6rVguzv4OoQSaLlM/	ljr+mdhFYpVziaRs0plq	0NSoTy+0pfuOXb8lFv4E	136	\N	2017-04-24 10:35:23.426	{}
rolcgyePTZ9U1hiSWlF3	XklfmXtmNz7WRzaFwJPY	IZC4iG5HH0RGGiQcOMb5	968	\N	2017-04-26 13:15:18.704	{}
v5QyYXuqSqCGAQnHmGXn	nbFMJA7w8Ms8VOsgI8Uj	fgitB1bKB2fA2EOY/0oz	20	\N	2017-04-26 17:38:22.496	{}
6VvTJt2LNHJWETgXZpjw	ljr+mdhFYpVziaRs0plq	o+xN3I/a5Hv0i7ik4bDY	723	\N	2017-04-26 17:44:00.826	{}
CX8/aTYNlL08n06iQ2q8	3KOaA2+6IjmFPfm4ChIJ	8M+uHwKEP9zUbXSEbjrM	203	\N	2017-04-26 15:30:04.073	{}
VQKAfEm5MbKTMvYHdrxx	ZNerBKfcGYvzcUKaYlqg	A7uTJsWcGv90N9jqq2aX	683	\N	2017-04-24 06:24:29.494	{}
vt6qvvadmqHGdvtCngiJ	Mooca+XNOJQaJb6IILB6	5YiOCCzoJ2mJo02p1kvu	797	\N	2017-04-25 15:01:50.172	{}
rS9M2APRyUpoDrJkE2sJ	YPGpbTqv9aeZHXxBNgIC	wwzNXoLPLuKAWezxNBlD	132	\N	2017-04-24 00:37:46.428	{}
8Toe4omRUqyQDaQLFZ1i	SBdioRVUMTzSJjoTQ8iG	4T2/FEU1rk9EBkOM4WS/	547	\N	2017-04-26 09:17:30.549	{}
BWzIp9eesq4cWcXhM8fL	SBdioRVUMTzSJjoTQ8iG	wtnJ2wRu5rcRYbEJ6Nc/	330	\N	2017-04-25 05:15:03.978	{}
k3IARvb0QYsTSuJGjhYE	SBdioRVUMTzSJjoTQ8iG	/HbDAxDTaPCsDW/pnuVS	534	\N	2017-04-26 15:02:07.695	{}
UZPUQRjOEevwjBCaJ0ga	Hjjd3Ns0lvG3cs9jj4N7	kGFlLfdoEcyBGmUjYl2B	142	\N	2017-04-25 06:48:41.945	{}
p8Ssr1cSzKjIDZXuGlva	nbFMJA7w8Ms8VOsgI8Uj	ws7Gu4Z4ogyANRcR/Pqu	706	\N	2017-04-26 22:39:10.566	{}
cPezoEfJFcEkSBUJBHze	Hjjd3Ns0lvG3cs9jj4N7	j8wpHa1dz9/2R58FIjas	563	\N	2017-04-25 17:40:18.052	{}
RX/Gzoe96IKoT+f+/Jf9	sAxdggjzUR7+K6sSxnyU	QER/vEICwOqelKRmFewa	352	\N	2017-04-24 13:54:35.686	{}
OFDtLQzpxxhotQz9UXKq	VErp5+HZdn3Yz2G88TZh	pSCawuMEdLKVs1vFuSzb	667	\N	2017-04-24 11:21:16.189	{}
GxfI7t5kgAXf9ohTodj7	CBp22Vfd78M4NgkRafEo	KRQ4GarJX8r+Hr0vT+QP	101	\N	2017-04-26 00:24:30.938	{}
R6ybe0eH8hfyu403KYh2	ZNerBKfcGYvzcUKaYlqg	uPEFdvhuU7uBHnFA1i5Z	142	\N	2017-04-24 14:43:41.101	{}
wc5LXzdtGlPlxxPychp/	SBdioRVUMTzSJjoTQ8iG	ZlZ60XqY2/jvcKbxaFU8	514	\N	2017-04-25 20:06:23.463	{}
k6XPpx1lnTOXRqMlofHI	ljr+mdhFYpVziaRs0plq	/C0qISaxJZxIMn5rVJKD	802	\N	2017-04-25 22:04:59.724	{}
+TV7PWuOtg7pZUJQu6NU	0/Dg4ohpw1BIoLvDgRkh	C2xfD52JW39BNy7L51R8	510	\N	2017-04-25 23:34:55.431	{}
J+QHqpLNfESXSJEQw1f0	y90eN2IFt6lwJmUaK9TF	pzqaHQvqee/g0B3pNj46	834	\N	2017-04-24 19:10:20.13	{}
08YNFlvrxQlP/AQ7HKSB	Hjjd3Ns0lvG3cs9jj4N7	fsjDaeRHhimkDROH0uSo	1	\N	2017-04-26 22:53:22.003	{}
uYtNCni1s6deG0SbRHhc	SBdioRVUMTzSJjoTQ8iG	Rb+4vnuEzJHMz4oK5SlP	654	\N	2017-04-24 04:42:53.544	{}
xB9azM5I5F3ygUvRVc96	VErp5+HZdn3Yz2G88TZh	WRHsfc/gnVgXyDsEdIOn	325	\N	2017-04-25 09:49:40.08	{}
Jb9VDQJ4InkFkqx6djZc	/cFEfNMpFxRDc1+1PpSb	V2J9ZI7uUSGISvPAjYfO	964	\N	2017-04-25 22:28:34.867	{}
Xl70F8x9m97Fqf4NS+cQ	VErp5+HZdn3Yz2G88TZh	ONpyMpB5ZczG/tqTb0qH	967	\N	2017-04-24 18:53:33.288	{}
tBJfZvxcq4nSgeZq4z1B	sAxdggjzUR7+K6sSxnyU	gerwFbOK7rj2/sxav7TM	538	\N	2017-04-24 02:19:41.22	{}
qfFS78Xvv/eA/USycNRc	0/Dg4ohpw1BIoLvDgRkh	hqQHXHKP5BkW4sO5RoSV	767	\N	2017-04-24 06:15:51.17	{}
zY4Vh4++cYh4o3WTiT0B	ZNerBKfcGYvzcUKaYlqg	WL8anNOZoBM6m6mQAXZU	696	\N	2017-04-25 02:31:38.276	{}
fYUb6hvscdnr+sVOSopj	0/Dg4ohpw1BIoLvDgRkh	sp639f+5Nq2drx50ElyL	477	\N	2017-04-24 04:37:17.779	{}
HNA0NfkpUaddB7jM5wgb	ljr+mdhFYpVziaRs0plq	NVXJ778lSXzucIhJdTQn	654	\N	2017-04-24 11:19:16.346	{}
hWsdMgOgGV2pKYm0yINL	nbFMJA7w8Ms8VOsgI8Uj	2Zd5j1kN3amM0c+EavdD	148	\N	2017-04-24 16:47:21.03	{}
I3ckAna1ePkGW0D+4rE1	nbFMJA7w8Ms8VOsgI8Uj	KlH3+Uce7khqB0/Nmq1W	652	\N	2017-04-26 23:07:08.076	{}
DOCTiMMLNhhoeCIhTtIW	Mooca+XNOJQaJb6IILB6	BdY4jNLot5Qg/el9YDzg	42	\N	2017-04-26 18:33:22.038	{}
d0zx1RNd9nGXqrOcExyt	+2fxb2EecC80U2DcxPMF	D5HmQl9D2u9DEcoKhcuR	776	\N	2017-04-25 10:11:20.25	{}
QeyxFN3KUyZjLsqJLWMQ	VErp5+HZdn3Yz2G88TZh	dj0yIOOu3Cc4exMrvCvr	360	\N	2017-04-26 04:02:08.196	{}
Kmam+R6yS68txJvD/1Rc	Hjjd3Ns0lvG3cs9jj4N7	/8bydnemsbZ6PIE9HaAf	62	\N	2017-04-25 22:12:54.108	{}
42wDRSwkyX+r6ALCYoHD	SBdioRVUMTzSJjoTQ8iG	Gu4LTbW72m9jLkrtyTKP	937	\N	2017-04-25 18:13:43.482	{}
6eAysucKzkCY6BSPhUP0	CBp22Vfd78M4NgkRafEo	2CdS4rjMjTjxvr5jDXk+	260	\N	2017-04-24 05:59:03.581	{}
418aRkkDbESRmkC+ij8a	y90eN2IFt6lwJmUaK9TF	WJZehi9wbya5WdtJ6jmi	984	\N	2017-04-24 23:15:12.898	{}
L4jbaQv52lEqb2uXAUIm	Hjjd3Ns0lvG3cs9jj4N7	yqs2NjrEc5urGA2MDjCW	422	\N	2017-04-25 23:12:40.346	{}
mBAAFxp4nA5QTL3zYMNs	nbFMJA7w8Ms8VOsgI8Uj	nb4xmYvuBqr33jCsuFiF	0	\N	2017-04-25 14:17:08.089	{}
uht0dkm1DJfLXz2gwFwK	budgvhf/oqc9FWtiR59c	e75r6knrluXB5FEMmWvj	10	\N	2017-04-25 03:55:19.337	{}
rXNaOAH87HTajDZ0h/FF	TMTdMrgBYgxYoTLKWv35	Py7ahqrY/1JieQPbPKHJ	319	\N	2017-04-25 07:22:00.233	{}
8FDdXcBg2To7YwBrvmV0	rc+ccdAK8F4ROpIC299B	pW/6IftIOg2Yxz/0lIqn	856	\N	2017-04-26 02:38:28.156	{}
iMrlku9LPSHTiyFsaPsL	kMjFmLjttJpQS3rzutBf	PULCBb6TKbdhkz3E++On	674	\N	2017-04-26 00:31:38.174	{}
58w/wDxp+DFB6vKIGE6h	kMjFmLjttJpQS3rzutBf	nC2CV6ncpAx1FtfkAR4c	740	\N	2017-04-24 10:55:09.627	{}
z3VyZeOwzKB1cNHHlinA	3KOaA2+6IjmFPfm4ChIJ	sjjZCufqioecHEPOpKIP	640	\N	2017-04-25 22:22:38.326	{}
f8TEvXCtfXjksaiFNk4h	YPGpbTqv9aeZHXxBNgIC	FNAtzuIkfq9ApkrdeNFM	880	\N	2017-04-24 09:45:35.39	{}
ibGN/GezgXhusXQyTTXa	kMjFmLjttJpQS3rzutBf	FNAtzuIkfq9ApkrdeNFM	293	\N	2017-04-24 02:02:35.802	{}
RfnTai5x5HPjbYBTasRH	TMTdMrgBYgxYoTLKWv35	0RaytChooMqyxUOYZn39	691	\N	2017-04-26 14:23:59.433	{}
cJHibq/XatV/fWOXn6+b	SBdioRVUMTzSJjoTQ8iG	KcxbhjqNxwK3sDm7fNDD	788	\N	2017-04-26 06:29:13.368	{}
2w+lnLHrSPd47Xiixd9i	Hjjd3Ns0lvG3cs9jj4N7	huJP+RuKzkZlJ9OKL2tF	837	\N	2017-04-25 23:33:15.759	{}
jU5DPmWxJ9iznTUHrPQo	XklfmXtmNz7WRzaFwJPY	rx8uS+H3aAhi2J41Qbb4	310	\N	2017-04-25 20:10:53.126	{}
ZoDcNiy5PHQfuPUCxeim	Mooca+XNOJQaJb6IILB6	MJ0LwHcCTowW4jJbBAfF	1	\N	2017-04-25 20:46:25.34	{}
+sEHDNof7aWWC8EoBxv4	Mooca+XNOJQaJb6IILB6	Ww+SwPycvd0cdKnIAHGW	836	\N	2017-04-26 01:17:15.193	{}
orUaG0j9dmM9gP6VPwts	Hjjd3Ns0lvG3cs9jj4N7	4vF7okM8tNQczNYSx9QH	56	\N	2017-04-25 04:24:49.889	{}
rJiThynoNC4mUj0tVM5D	SBdioRVUMTzSJjoTQ8iG	Hnc6d1cgHlwRPkHJzm+L	339	\N	2017-04-24 20:43:22.389	{}
SwjB0q/J+LI4nfmdTnbD	budgvhf/oqc9FWtiR59c	VBHlcHQF4aYRjQ1CCYo+	586	\N	2017-04-24 06:35:18.948	{}
QUisy0ixR/qlHwDOrPb3	YPGpbTqv9aeZHXxBNgIC	eoTUy32lA5l+k2+QZfQQ	236	\N	2017-04-25 18:10:49.408	{}
U39PBuAUIoDWNJ5p28VL	SBdioRVUMTzSJjoTQ8iG	uCzXZ/h+0lceva5eoAFl	731	\N	2017-04-24 17:28:44.162	{}
bh/WihA0h0jLMbqGCUSQ	budgvhf/oqc9FWtiR59c	clfMGedLL8JpM3dWFCNq	817	\N	2017-04-25 22:31:40.649	{}
X0Zt6iRymSPf+qfRXIKg	Hjjd3Ns0lvG3cs9jj4N7	ReAH5yJ/ylOvxgZ+wV0+	551	\N	2017-04-25 01:46:47.839	{}
iqAKg/pZHEQErmZ5x4ry	ZNerBKfcGYvzcUKaYlqg	6L/5GjyMuNKl9DMghK9+	259	\N	2017-04-25 23:26:27.496	{}
LSQjMJnEo/dttvvPaYNd	0/Dg4ohpw1BIoLvDgRkh	0NSoTy+0pfuOXb8lFv4E	604	\N	2017-04-24 19:38:09.777	{}
kAqjTl9XZqwz/0o0gCui	y90eN2IFt6lwJmUaK9TF	Cm2dJYfpJkrJw4SKD3dO	732	\N	2017-04-24 04:02:23.554	{}
Qd4C22kLl8GTyZ+9phpr	kMjFmLjttJpQS3rzutBf	fgitB1bKB2fA2EOY/0oz	890	\N	2017-04-26 07:23:36.348	{}
gIQR5aiI6euhbdFFLEqG	y90eN2IFt6lwJmUaK9TF	KDJhMSnr1eiypx8bJOQY	354	\N	2017-04-25 01:53:54.897	{}
Z3HsHnW8omnA8I3oFCqr	3KOaA2+6IjmFPfm4ChIJ	wcBZD3vVwQN69RQpQ4Wn	347	\N	2017-04-24 11:54:52.559	{}
NvvTRxDCIl063mo6/SUe	ZNerBKfcGYvzcUKaYlqg	A7uTJsWcGv90N9jqq2aX	322	\N	2017-04-26 10:54:40.428	{}
Sse4zHb3gSTHECVWmntg	XklfmXtmNz7WRzaFwJPY	5YiOCCzoJ2mJo02p1kvu	759	\N	2017-04-24 01:30:07.391	{}
m6WlfZo2cGF5GvqkGm+w	SBdioRVUMTzSJjoTQ8iG	cb4fsSmuKLOvsa9cl8wL	714	\N	2017-04-24 10:22:14.61	{}
8Jk05XMgfu9Z5KyxNbrK	Mooca+XNOJQaJb6IILB6	teHOEl79foxJD3bAW7yN	976	\N	2017-04-25 14:26:57.206	{}
04lYKlyfVLngflVpPBAJ	Mooca+XNOJQaJb6IILB6	SlhDoNTgLWqltUSr4Mw/	184	\N	2017-04-25 23:12:15.629	{}
Hl8OzarA8KxZ99op7OPo	SBdioRVUMTzSJjoTQ8iG	/HbDAxDTaPCsDW/pnuVS	302	\N	2017-04-24 05:48:51.679	{}
4rU02hsewte6DzcDj5ee	SBdioRVUMTzSJjoTQ8iG	6c7CxJwbLV7ynVGRTVbJ	146	\N	2017-04-25 19:08:18.81	{}
MaaBamBpEWFh740wiXv6	TMTdMrgBYgxYoTLKWv35	VXcjJXfnlk7KKrAAVuuu	341	\N	2017-04-25 21:52:12.82	{}
FO5qiWd7YjpYLTxPHEqm	/cFEfNMpFxRDc1+1PpSb	ws7Gu4Z4ogyANRcR/Pqu	759	\N	2017-04-24 03:48:27.505	{}
H5OQb6d+4Yb5lW7hvSEh	XklfmXtmNz7WRzaFwJPY	j8wpHa1dz9/2R58FIjas	601	\N	2017-04-25 22:22:15.845	{}
JWrUbIHsjHv6hFGTinEb	3KOaA2+6IjmFPfm4ChIJ	z1RXieIeobPEinZ0UBIE	894	\N	2017-04-24 23:59:31.169	{}
XzEgzA9XSDHEFPXeQP5S	kMjFmLjttJpQS3rzutBf	YQzTnDdAtc6eW+V5kNlM	403	\N	2017-04-26 08:34:46.97	{}
p/CqfBu+DisIv1oItLbo	ZNerBKfcGYvzcUKaYlqg	g3E7JHmvJBhrStjDU6Kg	295	\N	2017-04-26 18:45:22.831	{}
l1Y0FFgw9bncPUFupO9s	XklfmXtmNz7WRzaFwJPY	uPo+ls/nuLTv/aiymjpc	745	\N	2017-04-25 14:37:42.266	{}
7UKfrNlVwC3/ezIFVZse	/cFEfNMpFxRDc1+1PpSb	YLN08iEuZj4o5R4ynFgJ	382	\N	2017-04-25 20:30:03.214	{}
JW31X0alQFUsprGjNspF	SBdioRVUMTzSJjoTQ8iG	ZlZ60XqY2/jvcKbxaFU8	620	\N	2017-04-25 08:44:06.573	{}
Hh5ybQr+O6LhSDtamfMC	TMTdMrgBYgxYoTLKWv35	pAicfBcVhCd/NLtWSuOC	660	\N	2017-04-25 02:13:26.973	{}
o1GEQq6DA/GM7BwBkTER	budgvhf/oqc9FWtiR59c	C2xfD52JW39BNy7L51R8	703	\N	2017-04-25 04:26:10.39	{}
YaLPlSQVFlgxAO/AWFCy	SBdioRVUMTzSJjoTQ8iG	pzqaHQvqee/g0B3pNj46	257	\N	2017-04-25 02:40:55.529	{}
Nbrg7p593iVRMuT5jtni	y90eN2IFt6lwJmUaK9TF	RAc5WNyF/IebKCQxvi0m	732	\N	2017-04-25 11:37:54.712	{}
O0L3pEiS0dAlgnw76sPs	CBp22Vfd78M4NgkRafEo	WRHsfc/gnVgXyDsEdIOn	259	\N	2017-04-26 00:43:30.817	{}
HJMm8eJnCZNbIEzhG9in	SBdioRVUMTzSJjoTQ8iG	FJ5r92gjvOd2d0iUhZJM	501	\N	2017-04-26 21:48:28.647	{}
u9CMl6soRBLt18ddq8vo	SBdioRVUMTzSJjoTQ8iG	ONpyMpB5ZczG/tqTb0qH	719	\N	2017-04-24 07:26:38.6	{}
pVMHs3h/2MkmILyn8q7e	sAxdggjzUR7+K6sSxnyU	gerwFbOK7rj2/sxav7TM	426	\N	2017-04-24 18:44:53.588	{}
7RZz/1kZzf8JGNx+xzGr	0/Dg4ohpw1BIoLvDgRkh	clX6Pr6Dseqcg6rG6R+p	883	\N	2017-04-24 12:27:57.139	{}
B7Oz4ffXUK7TyZAqr9MO	ljr+mdhFYpVziaRs0plq	b7mt8ZygJxJImA1Jjov9	261	\N	2017-04-25 19:10:40.476	{}
7XNDIuPcHb8/IIgxVo+l	SBdioRVUMTzSJjoTQ8iG	sp639f+5Nq2drx50ElyL	195	\N	2017-04-25 17:26:37.343	{}
KWmj77WOWQ1Sdp3dJcYz	budgvhf/oqc9FWtiR59c	IStaor2VZBCC4YitNlq3	168	\N	2017-04-25 16:39:24.434	{}
hmbxE3ROb31ZjoacjyQ1	CBp22Vfd78M4NgkRafEo	KlH3+Uce7khqB0/Nmq1W	239	\N	2017-04-26 03:51:55.88	{}
DTCQsmqXC1EFBmJN0rdi	VErp5+HZdn3Yz2G88TZh	a50pTP8E49XAQh5LJUUl	88	\N	2017-04-24 12:55:35.051	{}
enmBa+AqqzcLUmcM1ece	nbFMJA7w8Ms8VOsgI8Uj	wMmO8kppsab7n1WjSE/B	201	\N	2017-04-26 08:14:00.094	{}
HZRXEIRiXucnWskQzzKF	TMTdMrgBYgxYoTLKWv35	dj0yIOOu3Cc4exMrvCvr	9	\N	2017-04-26 04:51:48.267	{}
R9UpisROG+iB1zlEWypS	CBp22Vfd78M4NgkRafEo	/8bydnemsbZ6PIE9HaAf	631	\N	2017-04-24 19:56:17.749	{}
hwMkSivmBgjDaEZrF4Fw	0/Dg4ohpw1BIoLvDgRkh	FuFsrNIyD5fyc3cn5roA	149	\N	2017-04-25 02:50:20.772	{}
eZE9wVxCuoP8OaNtVkRt	rc+ccdAK8F4ROpIC299B	ocmBghNxWckrZ4fTlhuk	904	\N	2017-04-25 14:59:53.151	{}
sO6Hri2OUyFWg6eQP4Nt	sAxdggjzUR7+K6sSxnyU	BTHuAqP0IFDIVsnnrF30	568	\N	2017-04-25 10:49:08.015	{}
uSSBP23Ni14w9q3wZhGk	3KOaA2+6IjmFPfm4ChIJ	bLFa4S8BjWZFHzr/ii8E	737	\N	2017-04-24 16:18:53.605	{}
Y0WOaAWJtkYDeD+4B44S	3KOaA2+6IjmFPfm4ChIJ	Xwipggg/xJTsdjMuMOjI	803	\N	2017-04-24 09:21:05.887	{}
gpHLhe42rm3DwPN7IpEN	3KOaA2+6IjmFPfm4ChIJ	Xg63oCrDld8T7hrSPaIr	712	\N	2017-04-24 19:52:52.676	{}
ONnYpRl+V/zWd1bhEpIk	Mooca+XNOJQaJb6IILB6	e75r6knrluXB5FEMmWvj	864	\N	2017-04-25 03:02:13.702	{}
TrTXlugj6Ih7a4lyVsRs	/cFEfNMpFxRDc1+1PpSb	NDb6Ri8u0F51nSUlE6H0	344	\N	2017-04-26 23:50:16.172	{}
nQZMH44xsmHnT2vrNK2N	ljr+mdhFYpVziaRs0plq	xqV2Sb04tBodIPV9twXY	662	\N	2017-04-25 11:31:03.987	{}
5CZ7I0Jh3Lm080/NJXXG	nbFMJA7w8Ms8VOsgI8Uj	nC2CV6ncpAx1FtfkAR4c	875	\N	2017-04-24 09:33:05.776	{}
apU/nSewBT/zqVVM1slU	3KOaA2+6IjmFPfm4ChIJ	sjjZCufqioecHEPOpKIP	132	\N	2017-04-26 10:16:01.328	{}
beXtkC9fjfnzv6xQXVp6	XklfmXtmNz7WRzaFwJPY	+EdbyY8N/olnsFkkzbXB	493	\N	2017-04-24 18:04:23.206	{}
P9ISNBkaGHExlhNJ73fK	3KOaA2+6IjmFPfm4ChIJ	FNAtzuIkfq9ApkrdeNFM	716	\N	2017-04-26 17:07:37.107	{}
IWUOXgPP4fcXGW6KIyxD	SBdioRVUMTzSJjoTQ8iG	0RaytChooMqyxUOYZn39	615	\N	2017-04-24 15:44:55.538	{}
4QicQYlgqAG0N0m5YvU+	budgvhf/oqc9FWtiR59c	KcxbhjqNxwK3sDm7fNDD	716	\N	2017-04-24 22:29:00.118	{}
NpV4E0o5j1FMqY7p8Y0C	budgvhf/oqc9FWtiR59c	K8jnojebJRcDY56cIbvD	367	\N	2017-04-26 13:21:52.017	{}
WuM2FBDK4jiu1weJEHwI	VErp5+HZdn3Yz2G88TZh	smn3EXH1b3UgW30PEXIS	643	\N	2017-04-26 20:13:04.499	{}
mIVwNMwXxW7aDgBPbDZA	budgvhf/oqc9FWtiR59c	A+n+44JWga5H6BY+p1bC	563	\N	2017-04-26 17:34:00.972	{}
N8Dl2pBIHBl3ijU5PP4r	CBp22Vfd78M4NgkRafEo	CvsbSQDYtfA8zrZnPe6L	774	\N	2017-04-25 10:45:21.647	{}
sty0zVyq27pk97NcAXeV	TMTdMrgBYgxYoTLKWv35	Hnc6d1cgHlwRPkHJzm+L	907	\N	2017-04-25 17:50:38.787	{}
YxfyRUk64g0gCxj6Bcsi	CBp22Vfd78M4NgkRafEo	rMCVBZsp/pS2KB+aHHoM	103	\N	2017-04-24 15:26:43.701	{}
ahL3ahwtzka50muOcJQE	Hjjd3Ns0lvG3cs9jj4N7	GkgxT5AlO55VPbcQ74CW	139	\N	2017-04-25 06:35:10.416	{}
roXW54IwUca8vtP0Xe3f	sAxdggjzUR7+K6sSxnyU	8mZiabWksAbmv9Y7hZNh	69	\N	2017-04-24 10:11:28.701	{}
G8/BDHM9GX3xuV4T7X51	TMTdMrgBYgxYoTLKWv35	7pZJtQXHPm1RcCN7zNdR	751	\N	2017-04-24 07:09:30.415	{}
ipMmePeYpxeJQvgHFkpo	Hjjd3Ns0lvG3cs9jj4N7	TFeRXPL2Pikrpj0xB6lG	577	\N	2017-04-26 00:48:30.499	{}
fLLo2Xhjm59mUFZChWxr	3KOaA2+6IjmFPfm4ChIJ	6L/5GjyMuNKl9DMghK9+	395	\N	2017-04-26 09:30:06.684	{}
uStGrI+zh7bym1XGvdqk	kMjFmLjttJpQS3rzutBf	0NSoTy+0pfuOXb8lFv4E	284	\N	2017-04-24 21:52:48.937	{}
mjmOYsEO80qztYQS8F78	sAxdggjzUR7+K6sSxnyU	LODAslONfvPu2wITGZoJ	64	\N	2017-04-26 04:33:11.375	{}
wu3seuF5ybnm9fQxD8Zw	/cFEfNMpFxRDc1+1PpSb	o+xN3I/a5Hv0i7ik4bDY	782	\N	2017-04-26 17:10:56.822	{}
vgAFPz8C/M6CLpE6tWVe	YPGpbTqv9aeZHXxBNgIC	KDJhMSnr1eiypx8bJOQY	740	\N	2017-04-25 06:36:43.949	{}
b7IFvLlhfkJs5OTpSoZR	TMTdMrgBYgxYoTLKWv35	wcBZD3vVwQN69RQpQ4Wn	908	\N	2017-04-26 16:01:48.612	{}
tS/HXrLqZXX1q9pN0Au7	+2fxb2EecC80U2DcxPMF	CV94zkA/V4uHj2SciqNf	763	\N	2017-04-24 10:03:05.936	{}
0ncXfFNXidNjI7Sek7zW	SBdioRVUMTzSJjoTQ8iG	cb4fsSmuKLOvsa9cl8wL	552	\N	2017-04-24 04:27:55.664	{}
4uONNdA/6CCejwE727LL	rc+ccdAK8F4ROpIC299B	teHOEl79foxJD3bAW7yN	509	\N	2017-04-24 01:14:58.27	{}
J03dMvZuxzoNaHurJTGq	kMjFmLjttJpQS3rzutBf	SlhDoNTgLWqltUSr4Mw/	477	\N	2017-04-25 15:34:39.867	{}
IROQyuB+00DSKRunSmGf	0/Dg4ohpw1BIoLvDgRkh	wtnJ2wRu5rcRYbEJ6Nc/	937	\N	2017-04-24 23:23:01.706	{}
7ik6MsLAt9RJEEsiOcw+	TMTdMrgBYgxYoTLKWv35	6c7CxJwbLV7ynVGRTVbJ	828	\N	2017-04-24 06:08:46.359	{}
7eA/SNVPkzifbReZKXiQ	VErp5+HZdn3Yz2G88TZh	BWY0/0m06DzvXxK+8k1Q	841	\N	2017-04-24 11:10:35.682	{}
dqiP5HbY+epQaFpoNLQz	YPGpbTqv9aeZHXxBNgIC	/oUY19a2GQFVOwBcOhKX	813	\N	2017-04-26 13:44:16.558	{}
ydHHkAlQR52bz8uF8G9R	SBdioRVUMTzSJjoTQ8iG	fT7RpAWcTRVT+BYCfX+Z	985	\N	2017-04-25 17:36:09.401	{}
mlYTKOfXrbFWwrPYak8d	Mooca+XNOJQaJb6IILB6	QER/vEICwOqelKRmFewa	817	\N	2017-04-24 21:39:33.896	{}
BBu/prdpsEoH8k0xw1mn	budgvhf/oqc9FWtiR59c	YQzTnDdAtc6eW+V5kNlM	724	\N	2017-04-26 18:14:45.582	{}
AKng5V6nDH3wN48xHA74	Hjjd3Ns0lvG3cs9jj4N7	g3E7JHmvJBhrStjDU6Kg	295	\N	2017-04-24 00:21:06.396	{}
At940wg0BcYk3f5tJh2K	CBp22Vfd78M4NgkRafEo	uPo+ls/nuLTv/aiymjpc	269	\N	2017-04-25 22:36:25.238	{}
jP0R+gng++Xq6/lNTIDs	TMTdMrgBYgxYoTLKWv35	YLN08iEuZj4o5R4ynFgJ	943	\N	2017-04-24 16:37:57.445	{}
8158AtLmg33UiAVLt8U7	Mooca+XNOJQaJb6IILB6	ZlZ60XqY2/jvcKbxaFU8	690	\N	2017-04-26 06:44:44.887	{}
4ob87P9YAZrOQSzxpAEc	/cFEfNMpFxRDc1+1PpSb	xFpV4IKIb2U1avAPgBEw	205	\N	2017-04-25 21:09:14.369	{}
/3UiGa1aPzTyKu5eUO4c	Mooca+XNOJQaJb6IILB6	/C0qISaxJZxIMn5rVJKD	353	\N	2017-04-25 22:28:41.471	{}
K18Le7hA7MWnJgj1julw	3KOaA2+6IjmFPfm4ChIJ	D2KQneMYD4jvQu4rhiVU	171	\N	2017-04-24 20:07:57.043	{}
B6J0LKiSESFGjB0iWB/7	ZNerBKfcGYvzcUKaYlqg	yCX8PcpJyMC/0fSa/UEt	113	\N	2017-04-25 06:59:43.733	{}
Prqg2eWZQ65VjIIk3yje	rc+ccdAK8F4ROpIC299B	fsjDaeRHhimkDROH0uSo	129	\N	2017-04-25 05:09:51.259	{}
0mFZi/pWRWxHYZhfvuj3	rc+ccdAK8F4ROpIC299B	4hmJ3xoD+cikoQ+/ShBx	838	\N	2017-04-24 21:44:47.334	{}
U4nImHbH6x6VtFekvYeo	nbFMJA7w8Ms8VOsgI8Uj	WRHsfc/gnVgXyDsEdIOn	441	\N	2017-04-26 17:09:47.223	{}
PYy3cNl6qRI0wWtXCU+x	y90eN2IFt6lwJmUaK9TF	V2J9ZI7uUSGISvPAjYfO	133	\N	2017-04-26 05:01:13.767	{}
hB5bLz6t3j8z+J7KeImm	/cFEfNMpFxRDc1+1PpSb	ONpyMpB5ZczG/tqTb0qH	954	\N	2017-04-24 20:30:16.29	{}
07LJSZuW2K+nHH7xz7CM	budgvhf/oqc9FWtiR59c	ml79vK7Q1Qa05idsnFGB	534	\N	2017-04-26 22:15:15.472	{}
dglQj5iTKeHbxVBZmcwZ	Mooca+XNOJQaJb6IILB6	2TCVHmuSSvPVS/NGck28	950	\N	2017-04-26 16:21:30.276	{}
KZxoUBoCsg/7/3Hcblmh	nbFMJA7w8Ms8VOsgI8Uj	clX6Pr6Dseqcg6rG6R+p	549	\N	2017-04-25 16:19:54.466	{}
PsNhPDC6U/U3Hqk2PK7j	/cFEfNMpFxRDc1+1PpSb	b7mt8ZygJxJImA1Jjov9	492	\N	2017-04-25 17:14:22.275	{}
VCsyob9lsAGHxZn3qAQh	0/Dg4ohpw1BIoLvDgRkh	R3+Kafw3nB64d6cNtz6p	470	\N	2017-04-25 21:21:30.421	{}
PA6AU50NqKZTV/2Fy0e0	SBdioRVUMTzSJjoTQ8iG	NVXJ778lSXzucIhJdTQn	194	\N	2017-04-25 16:45:27.041	{}
gK2SL/0ILt//zhmeUi17	YPGpbTqv9aeZHXxBNgIC	2Zd5j1kN3amM0c+EavdD	49	\N	2017-04-25 20:27:06.873	{}
r0+NIWHHYsnALDORI2vH	YPGpbTqv9aeZHXxBNgIC	KlH3+Uce7khqB0/Nmq1W	191	\N	2017-04-25 21:00:39.158	{}
bx0GzyxvT7WdE0wBhvLT	XklfmXtmNz7WRzaFwJPY	a50pTP8E49XAQh5LJUUl	598	\N	2017-04-26 12:51:39.513	{}
PbjXLBa6os1ixHYl7JFz	Mooca+XNOJQaJb6IILB6	wMmO8kppsab7n1WjSE/B	675	\N	2017-04-24 02:53:19.42	{}
7DiJwWlycW3/8fYRWtHq	budgvhf/oqc9FWtiR59c	kgGTDDtNbiTdMIlT7tpb	779	\N	2017-04-24 11:50:51.402	{}
hYEMrY9Tqayp29O3IgIE	ZNerBKfcGYvzcUKaYlqg	TRfmmjCxHNcRKi0Gh+NJ	222	\N	2017-04-25 23:28:10.559	{}
3zd5GrvQ2zJ1zD+pg3Qc	3KOaA2+6IjmFPfm4ChIJ	FuFsrNIyD5fyc3cn5roA	94	\N	2017-04-26 02:39:54.634	{}
QdUrmCm3wH9ZEni5kwNH	ZNerBKfcGYvzcUKaYlqg	3Y2+ssPUZIBhL3DLNgtV	655	\N	2017-04-24 07:24:25.786	{}
U1BdDNIrBXnbG1tYoR9O	y90eN2IFt6lwJmUaK9TF	zeNYSwQcreNIDwDi1Wxd	775	\N	2017-04-24 00:58:05.186	{}
03PVts0FuuUKu5Jb7NJN	ljr+mdhFYpVziaRs0plq	yqs2NjrEc5urGA2MDjCW	520	\N	2017-04-26 19:39:45.381	{}
hsMf0v5XPdhiKRC2+hIn	ljr+mdhFYpVziaRs0plq	Xg63oCrDld8T7hrSPaIr	734	\N	2017-04-26 23:44:09.674	{}
M47lr6TKu2bJWc/G82tN	3KOaA2+6IjmFPfm4ChIJ	+MwnavUgUpUHkc8af6R5	86	\N	2017-04-26 11:58:19.013	{}
ohOnb/sunpKMgUjLAcRv	VErp5+HZdn3Yz2G88TZh	NDb6Ri8u0F51nSUlE6H0	333	\N	2017-04-25 04:35:40.077	{}
iko5UD5VD2r6Y+vJJUe0	ljr+mdhFYpVziaRs0plq	uDEBpLMaBaOSUZrYMJTp	612	\N	2017-04-26 23:28:25.668	{}
wYwRqnNbEkdodRcg3CdD	CBp22Vfd78M4NgkRafEo	77Gx6+xBsHiXz2UMbrGQ	854	\N	2017-04-25 09:57:04.544	{}
e+etIBr3hA4qzOTH1wBT	/cFEfNMpFxRDc1+1PpSb	JNCUf59fexGE2RtFdeFl	473	\N	2017-04-24 15:03:23.668	{}
BRjHCmzl6SjQguu6OJcx	ljr+mdhFYpVziaRs0plq	0kdDzr3LnJry8zC1cU1W	504	\N	2017-04-26 11:00:21.739	{}
JRACI+7yc+vMbktdgDNV	ljr+mdhFYpVziaRs0plq	9PID7ysZKZGFMXhcyY3b	316	\N	2017-04-26 00:11:20.062	{}
vfbsdY1OUeqXVHbZJ24X	XklfmXtmNz7WRzaFwJPY	KcxbhjqNxwK3sDm7fNDD	305	\N	2017-04-25 17:10:06.557	{}
43MhkZTgc87GA1v/tswM	Mooca+XNOJQaJb6IILB6	rx8uS+H3aAhi2J41Qbb4	176	\N	2017-04-24 20:00:34.195	{}
djB68y//1Hiv2+QLyRJE	y90eN2IFt6lwJmUaK9TF	smn3EXH1b3UgW30PEXIS	517	\N	2017-04-26 15:31:11.552	{}
mcenfFQvfe6+HtlDi6nO	ljr+mdhFYpVziaRs0plq	Ww+SwPycvd0cdKnIAHGW	981	\N	2017-04-24 03:43:18.023	{}
1VgNV1r7HoTlMmQCVRcu	nbFMJA7w8Ms8VOsgI8Uj	hzeqvgFyWhnRWTclKHqy	64	\N	2017-04-24 19:07:28.324	{}
GL+cIWJjkmNDCIDUgy+K	rc+ccdAK8F4ROpIC299B	rMCVBZsp/pS2KB+aHHoM	574	\N	2017-04-25 05:48:51.235	{}
BVMCR2Pt/peXCSfG3a29	CBp22Vfd78M4NgkRafEo	GkgxT5AlO55VPbcQ74CW	929	\N	2017-04-26 12:57:33.531	{}
MLC4hy5mlemw/LoQkOmS	kMjFmLjttJpQS3rzutBf	uCzXZ/h+0lceva5eoAFl	626	\N	2017-04-24 15:22:15.549	{}
z49NwOEjbsGiyGtZWnM7	rc+ccdAK8F4ROpIC299B	clfMGedLL8JpM3dWFCNq	461	\N	2017-04-24 00:49:45.119	{}
teq6kgdUE7+P8GEorHwJ	ljr+mdhFYpVziaRs0plq	TFeRXPL2Pikrpj0xB6lG	867	\N	2017-04-24 16:10:18.474	{}
7SL/APVlsuQ494dvrPPf	kMjFmLjttJpQS3rzutBf	qI2FtRNCwudROWOOJZlq	446	\N	2017-04-24 10:12:09.132	{}
IbdnaSDplizLak7oKfbw	TMTdMrgBYgxYoTLKWv35	MguqgBqCIleOIqwlPNrn	486	\N	2017-04-26 06:40:22.64	{}
ySWO9TfnTy5tVY7AMyt6	XklfmXtmNz7WRzaFwJPY	LODAslONfvPu2wITGZoJ	483	\N	2017-04-25 16:44:06.527	{}
NL/bjsm7XRmapQMK3X+4	3KOaA2+6IjmFPfm4ChIJ	o+xN3I/a5Hv0i7ik4bDY	350	\N	2017-04-24 21:23:27.296	{}
21h+cjPpXcXc1v6HOGjw	kMjFmLjttJpQS3rzutBf	8M+uHwKEP9zUbXSEbjrM	591	\N	2017-04-24 21:06:53.891	{}
wV8wDQtEWGuhHQztlRS5	+2fxb2EecC80U2DcxPMF	y9S8oSUVDEAV8zdbB1bd	930	\N	2017-04-26 04:22:38.628	{}
adxRJisiG+jn7xbk2giI	CBp22Vfd78M4NgkRafEo	UI2CoZVy16uWrilGL82b	556	\N	2017-04-24 17:07:12.085	{}
6Mf0n9t9gx1/KyD5hSqy	YPGpbTqv9aeZHXxBNgIC	cb4fsSmuKLOvsa9cl8wL	638	\N	2017-04-25 03:40:26.81	{}
NKafaOZ0YyVGmFLWNdVo	0/Dg4ohpw1BIoLvDgRkh	lC5a6Rn8k0EQ429xr5jH	761	\N	2017-04-25 09:43:50.834	{}
yi1h21gdDP3gKnMFuLKH	/cFEfNMpFxRDc1+1PpSb	SemUrsHT7EdO+EMDkrkX	424	\N	2017-04-26 10:19:04.048	{}
F4fQpYmJmDbdCiPHp64p	ljr+mdhFYpVziaRs0plq	5D6s/vZh8AlWzlV/nXj0	441	\N	2017-04-26 14:14:45.945	{}
NWvDOY0Ou0jKGxq01Lou	sAxdggjzUR7+K6sSxnyU	BWY0/0m06DzvXxK+8k1Q	636	\N	2017-04-25 10:37:51.581	{}
XqQnJrYxxopnAGgGmQjo	budgvhf/oqc9FWtiR59c	/oUY19a2GQFVOwBcOhKX	144	\N	2017-04-24 09:06:26.167	{}
VY8YBPEW7iPFoPKTXAlU	kMjFmLjttJpQS3rzutBf	fT7RpAWcTRVT+BYCfX+Z	560	\N	2017-04-26 22:26:19.809	{}
Wxhw1M8XWmTJ4QYmGF6w	SBdioRVUMTzSJjoTQ8iG	QER/vEICwOqelKRmFewa	156	\N	2017-04-26 13:32:39.814	{}
QyfYLS/ZaeMTG8TNvpbE	y90eN2IFt6lwJmUaK9TF	pSCawuMEdLKVs1vFuSzb	72	\N	2017-04-24 12:03:57.24	{}
UskYsA2kR0Zt6MOwSYvP	XklfmXtmNz7WRzaFwJPY	KRQ4GarJX8r+Hr0vT+QP	762	\N	2017-04-26 16:18:55.852	{}
YZJoGx38JoyFvf06u7i5	Hjjd3Ns0lvG3cs9jj4N7	YLN08iEuZj4o5R4ynFgJ	448	\N	2017-04-25 06:44:18.11	{}
eO84ZMpiBKZnoOUk/v62	budgvhf/oqc9FWtiR59c	ZlZ60XqY2/jvcKbxaFU8	564	\N	2017-04-26 07:53:00.669	{}
JOz9+pRfD5YFP8VAC+xD	ljr+mdhFYpVziaRs0plq	xFpV4IKIb2U1avAPgBEw	351	\N	2017-04-25 14:24:44.044	{}
AYZ4iR7MRNnu2lef1KBI	/cFEfNMpFxRDc1+1PpSb	C2xfD52JW39BNy7L51R8	512	\N	2017-04-25 21:22:37.779	{}
oDFDa32AP2N/Hr+m5In8	y90eN2IFt6lwJmUaK9TF	D2KQneMYD4jvQu4rhiVU	185	\N	2017-04-25 00:00:41.469	{}
zs4dxfE8Xk59vlSLLI2E	YPGpbTqv9aeZHXxBNgIC	yCX8PcpJyMC/0fSa/UEt	950	\N	2017-04-25 16:31:49.191	{}
bt4P1uJJplA5I3cIU6OO	XklfmXtmNz7WRzaFwJPY	fsjDaeRHhimkDROH0uSo	360	\N	2017-04-25 12:31:12.825	{}
cj0sWgzk0N/jVQ5UyN2L	rc+ccdAK8F4ROpIC299B	Rb+4vnuEzJHMz4oK5SlP	108	\N	2017-04-25 05:58:06.009	{}
8/G+GLyk60yd3NxmPLiY	Mooca+XNOJQaJb6IILB6	WRHsfc/gnVgXyDsEdIOn	71	\N	2017-04-25 04:30:24.282	{}
SeRlAwAycwrXtjlOCBJ5	Mooca+XNOJQaJb6IILB6	2PerRxaH4fK6KrGP5Qwt	397	\N	2017-04-24 09:32:09.604	{}
IHm5pY8mDJ91m2AE/rGa	XklfmXtmNz7WRzaFwJPY	ONpyMpB5ZczG/tqTb0qH	641	\N	2017-04-25 22:23:12.492	{}
P7Ovu19TVJLliABdABfQ	CBp22Vfd78M4NgkRafEo	1qE101biu++LikStH2No	534	\N	2017-04-26 22:53:17.239	{}
XWD8FfhQ6oOZ6ggGHxLN	TMTdMrgBYgxYoTLKWv35	clX6Pr6Dseqcg6rG6R+p	831	\N	2017-04-24 12:39:59.901	{}
hns3N+LwqXCT9DssGuHO	XklfmXtmNz7WRzaFwJPY	b7mt8ZygJxJImA1Jjov9	300	\N	2017-04-24 03:45:03.022	{}
9o/hpnxsqFOleCbAm3tu	budgvhf/oqc9FWtiR59c	R3+Kafw3nB64d6cNtz6p	508	\N	2017-04-26 11:18:41.37	{}
ITWJEfRk02MAiFYwLCrv	SBdioRVUMTzSJjoTQ8iG	vAJ8Et17IvumOjMTusA1	875	\N	2017-04-26 13:58:33.96	{}
hjEftvYaKpMYx/FzQtyH	ljr+mdhFYpVziaRs0plq	KlH3+Uce7khqB0/Nmq1W	435	\N	2017-04-26 18:52:57.981	{}
8/q4q0SupxldItzsIRcJ	ZNerBKfcGYvzcUKaYlqg	a50pTP8E49XAQh5LJUUl	782	\N	2017-04-25 03:29:24.775	{}
VwAtT7MapWZzqGj2kXum	kMjFmLjttJpQS3rzutBf	wMmO8kppsab7n1WjSE/B	979	\N	2017-04-26 23:20:25.968	{}
BsCV80ffoCqSsevqsh9E	0/Dg4ohpw1BIoLvDgRkh	kgGTDDtNbiTdMIlT7tpb	13	\N	2017-04-26 17:42:19.531	{}
1kle+oSO451mhI71Yuc8	ZNerBKfcGYvzcUKaYlqg	dj0yIOOu3Cc4exMrvCvr	870	\N	2017-04-25 19:46:13.444	{}
jPb6rhAIUkVlkEuXljsa	y90eN2IFt6lwJmUaK9TF	FuFsrNIyD5fyc3cn5roA	98	\N	2017-04-26 09:17:04.945	{}
z9g293HjzewpDOY1QlYN	+2fxb2EecC80U2DcxPMF	ocmBghNxWckrZ4fTlhuk	179	\N	2017-04-26 09:34:34.202	{}
PPz++9sO8TrxQEghug8/	budgvhf/oqc9FWtiR59c	G7CHn9TOjUUnhyYVmoZG	177	\N	2017-04-26 02:26:32.216	{}
bRgi95vHV0il85C7Wr4P	YPGpbTqv9aeZHXxBNgIC	yqs2NjrEc5urGA2MDjCW	943	\N	2017-04-24 10:35:56.545	{}
lrmpz17P4P4Xh63mtrxC	ljr+mdhFYpVziaRs0plq	4hbbUkuC/FIrOMWSLs6A	58	\N	2017-04-24 02:37:59.392	{}
yFNfHZ9cnJnu2BZxKyLe	3KOaA2+6IjmFPfm4ChIJ	nb4xmYvuBqr33jCsuFiF	96	\N	2017-04-24 07:32:01.492	{}
QmFhxXyLVjplLcqjLf1a	kMjFmLjttJpQS3rzutBf	e75r6knrluXB5FEMmWvj	639	\N	2017-04-24 13:32:58.097	{}
52j2J2Xgh5/WNXVusNV0	VErp5+HZdn3Yz2G88TZh	Py7ahqrY/1JieQPbPKHJ	416	\N	2017-04-25 20:45:52.147	{}
2bHmVwtAWap/F5Biuq0U	VErp5+HZdn3Yz2G88TZh	uDEBpLMaBaOSUZrYMJTp	771	\N	2017-04-24 11:37:47.375	{}
nkP5Sua+3p/SJhZpU1Lm	0/Dg4ohpw1BIoLvDgRkh	wr8mAVWTJaU3yB8njUzX	586	\N	2017-04-24 17:48:52.968	{}
2r03VyZotGqD0Fd2PJvV	Mooca+XNOJQaJb6IILB6	sjjZCufqioecHEPOpKIP	950	\N	2017-04-24 21:20:19.975	{}
MrvYaLKQOlwrIMxkJPOY	CBp22Vfd78M4NgkRafEo	+EdbyY8N/olnsFkkzbXB	513	\N	2017-04-26 10:31:08.463	{}
ZHKV5vk2gxuXIdyCvL42	SBdioRVUMTzSJjoTQ8iG	9PID7ysZKZGFMXhcyY3b	807	\N	2017-04-26 07:47:48.489	{}
QOHlia/KqNNxPWgriv+o	SBdioRVUMTzSJjoTQ8iG	hMU/P36hWfY/xbtIpumu	28	\N	2017-04-26 04:54:12.172	{}
94AFH7vh1shuAeiL4OqG	CBp22Vfd78M4NgkRafEo	hTGMbTZe/Oalm1bkZ9nT	689	\N	2017-04-26 09:06:19.946	{}
2oiWLh/TFV3fGaiOxUmI	Mooca+XNOJQaJb6IILB6	muH3+mbrGNEZz3RN28C/	318	\N	2017-04-25 18:50:52.053	{}
10RH8v0vjg1b4PGv93lM	Mooca+XNOJQaJb6IILB6	+YahB8dn45dWgxbQKPo2	398	\N	2017-04-24 07:26:40.305	{}
NFuA2dG5Qm4oipbScKw8	VErp5+HZdn3Yz2G88TZh	huJP+RuKzkZlJ9OKL2tF	259	\N	2017-04-26 12:15:04.494	{}
ahIf6wQYPPI06NJIZhGU	VErp5+HZdn3Yz2G88TZh	K8jnojebJRcDY56cIbvD	775	\N	2017-04-26 22:21:54.76	{}
TBFmC4p+6ix8r8GKMdeT	kMjFmLjttJpQS3rzutBf	smn3EXH1b3UgW30PEXIS	246	\N	2017-04-24 08:50:38.659	{}
r7nQS9Ze5umvz6Q1esVl	nbFMJA7w8Ms8VOsgI8Uj	A+n+44JWga5H6BY+p1bC	658	\N	2017-04-26 19:44:27.052	{}
QfCoS5cti0k8EyXv5y2m	ljr+mdhFYpVziaRs0plq	CvsbSQDYtfA8zrZnPe6L	84	\N	2017-04-24 00:36:46.532	{}
QmR1wsaqI2k+9du5BcyA	Mooca+XNOJQaJb6IILB6	hzeqvgFyWhnRWTclKHqy	59	\N	2017-04-26 11:21:21.082	{}
KZ2afDsB5Gs9PWVXV09C	nbFMJA7w8Ms8VOsgI8Uj	oqH7I/342a8ecO0ty6fR	687	\N	2017-04-26 09:30:06.016	{}
9gjCs7lLPsIHQ8t0DL8B	budgvhf/oqc9FWtiR59c	GkgxT5AlO55VPbcQ74CW	149	\N	2017-04-25 01:08:19.544	{}
Qb6DXprebPdRCDlLDNq7	ljr+mdhFYpVziaRs0plq	8mZiabWksAbmv9Y7hZNh	899	\N	2017-04-26 08:11:35.772	{}
bwPJOHWc8SFh27JAKu0F	sAxdggjzUR7+K6sSxnyU	eQYdo0lwWg/0maBPX6Ky	295	\N	2017-04-26 02:59:45.027	{}
I+bcA+jAE3j4m8MAbCUu	TMTdMrgBYgxYoTLKWv35	TFeRXPL2Pikrpj0xB6lG	757	\N	2017-04-26 10:57:53.28	{}
kj4h3XszW6oFzgxuCOIl	y90eN2IFt6lwJmUaK9TF	6L/5GjyMuNKl9DMghK9+	903	\N	2017-04-26 15:30:59.111	{}
EW+XOq20+ZmTZHebcox6	0/Dg4ohpw1BIoLvDgRkh	MguqgBqCIleOIqwlPNrn	494	\N	2017-04-24 20:40:46.842	{}
MJvBg+2uqvpcP7Ptvv8b	0/Dg4ohpw1BIoLvDgRkh	Cm2dJYfpJkrJw4SKD3dO	846	\N	2017-04-26 05:18:47.445	{}
o21Ct3f44Pq+zOjU86yM	rc+ccdAK8F4ROpIC299B	fdzah3/A9olQ1GKFPVue	502	\N	2017-04-24 08:17:10.4	{}
zfaHT5+dEgRCNchTvA5/	y90eN2IFt6lwJmUaK9TF	o+xN3I/a5Hv0i7ik4bDY	46	\N	2017-04-25 03:19:14.478	{}
CAIYnfUZ2LWaJqQ7VWF7	YPGpbTqv9aeZHXxBNgIC	8M+uHwKEP9zUbXSEbjrM	569	\N	2017-04-24 23:33:49.301	{}
f/en/12CbWa6dr53ReU0	y90eN2IFt6lwJmUaK9TF	y9S8oSUVDEAV8zdbB1bd	34	\N	2017-04-26 12:19:34.566	{}
rPp2JRdnVWJPKHkr8+4F	SBdioRVUMTzSJjoTQ8iG	CV94zkA/V4uHj2SciqNf	658	\N	2017-04-26 20:27:11.801	{}
XDCzJ/jhQ6qyDxryBDka	0/Dg4ohpw1BIoLvDgRkh	cb4fsSmuKLOvsa9cl8wL	313	\N	2017-04-26 13:55:52.171	{}
phJ37zi38Bz7obecUxfi	0/Dg4ohpw1BIoLvDgRkh	lC5a6Rn8k0EQ429xr5jH	382	\N	2017-04-25 00:40:03.231	{}
/L9c0L7fG4BqapheHPQa	TMTdMrgBYgxYoTLKWv35	SlhDoNTgLWqltUSr4Mw/	724	\N	2017-04-25 11:50:44.2	{}
bC+WTG1fjinP7Iihlgsf	budgvhf/oqc9FWtiR59c	/HbDAxDTaPCsDW/pnuVS	977	\N	2017-04-25 19:55:03.794	{}
eOuR3ggHUjA4nVi+7Uzd	Hjjd3Ns0lvG3cs9jj4N7	BWY0/0m06DzvXxK+8k1Q	962	\N	2017-04-24 13:17:32.707	{}
Wkjnm3nJ4smZXO7xkGz0	+2fxb2EecC80U2DcxPMF	/oUY19a2GQFVOwBcOhKX	88	\N	2017-04-25 13:45:07.136	{}
zY2W8cT4YcK6gKr5XZVs	kMjFmLjttJpQS3rzutBf	fT7RpAWcTRVT+BYCfX+Z	472	\N	2017-04-24 04:57:06.622	{}
gYOS6PpJ06RobWXHGUS6	ljr+mdhFYpVziaRs0plq	QER/vEICwOqelKRmFewa	964	\N	2017-04-26 23:56:40.556	{}
ise5Yx7G9mN4JMFcYe8a	SBdioRVUMTzSJjoTQ8iG	vig5tN7rbCDvgPyZmJ99	900	\N	2017-04-25 01:50:57.299	{}
DYPKg48U8plIFgB3Txyr	ljr+mdhFYpVziaRs0plq	KRQ4GarJX8r+Hr0vT+QP	180	\N	2017-04-25 09:45:23.986	{}
5EdKEjae1PA0wJtRZ0z5	VErp5+HZdn3Yz2G88TZh	uPEFdvhuU7uBHnFA1i5Z	226	\N	2017-04-25 01:56:04.937	{}
ibT0YpS1zc03Ae17/526	TMTdMrgBYgxYoTLKWv35	QE5m3KxzvLHfaC1d2pOH	918	\N	2017-04-26 21:22:56.858	{}
g6V8dhyh7pdLZyGj0gFU	Hjjd3Ns0lvG3cs9jj4N7	xFpV4IKIb2U1avAPgBEw	690	\N	2017-04-24 15:42:22.019	{}
PQCsarcNUupnJKn1h9vk	CBp22Vfd78M4NgkRafEo	C2xfD52JW39BNy7L51R8	667	\N	2017-04-24 04:46:11.042	{}
AqdYCUEoikAyOUo9DZnl	Mooca+XNOJQaJb6IILB6	pzqaHQvqee/g0B3pNj46	946	\N	2017-04-24 03:42:48.566	{}
+dXpUEnt5cnoUiVX+yGX	budgvhf/oqc9FWtiR59c	yCX8PcpJyMC/0fSa/UEt	170	\N	2017-04-25 17:29:24.423	{}
tYekKPk9fN7bnOyPgaSb	VErp5+HZdn3Yz2G88TZh	RAc5WNyF/IebKCQxvi0m	157	\N	2017-04-26 02:38:26.065	{}
TLDmHlIChd2Te4vTzXQC	+2fxb2EecC80U2DcxPMF	Rb+4vnuEzJHMz4oK5SlP	361	\N	2017-04-26 20:14:30.064	{}
XfRqCvAIy2ZYGOK86+AH	Hjjd3Ns0lvG3cs9jj4N7	pUZS6bfzCplu36OTqd9B	350	\N	2017-04-26 18:40:12.923	{}
A/py4Ru8PaDR0MzuRzor	3KOaA2+6IjmFPfm4ChIJ	2PerRxaH4fK6KrGP5Qwt	576	\N	2017-04-25 14:55:47.046	{}
w6dEXgNHwZtu2+eg/JXO	nbFMJA7w8Ms8VOsgI8Uj	gerwFbOK7rj2/sxav7TM	645	\N	2017-04-25 03:07:50.049	{}
+ZlgF4H88KazUlL7MBuK	y90eN2IFt6lwJmUaK9TF	2TCVHmuSSvPVS/NGck28	986	\N	2017-04-26 09:32:47.756	{}
hKpzmS8Uv5fOl9TB1XYP	YPGpbTqv9aeZHXxBNgIC	hqQHXHKP5BkW4sO5RoSV	268	\N	2017-04-26 07:23:33.925	{}
6JWmIBPYt6SQR/0tGsUS	sAxdggjzUR7+K6sSxnyU	WL8anNOZoBM6m6mQAXZU	413	\N	2017-04-24 20:02:29.19	{}
ZJkNyyPAKKLlYzIgkSX8	ljr+mdhFYpVziaRs0plq	ymsMzngU1IQvcDZCCQto	871	\N	2017-04-25 21:57:27.236	{}
wsmyR1UzSdKDQCZaWuvl	budgvhf/oqc9FWtiR59c	IStaor2VZBCC4YitNlq3	580	\N	2017-04-26 00:21:57.208	{}
1pr4eXQTKvkcYYaXg14F	VErp5+HZdn3Yz2G88TZh	xpU0XMNhwEaGm+pal9hc	44	\N	2017-04-24 18:22:19.288	{}
WRu44Ro6lG+ZuUPZEqpr	ZNerBKfcGYvzcUKaYlqg	wMmO8kppsab7n1WjSE/B	926	\N	2017-04-26 04:48:42.104	{}
IxfTyjFcPjdIYg7A6AIj	SBdioRVUMTzSJjoTQ8iG	Ti8Fr7laPnUtnXBbZDIi	564	\N	2017-04-24 11:10:42.05	{}
TbTcPj33kZimNGVjkY+P	ZNerBKfcGYvzcUKaYlqg	dj0yIOOu3Cc4exMrvCvr	65	\N	2017-04-25 23:46:29.285	{}
lxOfY27+2tsWYCrCZAg5	VErp5+HZdn3Yz2G88TZh	/8bydnemsbZ6PIE9HaAf	755	\N	2017-04-24 14:38:46.412	{}
/9iGILcGgXVihi0E+S/E	0/Dg4ohpw1BIoLvDgRkh	ocmBghNxWckrZ4fTlhuk	770	\N	2017-04-26 02:52:16.327	{}
PC/+Mshf2rMu74+QB9qD	YPGpbTqv9aeZHXxBNgIC	2CdS4rjMjTjxvr5jDXk+	398	\N	2017-04-24 11:05:23.637	{}
SvklrR/69h1NEcxeJBPg	/cFEfNMpFxRDc1+1PpSb	WJZehi9wbya5WdtJ6jmi	325	\N	2017-04-24 19:58:29.881	{}
XAPwAJSOqjK1ep6EE3Z9	3KOaA2+6IjmFPfm4ChIJ	UczLXNzUKSPiBor+Y1oL	558	\N	2017-04-24 23:19:48.214	{}
FdeQovOCBNsHYmspMRm0	sAxdggjzUR7+K6sSxnyU	Xg63oCrDld8T7hrSPaIr	757	\N	2017-04-26 18:56:35.255	{}
S0VHZmm3hTSk0VFu0T8C	VErp5+HZdn3Yz2G88TZh	+MwnavUgUpUHkc8af6R5	999	\N	2017-04-26 23:04:18.759	{}
Aa7jfSvtqEyJktvKJ7yY	y90eN2IFt6lwJmUaK9TF	NDb6Ri8u0F51nSUlE6H0	701	\N	2017-04-24 01:57:52.509	{}
fk8ILWr38Ql8zDx+MfqZ	CBp22Vfd78M4NgkRafEo	uDEBpLMaBaOSUZrYMJTp	376	\N	2017-04-24 02:47:10.793	{}
U9i6DnAyJKxtPWXtcpk8	kMjFmLjttJpQS3rzutBf	PULCBb6TKbdhkz3E++On	499	\N	2017-04-25 09:11:36.254	{}
FEHUX8qEV28tB+OXjU3u	Mooca+XNOJQaJb6IILB6	JNCUf59fexGE2RtFdeFl	156	\N	2017-04-25 11:46:51.976	{}
VP6wx+JId8YZagI+sNlo	VErp5+HZdn3Yz2G88TZh	0kdDzr3LnJry8zC1cU1W	628	\N	2017-04-26 01:29:13.261	{}
90zUckMJe+YTw3fGz5kx	kMjFmLjttJpQS3rzutBf	FNAtzuIkfq9ApkrdeNFM	901	\N	2017-04-25 14:04:15.342	{}
ZS9rRtw37pjpgCeIicHQ	y90eN2IFt6lwJmUaK9TF	9PID7ysZKZGFMXhcyY3b	792	\N	2017-04-24 19:42:45.916	{}
PANTzdQFpbL4/Se8l8h/	+2fxb2EecC80U2DcxPMF	HjTXXwBTFx8XPyM1k1jt	243	\N	2017-04-25 23:13:21.405	{}
rAatndV83x5qVqHExxD2	YPGpbTqv9aeZHXxBNgIC	hTGMbTZe/Oalm1bkZ9nT	467	\N	2017-04-25 17:10:07.127	{}
qkIV47ZzEeBTuAZqRTqR	y90eN2IFt6lwJmUaK9TF	MJ0LwHcCTowW4jJbBAfF	120	\N	2017-04-25 04:00:47.577	{}
ixIL9Mjkg5pXMoJKWxv0	kMjFmLjttJpQS3rzutBf	Ww+SwPycvd0cdKnIAHGW	407	\N	2017-04-25 16:53:31.505	{}
0JHAFjZlAhs3p+KBAgWr	/cFEfNMpFxRDc1+1PpSb	Hnc6d1cgHlwRPkHJzm+L	703	\N	2017-04-25 03:08:27.565	{}
EkN2w+MeLev8m35Jg2vD	budgvhf/oqc9FWtiR59c	Hnc6d1cgHlwRPkHJzm+L	681	\N	2017-04-24 09:58:43.299	{}
r9Ouhd940Dchdmq31xxj	y90eN2IFt6lwJmUaK9TF	VBHlcHQF4aYRjQ1CCYo+	478	\N	2017-04-25 18:01:13.977	{}
PXd+Ed78AFe16snxsEZu	ljr+mdhFYpVziaRs0plq	GkgxT5AlO55VPbcQ74CW	244	\N	2017-04-26 08:05:42.935	{}
wsBXfPlDtLW6V2QR2TX4	ljr+mdhFYpVziaRs0plq	uCzXZ/h+0lceva5eoAFl	589	\N	2017-04-24 17:42:27.844	{}
DiHcNtStgSuV/8SnhpCi	/cFEfNMpFxRDc1+1PpSb	eQYdo0lwWg/0maBPX6Ky	501	\N	2017-04-26 02:16:19.461	{}
T0HtlGN8SeYp946lLuTi	XklfmXtmNz7WRzaFwJPY	clfMGedLL8JpM3dWFCNq	611	\N	2017-04-26 15:06:31.291	{}
oesU9wrt0Bzj/IfQFcvU	+2fxb2EecC80U2DcxPMF	qI2FtRNCwudROWOOJZlq	670	\N	2017-04-26 13:02:17.817	{}
v1wJSHFMa6mYflfbCSxG	y90eN2IFt6lwJmUaK9TF	MguqgBqCIleOIqwlPNrn	342	\N	2017-04-24 23:08:39.11	{}
upOYRh+wgAQ+qO6C71/g	TMTdMrgBYgxYoTLKWv35	IZC4iG5HH0RGGiQcOMb5	343	\N	2017-04-24 19:48:28.605	{}
RgehqDCDE+teH5uA8VoQ	sAxdggjzUR7+K6sSxnyU	fdzah3/A9olQ1GKFPVue	91	\N	2017-04-25 11:26:23.063	{}
erQJUQoTTTzhljbkDuz5	YPGpbTqv9aeZHXxBNgIC	o+xN3I/a5Hv0i7ik4bDY	49	\N	2017-04-24 21:06:27.962	{}
tqiy/b5DBv9QFOXZsa8B	YPGpbTqv9aeZHXxBNgIC	8M+uHwKEP9zUbXSEbjrM	665	\N	2017-04-26 20:26:40.75	{}
ALxSkrfI/nEfCz4m9Unl	ZNerBKfcGYvzcUKaYlqg	y9S8oSUVDEAV8zdbB1bd	714	\N	2017-04-24 17:30:46.697	{}
zACBUIVv5MacJpYfV/ab	Hjjd3Ns0lvG3cs9jj4N7	5YiOCCzoJ2mJo02p1kvu	642	\N	2017-04-26 22:22:16.867	{}
89YbmDH/4aF5tjrDBoOJ	kMjFmLjttJpQS3rzutBf	cb4fsSmuKLOvsa9cl8wL	901	\N	2017-04-24 08:58:07.444	{}
UGOa01kN6fL7PwZ+w8MA	3KOaA2+6IjmFPfm4ChIJ	lC5a6Rn8k0EQ429xr5jH	411	\N	2017-04-25 12:01:56.016	{}
pK+WXtDtjsCZvHLcDfDU	3KOaA2+6IjmFPfm4ChIJ	SemUrsHT7EdO+EMDkrkX	999	\N	2017-04-26 23:56:10.42	{}
+uRun32Oa5K6lm86WRnC	kMjFmLjttJpQS3rzutBf	6c7CxJwbLV7ynVGRTVbJ	490	\N	2017-04-24 22:57:22.246	{}
UFp7MikhNcRs/SFv4FBv	0/Dg4ohpw1BIoLvDgRkh	BWY0/0m06DzvXxK+8k1Q	356	\N	2017-04-26 11:00:36.647	{}
sjKt/5+CGDxPKXVMgK7W	+2fxb2EecC80U2DcxPMF	kGFlLfdoEcyBGmUjYl2B	898	\N	2017-04-26 05:09:04.538	{}
lHDbJufsZ+JyKjYiPbOk	/cFEfNMpFxRDc1+1PpSb	fT7RpAWcTRVT+BYCfX+Z	109	\N	2017-04-26 05:08:07.429	{}
p9LgWfYThlqZympx/Ga+	ljr+mdhFYpVziaRs0plq	j8wpHa1dz9/2R58FIjas	966	\N	2017-04-25 08:56:13.629	{}
gwxnV9hL9yhY2IJH77RY	rc+ccdAK8F4ROpIC299B	YQzTnDdAtc6eW+V5kNlM	155	\N	2017-04-26 15:15:23.566	{}
e07PU1VFZ7BTOJgBu2ON	ljr+mdhFYpVziaRs0plq	vig5tN7rbCDvgPyZmJ99	302	\N	2017-04-24 04:50:26.242	{}
SFYNLMoNQfd4GSH4hyXQ	rc+ccdAK8F4ROpIC299B	KRQ4GarJX8r+Hr0vT+QP	365	\N	2017-04-24 08:58:44.288	{}
LL6bVRRt4STRreHJWcTh	ZNerBKfcGYvzcUKaYlqg	uPEFdvhuU7uBHnFA1i5Z	537	\N	2017-04-24 23:47:28.038	{}
EDtrEOpsBRzipf70CV6S	y90eN2IFt6lwJmUaK9TF	QE5m3KxzvLHfaC1d2pOH	949	\N	2017-04-25 23:25:44.913	{}
pNnpiWcYBIKl2cnKq7lV	XklfmXtmNz7WRzaFwJPY	8DaPh3gvcQcTmLjQw6lz	502	\N	2017-04-24 03:05:12.214	{}
JvvioL+962Om/I/cESVZ	SBdioRVUMTzSJjoTQ8iG	/C0qISaxJZxIMn5rVJKD	713	\N	2017-04-26 15:41:04.201	{}
Rd+lZtrFkL+bh+8m8pEw	XklfmXtmNz7WRzaFwJPY	GCLUq70/kcl8o7wTECso	74	\N	2017-04-26 17:59:03.037	{}
M2it0QzxsfRPEZ7ePoPO	0/Dg4ohpw1BIoLvDgRkh	mYExKKMHZR3kXvZZY8Cm	606	\N	2017-04-26 23:17:48.309	{}
xV2XnSOYaKYtSEn8B/Uf	SBdioRVUMTzSJjoTQ8iG	fsjDaeRHhimkDROH0uSo	488	\N	2017-04-24 07:42:49.055	{}
Yu51cjATfDXzSV4VRsHg	YPGpbTqv9aeZHXxBNgIC	4hmJ3xoD+cikoQ+/ShBx	491	\N	2017-04-24 16:37:39.327	{}
9UsnGLuIRzDzgcD9XdIS	Mooca+XNOJQaJb6IILB6	Rb+4vnuEzJHMz4oK5SlP	486	\N	2017-04-24 00:00:41.042	{}
q1XX6KqjY/A3qb7dvTLe	SBdioRVUMTzSJjoTQ8iG	pUZS6bfzCplu36OTqd9B	930	\N	2017-04-24 04:36:47.62	{}
W13eQ3GxgDBUqqDkHRCI	YPGpbTqv9aeZHXxBNgIC	2PerRxaH4fK6KrGP5Qwt	419	\N	2017-04-24 22:14:12.089	{}
GORsiJMeKdwGUPkThqXC	XklfmXtmNz7WRzaFwJPY	gerwFbOK7rj2/sxav7TM	736	\N	2017-04-25 12:58:53.196	{}
gpsbHsmV173rUMPpG+Hw	+2fxb2EecC80U2DcxPMF	clX6Pr6Dseqcg6rG6R+p	475	\N	2017-04-24 13:52:58.549	{}
niR4GDi52A3sewnNlUYr	ljr+mdhFYpVziaRs0plq	SUG1SDEbNmeTtzMYgIiy	443	\N	2017-04-24 06:13:31.298	{}
GaHV461K0yzy6fKSRi3h	Mooca+XNOJQaJb6IILB6	R3+Kafw3nB64d6cNtz6p	124	\N	2017-04-25 18:58:37.432	{}
ORJZnelYsmxmG6smZWhD	/cFEfNMpFxRDc1+1PpSb	ymsMzngU1IQvcDZCCQto	707	\N	2017-04-26 06:47:10.933	{}
9UYFAg9MUBq2SAHL8eC5	Hjjd3Ns0lvG3cs9jj4N7	IStaor2VZBCC4YitNlq3	411	\N	2017-04-24 14:32:13.797	{}
sy9gxemBv0a4fEiLx4KY	VErp5+HZdn3Yz2G88TZh	xpU0XMNhwEaGm+pal9hc	394	\N	2017-04-25 23:57:43.709	{}
l4MT8svpZYMrqlgb4vnO	y90eN2IFt6lwJmUaK9TF	BdY4jNLot5Qg/el9YDzg	109	\N	2017-04-26 07:57:04.212	{}
JBDLxHDbyUqlbQvRB8UV	y90eN2IFt6lwJmUaK9TF	D5HmQl9D2u9DEcoKhcuR	640	\N	2017-04-24 14:06:06.533	{}
KIPSOUzO3h2Su4eygYaa	nbFMJA7w8Ms8VOsgI8Uj	TRfmmjCxHNcRKi0Gh+NJ	92	\N	2017-04-25 10:58:04.805	{}
93I1/qnKAFqO8oSp65sn	3KOaA2+6IjmFPfm4ChIJ	FuFsrNIyD5fyc3cn5roA	554	\N	2017-04-25 22:52:33.594	{}
Gv4ksRNhX+pi3RIiM0V6	VErp5+HZdn3Yz2G88TZh	ocmBghNxWckrZ4fTlhuk	463	\N	2017-04-25 12:37:26.783	{}
evF11mDeZFqcRhYC575j	nbFMJA7w8Ms8VOsgI8Uj	G7CHn9TOjUUnhyYVmoZG	941	\N	2017-04-26 07:12:20.545	{}
4/G13aeC21kGV3HSCtsP	/cFEfNMpFxRDc1+1PpSb	bLFa4S8BjWZFHzr/ii8E	124	\N	2017-04-26 04:45:33.993	{}
XTz5dWWbHW57W+BJV9ir	+2fxb2EecC80U2DcxPMF	UczLXNzUKSPiBor+Y1oL	936	\N	2017-04-24 08:23:55.421	{}
xjGBb3eM5RCizi4ZMRZa	/cFEfNMpFxRDc1+1PpSb	Xg63oCrDld8T7hrSPaIr	102	\N	2017-04-24 20:43:06.375	{}
K55d3wyBVVZwUEXnbImw	0/Dg4ohpw1BIoLvDgRkh	+MwnavUgUpUHkc8af6R5	864	\N	2017-04-26 15:06:39.782	{}
TD6JB4FibYzRwVpxJ6t7	kMjFmLjttJpQS3rzutBf	NDb6Ri8u0F51nSUlE6H0	926	\N	2017-04-25 18:14:44.9	{}
BONd+wxQ7yfhIa2tlq0n	ljr+mdhFYpVziaRs0plq	pW/6IftIOg2Yxz/0lIqn	943	\N	2017-04-26 00:47:35.949	{}
2DsgSyjWigZ5zpd6i0We	Mooca+XNOJQaJb6IILB6	RruT5++9Eso47ZM6jnyW	218	\N	2017-04-26 21:33:08.227	{}
kA3mStSA8Qv6qihlMjjM	y90eN2IFt6lwJmUaK9TF	Ce3gHT/m1USeJFR0EeyX	541	\N	2017-04-25 07:33:35.299	{}
jUGOQ1ewZKFlNf9A6Fzm	/cFEfNMpFxRDc1+1PpSb	sjjZCufqioecHEPOpKIP	154	\N	2017-04-24 03:28:50.593	{}
6BanJCYEcK+VNt+ziuik	ljr+mdhFYpVziaRs0plq	+EdbyY8N/olnsFkkzbXB	968	\N	2017-04-24 05:22:53.491	{}
cqH3og0dx1VALAjDckp4	nbFMJA7w8Ms8VOsgI8Uj	1nN3SsIefEwI4KPJp0/i	267	\N	2017-04-25 01:02:49.916	{}
XE6HNTivgPk9rmrOSeHE	sAxdggjzUR7+K6sSxnyU	bbV0S9TaH41W5cUUc/xR	640	\N	2017-04-24 02:30:32.298	{}
PcFYljdapiKLr11f/Jn3	ZNerBKfcGYvzcUKaYlqg	Vhi0Pgnt0f/iJYVVqlDV	949	\N	2017-04-25 20:11:30.426	{}
DIw2SkSkvskeurenVmJL	/cFEfNMpFxRDc1+1PpSb	MJ0LwHcCTowW4jJbBAfF	163	\N	2017-04-25 19:11:07.07	{}
Fjc5QL3Atjq37nP9LLhj	ZNerBKfcGYvzcUKaYlqg	CvsbSQDYtfA8zrZnPe6L	116	\N	2017-04-26 06:32:19.058	{}
q4TZx3iGQVjwQXOZwlyS	kMjFmLjttJpQS3rzutBf	4vF7okM8tNQczNYSx9QH	600	\N	2017-04-26 09:56:48.504	{}
WnIBBdvQkU32mqxmkj72	YPGpbTqv9aeZHXxBNgIC	rMCVBZsp/pS2KB+aHHoM	334	\N	2017-04-25 07:16:15.426	{}
fIVtJbgizoqJ28UYyTcx	CBp22Vfd78M4NgkRafEo	GkgxT5AlO55VPbcQ74CW	794	\N	2017-04-26 12:19:27.312	{}
weTQ/fGFjo5xTN07nPjJ	budgvhf/oqc9FWtiR59c	uCzXZ/h+0lceva5eoAFl	808	\N	2017-04-24 14:39:33.849	{}
ZjpbWSfztAn05wX/NBg2	ljr+mdhFYpVziaRs0plq	7pZJtQXHPm1RcCN7zNdR	634	\N	2017-04-26 17:27:41.749	{}
47I76vt1zTE85cNT075B	Mooca+XNOJQaJb6IILB6	clfMGedLL8JpM3dWFCNq	768	\N	2017-04-25 08:03:47.874	{}
YxsVcpcjumQiZ9YjFG6C	ljr+mdhFYpVziaRs0plq	qI2FtRNCwudROWOOJZlq	213	\N	2017-04-25 16:59:22.715	{}
hM8O3To0jeiJhlTV+xqM	Hjjd3Ns0lvG3cs9jj4N7	MguqgBqCIleOIqwlPNrn	905	\N	2017-04-25 22:22:04.568	{}
qROgdsgxenD0zN0X0IEj	Mooca+XNOJQaJb6IILB6	IZC4iG5HH0RGGiQcOMb5	236	\N	2017-04-25 04:58:27.615	{}
9SsdYWwUGS21HmQ/n/gB	kMjFmLjttJpQS3rzutBf	fdzah3/A9olQ1GKFPVue	857	\N	2017-04-25 18:21:58.282	{}
CNOJVDQssAPx0AVF2jzE	kMjFmLjttJpQS3rzutBf	fdzah3/A9olQ1GKFPVue	959	\N	2017-04-25 21:31:31.935	{}
pQ0YwzU2e/bqBOcweH1X	0/Dg4ohpw1BIoLvDgRkh	KDJhMSnr1eiypx8bJOQY	462	\N	2017-04-26 09:10:01.186	{}
13IstolT0oGrMaZ0MexX	VErp5+HZdn3Yz2G88TZh	8M+uHwKEP9zUbXSEbjrM	510	\N	2017-04-24 19:09:13.897	{}
iFjzJSs0uGkg7JfZiOL/	TMTdMrgBYgxYoTLKWv35	A7uTJsWcGv90N9jqq2aX	499	\N	2017-04-26 11:40:43.36	{}
Qqkv4upBeaJpTWuye2Kr	CBp22Vfd78M4NgkRafEo	UI2CoZVy16uWrilGL82b	633	\N	2017-04-25 20:31:06.433	{}
yCZgn34mWs+XjW2b27cQ	budgvhf/oqc9FWtiR59c	wwzNXoLPLuKAWezxNBlD	698	\N	2017-04-24 19:11:25.616	{}
+MS/Z8XsV8zZY5T0tvzt	kMjFmLjttJpQS3rzutBf	lC5a6Rn8k0EQ429xr5jH	457	\N	2017-04-26 22:34:30.442	{}
mROu5y62xfObHyy/PEP7	0/Dg4ohpw1BIoLvDgRkh	SemUrsHT7EdO+EMDkrkX	853	\N	2017-04-25 22:26:54.623	{}
MbU+FIWxwd5ui6bUjjp+	VErp5+HZdn3Yz2G88TZh	/HbDAxDTaPCsDW/pnuVS	403	\N	2017-04-25 22:45:17.065	{}
FWRYeMs1pM2LvarbP8R2	Mooca+XNOJQaJb6IILB6	VXcjJXfnlk7KKrAAVuuu	983	\N	2017-04-26 04:22:43.469	{}
V851Us+79ZDRMuMGG38F	nbFMJA7w8Ms8VOsgI8Uj	/oUY19a2GQFVOwBcOhKX	2	\N	2017-04-26 13:03:53.775	{}
cguDnM20ek+wnKqeaFXu	TMTdMrgBYgxYoTLKWv35	j8wpHa1dz9/2R58FIjas	0	\N	2017-04-25 23:37:16.986	{}
qlEjYwCypEmWsjAzGzc6	ZNerBKfcGYvzcUKaYlqg	QER/vEICwOqelKRmFewa	669	\N	2017-04-24 18:19:42.774	{}
3yszyvj9/ATEGo2JxmZm	/cFEfNMpFxRDc1+1PpSb	YQzTnDdAtc6eW+V5kNlM	482	\N	2017-04-24 12:56:10.475	{}
W5vzJOZwUtJmXcJOnX/z	Hjjd3Ns0lvG3cs9jj4N7	JFyRiRsMtvSDilgBvCJH	95	\N	2017-04-26 23:45:27.667	{}
qY2LMOCJACdOVNv8T8xC	0/Dg4ohpw1BIoLvDgRkh	uPo+ls/nuLTv/aiymjpc	359	\N	2017-04-26 07:08:13.632	{}
RM9E5QHf1K5Qqu/A2r5m	SBdioRVUMTzSJjoTQ8iG	YLN08iEuZj4o5R4ynFgJ	113	\N	2017-04-24 04:00:13.65	{}
WmhJOeXRkWZhKyLIpWEq	SBdioRVUMTzSJjoTQ8iG	8DaPh3gvcQcTmLjQw6lz	222	\N	2017-04-26 18:55:04.7	{}
maK7XmSJzf+ClBLuuATn	Mooca+XNOJQaJb6IILB6	8DaPh3gvcQcTmLjQw6lz	997	\N	2017-04-25 07:43:44.86	{}
mTXrswnWZVweyQVwYs1F	3KOaA2+6IjmFPfm4ChIJ	/C0qISaxJZxIMn5rVJKD	278	\N	2017-04-26 04:02:47.554	{}
8DkaLaBqQI3hrU0kcWEQ	nbFMJA7w8Ms8VOsgI8Uj	GCLUq70/kcl8o7wTECso	590	\N	2017-04-26 20:10:07.338	{}
cu0bEE4XZ2/Opx6Zz0WY	3KOaA2+6IjmFPfm4ChIJ	mYExKKMHZR3kXvZZY8Cm	261	\N	2017-04-25 21:37:55.176	{}
+JQkPiUjSnZFsY/l2pbJ	sAxdggjzUR7+K6sSxnyU	fsjDaeRHhimkDROH0uSo	618	\N	2017-04-24 00:40:02.737	{}
N68EP7xLF9zX6x//WHpt	/cFEfNMpFxRDc1+1PpSb	JiKphT9AsRwm42Va3OvS	549	\N	2017-04-24 06:02:41.961	{}
MMCszdOlYGrQU1kHJuG4	YPGpbTqv9aeZHXxBNgIC	FJ5r92gjvOd2d0iUhZJM	753	\N	2017-04-26 05:33:53.407	{}
ETAIiQBqNTmYlWs360Jr	VErp5+HZdn3Yz2G88TZh	idh9OQ6SIbE99dmoxoyD	961	\N	2017-04-25 18:36:45.408	{}
GT7JFugVZsYv/JLD7zhU	Hjjd3Ns0lvG3cs9jj4N7	gerwFbOK7rj2/sxav7TM	28	\N	2017-04-26 08:18:13.022	{}
rkMrIGThO1N2s/eCGuFQ	VErp5+HZdn3Yz2G88TZh	hqQHXHKP5BkW4sO5RoSV	831	\N	2017-04-24 11:11:18.866	{}
ctXcZ04xwdEVyb7vTQey	rc+ccdAK8F4ROpIC299B	b7mt8ZygJxJImA1Jjov9	320	\N	2017-04-25 13:16:03.622	{}
Kbz8KamDJ3XdJk1+6y8a	VErp5+HZdn3Yz2G88TZh	sp639f+5Nq2drx50ElyL	166	\N	2017-04-26 08:13:49.927	{}
nJiAcXTSVhf771yk6t76	Hjjd3Ns0lvG3cs9jj4N7	NVXJ778lSXzucIhJdTQn	302	\N	2017-04-24 15:49:07.752	{}
+DCzKLhlkV5tryKQeNso	kMjFmLjttJpQS3rzutBf	2Zd5j1kN3amM0c+EavdD	906	\N	2017-04-24 04:43:25.893	{}
RJqiWr189mBkTFW/JQ4y	budgvhf/oqc9FWtiR59c	xpU0XMNhwEaGm+pal9hc	223	\N	2017-04-26 10:06:07.111	{}
s0OCSeVeTAq+a99qeZbN	sAxdggjzUR7+K6sSxnyU	BdY4jNLot5Qg/el9YDzg	431	\N	2017-04-24 08:14:44.826	{}
rcgLhBhDQF5B7bSdIDl5	CBp22Vfd78M4NgkRafEo	D5HmQl9D2u9DEcoKhcuR	955	\N	2017-04-24 12:10:59.606	{}
yc0QweJCsrQmWx0FVA0o	sAxdggjzUR7+K6sSxnyU	TRfmmjCxHNcRKi0Gh+NJ	485	\N	2017-04-24 00:17:21.509	{}
QjwPhrpfhxzHF21aHCSU	XklfmXtmNz7WRzaFwJPY	Gu4LTbW72m9jLkrtyTKP	337	\N	2017-04-25 09:09:36.919	{}
9Me4yWquWcaOf9z+s106	0/Dg4ohpw1BIoLvDgRkh	3Y2+ssPUZIBhL3DLNgtV	845	\N	2017-04-26 02:57:06.566	{}
UAUx6aFwD6hwrke9y40n	budgvhf/oqc9FWtiR59c	zeNYSwQcreNIDwDi1Wxd	541	\N	2017-04-25 14:11:33.84	{}
AuhlVrVgf6HOBTurNcIB	+2fxb2EecC80U2DcxPMF	yqs2NjrEc5urGA2MDjCW	266	\N	2017-04-25 11:00:55.398	{}
+EEQR0tXSKuhneb/PkKh	XklfmXtmNz7WRzaFwJPY	4hbbUkuC/FIrOMWSLs6A	934	\N	2017-04-26 01:13:55.638	{}
rzjsN5dlCaPzX1lcF/MC	nbFMJA7w8Ms8VOsgI8Uj	nb4xmYvuBqr33jCsuFiF	778	\N	2017-04-25 01:22:05.985	{}
5LJ1c/v13h9M46OtH6i2	XklfmXtmNz7WRzaFwJPY	e75r6knrluXB5FEMmWvj	879	\N	2017-04-25 12:30:11.07	{}
nGtQTxYUsptjT7KRXa5v	ljr+mdhFYpVziaRs0plq	pW/6IftIOg2Yxz/0lIqn	763	\N	2017-04-25 16:11:41.15	{}
yO2I+QIWdezyi1uVJXA0	ZNerBKfcGYvzcUKaYlqg	xqV2Sb04tBodIPV9twXY	648	\N	2017-04-25 22:08:21.825	{}
9iIsG0O02l3GPbXaJpeQ	ZNerBKfcGYvzcUKaYlqg	wr8mAVWTJaU3yB8njUzX	676	\N	2017-04-25 21:33:08.307	{}
9ZlxsojwjKSlR+oUCooT	YPGpbTqv9aeZHXxBNgIC	sjjZCufqioecHEPOpKIP	922	\N	2017-04-26 06:14:12.292	{}
oeVHIbsI4ulQE3X7Xldb	VErp5+HZdn3Yz2G88TZh	+EdbyY8N/olnsFkkzbXB	7	\N	2017-04-26 13:03:21.878	{}
f+QS6um1Ro9J2AK7dB7I	YPGpbTqv9aeZHXxBNgIC	9PID7ysZKZGFMXhcyY3b	979	\N	2017-04-24 20:58:39.125	{}
z2059fSKJAovxNJV/guG	CBp22Vfd78M4NgkRafEo	bbV0S9TaH41W5cUUc/xR	756	\N	2017-04-25 10:15:41.807	{}
bvQ9u1+AweLtB6ODd/nT	XklfmXtmNz7WRzaFwJPY	hMU/P36hWfY/xbtIpumu	600	\N	2017-04-26 15:09:38.958	{}
P/1eOG8HVgnh7AeMmcnz	kMjFmLjttJpQS3rzutBf	hTGMbTZe/Oalm1bkZ9nT	429	\N	2017-04-24 15:18:26.445	{}
d81d0nrT3HV5DqmTY3JR	+2fxb2EecC80U2DcxPMF	iYBjNh82z2SK5H9M/YPK	464	\N	2017-04-24 05:43:13.831	{}
3Dc6tfG++oL2yzB59LQK	kMjFmLjttJpQS3rzutBf	A+n+44JWga5H6BY+p1bC	952	\N	2017-04-24 02:29:40.404	{}
kNqLGAKdBrzBxMJCQs5a	y90eN2IFt6lwJmUaK9TF	CvsbSQDYtfA8zrZnPe6L	83	\N	2017-04-24 07:03:02.915	{}
/aWjvBXcABtWsvE9Xs4F	nbFMJA7w8Ms8VOsgI8Uj	oqH7I/342a8ecO0ty6fR	611	\N	2017-04-25 09:09:25.299	{}
J+lVv/GddCXlMoIyo0/r	0/Dg4ohpw1BIoLvDgRkh	VBHlcHQF4aYRjQ1CCYo+	467	\N	2017-04-26 03:08:45.326	{}
7xutB0SvpA2JQgz7/7wI	VErp5+HZdn3Yz2G88TZh	8mZiabWksAbmv9Y7hZNh	247	\N	2017-04-26 05:42:43.039	{}
Di7ztgGEqYhSYvlSLVgK	VErp5+HZdn3Yz2G88TZh	FslrTC6TqYUZ1P11q9Or	354	\N	2017-04-25 12:01:46.752	{}
sIKxp22SC/5lM0nWBq7O	TMTdMrgBYgxYoTLKWv35	eQYdo0lwWg/0maBPX6Ky	639	\N	2017-04-25 08:25:59.474	{}
JSkd4wBZou7u3vd/E5/q	Hjjd3Ns0lvG3cs9jj4N7	qI2FtRNCwudROWOOJZlq	625	\N	2017-04-24 03:30:26.995	{}
cxSNHolsLpuZd37MXttH	nbFMJA7w8Ms8VOsgI8Uj	MguqgBqCIleOIqwlPNrn	473	\N	2017-04-25 16:01:00.296	{}
p3O9OJmZ30nAmzjGkHGS	y90eN2IFt6lwJmUaK9TF	IZC4iG5HH0RGGiQcOMb5	793	\N	2017-04-26 00:29:54.157	{}
0zQWzrvMdpdznKzsHTmQ	+2fxb2EecC80U2DcxPMF	LODAslONfvPu2wITGZoJ	43	\N	2017-04-26 21:38:43.126	{}
jKBRoww4qEftIUTQmzR8	budgvhf/oqc9FWtiR59c	fgitB1bKB2fA2EOY/0oz	636	\N	2017-04-26 15:17:02.624	{}
fwrRMhuKswWKbFX9RIe+	ZNerBKfcGYvzcUKaYlqg	KDJhMSnr1eiypx8bJOQY	961	\N	2017-04-26 12:33:43.799	{}
Kmy5Mv4Np3GALVdvKK1W	nbFMJA7w8Ms8VOsgI8Uj	wcBZD3vVwQN69RQpQ4Wn	164	\N	2017-04-26 20:19:35.681	{}
hwj7NfyW5hGaoXqTJR9u	+2fxb2EecC80U2DcxPMF	A7uTJsWcGv90N9jqq2aX	563	\N	2017-04-25 14:01:18.853	{}
tGLB/CUNF+DxUu/p9c+L	CBp22Vfd78M4NgkRafEo	5YiOCCzoJ2mJo02p1kvu	878	\N	2017-04-26 13:37:45.346	{}
VPL9Stw9HGu52mCgk+zm	budgvhf/oqc9FWtiR59c	teHOEl79foxJD3bAW7yN	715	\N	2017-04-25 18:54:28.444	{}
WD7Z7l7uf0qr34YFm+m9	sAxdggjzUR7+K6sSxnyU	4T2/FEU1rk9EBkOM4WS/	968	\N	2017-04-26 17:11:08.478	{}
GyVCSnHbEUcXONqTqVUu	kMjFmLjttJpQS3rzutBf	wtnJ2wRu5rcRYbEJ6Nc/	144	\N	2017-04-25 07:28:32.903	{}
k4HJrFGUjP4sNJPsRnie	+2fxb2EecC80U2DcxPMF	5D6s/vZh8AlWzlV/nXj0	274	\N	2017-04-26 03:16:51.535	{}
hCeVxGK75oR8Az9R5BV1	/cFEfNMpFxRDc1+1PpSb	BWY0/0m06DzvXxK+8k1Q	814	\N	2017-04-26 13:20:26.46	{}
CaVQI50oxBu3ruOEUjZ+	kMjFmLjttJpQS3rzutBf	kGFlLfdoEcyBGmUjYl2B	506	\N	2017-04-25 02:40:37.463	{}
mP1j2fNRu6zVZf6jrI49	0/Dg4ohpw1BIoLvDgRkh	fT7RpAWcTRVT+BYCfX+Z	558	\N	2017-04-26 16:43:17.389	{}
nLi5kD2skOARd4IHfjDe	SBdioRVUMTzSJjoTQ8iG	z1RXieIeobPEinZ0UBIE	529	\N	2017-04-24 06:25:42.713	{}
lGyl+JEVd9bcHGm93o6P	Hjjd3Ns0lvG3cs9jj4N7	vig5tN7rbCDvgPyZmJ99	381	\N	2017-04-26 05:57:20.337	{}
yYlEgwaoZFS294yjNogs	SBdioRVUMTzSJjoTQ8iG	JFyRiRsMtvSDilgBvCJH	64	\N	2017-04-24 20:03:57.172	{}
CLjHJKeQqoWzGE6xAG50	ljr+mdhFYpVziaRs0plq	uPo+ls/nuLTv/aiymjpc	848	\N	2017-04-24 01:19:22.334	{}
GS96vifRccE/qH7ZAg60	ZNerBKfcGYvzcUKaYlqg	QE5m3KxzvLHfaC1d2pOH	470	\N	2017-04-24 18:01:39.023	{}
074ur2ZBH7VydKiuG3Y9	+2fxb2EecC80U2DcxPMF	8DaPh3gvcQcTmLjQw6lz	929	\N	2017-04-24 20:52:22.787	{}
TlcaeT/HdwLXVOwnBgSt	budgvhf/oqc9FWtiR59c	pAicfBcVhCd/NLtWSuOC	57	\N	2017-04-26 11:31:10.795	{}
l4QhM/RK3AahbvjIe4Iu	nbFMJA7w8Ms8VOsgI8Uj	C2xfD52JW39BNy7L51R8	429	\N	2017-04-24 10:01:32.313	{}
1PENH0H+njMk211TSvYI	XklfmXtmNz7WRzaFwJPY	pzqaHQvqee/g0B3pNj46	772	\N	2017-04-24 18:39:26.145	{}
unQcao3dvYZ49SmVvrIX	ZNerBKfcGYvzcUKaYlqg	VYU0Y6j2zI5AaOt4+lbk	900	\N	2017-04-25 14:38:20.042	{}
KKPWa26cQzqp2ayUSsBk	3KOaA2+6IjmFPfm4ChIJ	JiKphT9AsRwm42Va3OvS	226	\N	2017-04-26 22:25:31.466	{}
TSs4McmKRxJ98JddUQac	nbFMJA7w8Ms8VOsgI8Uj	FJ5r92gjvOd2d0iUhZJM	774	\N	2017-04-25 08:16:59.499	{}
r4vr7VJULuXSkuo31pY6	Mooca+XNOJQaJb6IILB6	idh9OQ6SIbE99dmoxoyD	346	\N	2017-04-24 02:27:27.859	{}
6n7UM3Zt61JMHdg0NkhR	Hjjd3Ns0lvG3cs9jj4N7	ml79vK7Q1Qa05idsnFGB	276	\N	2017-04-26 07:27:46.563	{}
H2A+vcjZPQG4fP0LFXIF	budgvhf/oqc9FWtiR59c	2TCVHmuSSvPVS/NGck28	811	\N	2017-04-24 23:11:12.277	{}
f1W1D5RTNUTxq/tH53MW	+2fxb2EecC80U2DcxPMF	hqQHXHKP5BkW4sO5RoSV	747	\N	2017-04-24 05:56:25.521	{}
o9ZteWGVNOILvwbXkypR	ZNerBKfcGYvzcUKaYlqg	b7mt8ZygJxJImA1Jjov9	113	\N	2017-04-26 04:13:00.802	{}
O3Qaxo0Pa05CmPEaN1AN	Hjjd3Ns0lvG3cs9jj4N7	sp639f+5Nq2drx50ElyL	393	\N	2017-04-26 04:44:20.113	{}
c/0hlUi+M774p59qUNDV	Mooca+XNOJQaJb6IILB6	IStaor2VZBCC4YitNlq3	410	\N	2017-04-25 12:10:28.779	{}
hpj1m+5wszKBTa3MbfOt	budgvhf/oqc9FWtiR59c	xpU0XMNhwEaGm+pal9hc	999	\N	2017-04-26 11:41:12.002	{}
G1mMDHDvs+B/cCc5CzQi	YPGpbTqv9aeZHXxBNgIC	wMmO8kppsab7n1WjSE/B	460	\N	2017-04-26 06:19:51.09	{}
+XGWK4kgLUvd8OpRd6MJ	ZNerBKfcGYvzcUKaYlqg	Ti8Fr7laPnUtnXBbZDIi	887	\N	2017-04-26 19:26:23.973	{}
suOgNXpHoBd4qsoB0d8v	ZNerBKfcGYvzcUKaYlqg	dj0yIOOu3Cc4exMrvCvr	683	\N	2017-04-26 18:22:05.736	{}
rccdBBAlO+FsdQO6MK1A	Hjjd3Ns0lvG3cs9jj4N7	TRfmmjCxHNcRKi0Gh+NJ	607	\N	2017-04-25 08:00:45.16	{}
Lxt7IgJkaBrVcASvMIv/	TMTdMrgBYgxYoTLKWv35	FuFsrNIyD5fyc3cn5roA	307	\N	2017-04-24 18:22:52.545	{}
oFjT7NBUxsCoWGd6uAvA	XklfmXtmNz7WRzaFwJPY	ocmBghNxWckrZ4fTlhuk	0	\N	2017-04-25 21:06:29.749	{}
2c039bstyNfpFcn3Q5j2	CBp22Vfd78M4NgkRafEo	BTHuAqP0IFDIVsnnrF30	818	\N	2017-04-25 06:06:03.871	{}
qkrhB2/YvaEsvpmbDW0I	Hjjd3Ns0lvG3cs9jj4N7	WJZehi9wbya5WdtJ6jmi	845	\N	2017-04-25 06:22:01.709	{}
SFGC5R4gKP0SxC0y1qdr	SBdioRVUMTzSJjoTQ8iG	UczLXNzUKSPiBor+Y1oL	921	\N	2017-04-24 15:46:28.481	{}
Ir2Rd+2GiCF7mNt+OTm4	SBdioRVUMTzSJjoTQ8iG	nb4xmYvuBqr33jCsuFiF	306	\N	2017-04-25 02:33:03.771	{}
q89s8KJtdlVY1WmqSVuh	kMjFmLjttJpQS3rzutBf	e75r6knrluXB5FEMmWvj	978	\N	2017-04-26 13:48:03.622	{}
T8R83GcRmnJY54bNMUsv	YPGpbTqv9aeZHXxBNgIC	Py7ahqrY/1JieQPbPKHJ	849	\N	2017-04-25 11:04:20.127	{}
vKyY4X+AefGh7mK/bp1b	YPGpbTqv9aeZHXxBNgIC	pW/6IftIOg2Yxz/0lIqn	234	\N	2017-04-24 01:31:53.131	{}
WAa04hLTHGW3Suc1mter	/cFEfNMpFxRDc1+1PpSb	RruT5++9Eso47ZM6jnyW	731	\N	2017-04-25 23:27:39.321	{}
0XgHrsi928Eiu9Oj7Y/G	0/Dg4ohpw1BIoLvDgRkh	77Gx6+xBsHiXz2UMbrGQ	44	\N	2017-04-25 22:37:10.378	{}
6u/VT2Xjym8rxgJteyCD	0/Dg4ohpw1BIoLvDgRkh	JNCUf59fexGE2RtFdeFl	612	\N	2017-04-24 15:19:49.396	{}
a0uHOx20qj4o64zmviiU	nbFMJA7w8Ms8VOsgI8Uj	0kdDzr3LnJry8zC1cU1W	187	\N	2017-04-24 22:27:07.642	{}
bsiZPRBuglMUihS3eLHF	y90eN2IFt6lwJmUaK9TF	FNAtzuIkfq9ApkrdeNFM	545	\N	2017-04-25 23:57:07.34	{}
5AGFPA/raKOUcg5w1CyG	Hjjd3Ns0lvG3cs9jj4N7	0RaytChooMqyxUOYZn39	321	\N	2017-04-24 05:54:15.536	{}
21yNlg73AVJd02LAZk4v	TMTdMrgBYgxYoTLKWv35	hMU/P36hWfY/xbtIpumu	621	\N	2017-04-26 19:06:04.184	{}
s++RbWknl4HbUu5i32ds	XklfmXtmNz7WRzaFwJPY	hTGMbTZe/Oalm1bkZ9nT	166	\N	2017-04-24 04:14:44.999	{}
86LPcNUa5jUYxnyY7d8Y	sAxdggjzUR7+K6sSxnyU	muH3+mbrGNEZz3RN28C/	693	\N	2017-04-26 23:13:16.055	{}
imENEQ67XCsKmFCH1xHG	TMTdMrgBYgxYoTLKWv35	bbV0S9TaH41W5cUUc/xR	23	\N	2017-04-26 12:49:34.03	{}
CFTpt/6r4oON8DGjg/1s	y90eN2IFt6lwJmUaK9TF	Vhi0Pgnt0f/iJYVVqlDV	590	\N	2017-04-26 04:56:54.383	{}
NbVeB2yxHw2Mz66j51ol	nbFMJA7w8Ms8VOsgI8Uj	RJ+mY3NeSMG33Im2nMWe	450	\N	2017-04-25 16:57:14.585	{}
QNXbkeax/Zfe8G0ob+6I	+2fxb2EecC80U2DcxPMF	+YahB8dn45dWgxbQKPo2	288	\N	2017-04-25 20:31:59.865	{}
i6JEUXaQYRmdmly43kqs	CBp22Vfd78M4NgkRafEo	1Fuuc0ItfmiFbsZcYc//	152	\N	2017-04-26 08:27:25.495	{}
V50OejEa+ioY0WXHLTPI	nbFMJA7w8Ms8VOsgI8Uj	Ej1dsATXZFPrH1nNKhSh	977	\N	2017-04-26 18:03:18.833	{}
HooGajsaO0ykx1bUbVBg	ljr+mdhFYpVziaRs0plq	USG2aFuCA3eXVKAwFdSB	608	\N	2017-04-24 09:51:33.739	{}
ptqmFfor+A+wGxENI78E	0/Dg4ohpw1BIoLvDgRkh	bvZfMZ5UNxXhczbWj57k	458	\N	2017-04-26 19:14:50.879	{}
I+CStIKzhYtUCmsbMoei	/cFEfNMpFxRDc1+1PpSb	56ZhLQV0ZO55MYlrpJ0/	879	\N	2017-04-24 15:09:52.841	{}
Gyc2SacZzsuSNZrkjNNs	sAxdggjzUR7+K6sSxnyU	bfNEf7WaxhTBCSyrYFGF	812	\N	2017-04-24 22:38:42.672	{}
3dOTfJMRJrK319LfRAQo	YPGpbTqv9aeZHXxBNgIC	+2g4HO+WW0WceYVvgaeU	962	\N	2017-04-25 00:29:40.44	{}
H/1idzGK7Lzs29/ARkcF	XklfmXtmNz7WRzaFwJPY	SPix0928XawGZzUL6Kk/	865	\N	2017-04-25 00:56:25.323	{}
FpG4q4TBwd5V8NEd3+hV	0/Dg4ohpw1BIoLvDgRkh	06JaNcOUnLo4c+wfGISx	279	\N	2017-04-26 09:22:25.222	{}
YpLMxctTzhq3V0afc9fg	XklfmXtmNz7WRzaFwJPY	J9/bsP6mcTr4HIaK8KJC	974	\N	2017-04-25 20:54:05.182	{}
8e/DyM8Hu+nwjqAA2m5B	ljr+mdhFYpVziaRs0plq	dV2BZuZmeqwSCYYMeSgu	479	\N	2017-04-26 10:46:09.561	{}
6Yl5rKwc2APM6rq1M+ey	Hjjd3Ns0lvG3cs9jj4N7	at2Ldk9Pzrwqgc4PXVdk	811	\N	2017-04-26 09:08:39.759	{}
3xno3nslr0UOn13Ad4bK	+2fxb2EecC80U2DcxPMF	gYySmHDQFnlSeSTMFmzt	728	\N	2017-04-24 21:10:01.188	{}
T5q73CPMEjI4DcybkfNs	kMjFmLjttJpQS3rzutBf	i2RB16CZOdxMbDrWP8JC	374	\N	2017-04-26 04:02:02.037	{}
YCQqMssekcuTP/ncKgFm	kMjFmLjttJpQS3rzutBf	oFHzW7M8uHrJzroQVXxH	203	\N	2017-04-26 03:05:22.497	{}
Aq8IWqIDZHLq01DwaTvW	SBdioRVUMTzSJjoTQ8iG	jthlSSB+N6sxxq0WFj6i	124	\N	2017-04-25 08:42:03.719	{}
QHYinua4Ap7xBigR8zKF	CBp22Vfd78M4NgkRafEo	jbhoeFjdjBV/VrTmAQK8	999	\N	2017-04-26 23:48:51.291	{}
lwGV/m3fe5RcBuEhzVwm	YPGpbTqv9aeZHXxBNgIC	vWIB+YBZMNy4/vxnNCQI	333	\N	2017-04-24 21:55:05.212	{}
rSz87Cy2fANvAKlgsm3k	0/Dg4ohpw1BIoLvDgRkh	r8nUQ7i1nq4g5JCxBAV7	448	\N	2017-04-24 15:41:38.594	{}
5VHL9HiPVhTEMfxipqDK	3KOaA2+6IjmFPfm4ChIJ	AAAmshqUyNGd5YN4rgGH	562	\N	2017-04-26 08:05:10.48	{}
leHQSRXCRt7gyu0XJsTa	VErp5+HZdn3Yz2G88TZh	N2m0kYjYefC5EaE1TKyU	527	\N	2017-04-25 10:14:06.256	{}
VWZYOywfq/pSc6DyTzxD	VErp5+HZdn3Yz2G88TZh	va+dgTyi0kL3dIcgn48J	4	\N	2017-04-24 16:25:30.586	{}
wEMEMwwvWVUZCJEzJtrj	kMjFmLjttJpQS3rzutBf	VOc28aaxQDAYO8y6JV6h	426	\N	2017-04-25 03:49:44.939	{}
cAcjhPavmK9k3eVLx2bz	Hjjd3Ns0lvG3cs9jj4N7	I+dYk2/QYXfRgeNhEVGK	599	\N	2017-04-26 22:45:28.782	{}
3yZuDdZzXIyRkbuHU+Nr	SBdioRVUMTzSJjoTQ8iG	XYAd5Zh/y3KFUVrfBaMV	784	\N	2017-04-26 14:50:17.545	{}
5GjU0i8invEnKMr6f/HF	Hjjd3Ns0lvG3cs9jj4N7	ypsn+18pu/Kj7toQQgEk	998	\N	2017-04-26 20:57:51.128	{}
mqeEhHPz5EtZvtCc4Kfn	sAxdggjzUR7+K6sSxnyU	H3dO1NtpTiVl0L67Aagh	731	\N	2017-04-24 12:53:53.134	{}
ZfKuumpajTqDQT2WCdIN	XklfmXtmNz7WRzaFwJPY	tuwIwDTcWMij5Lsn+dF2	360	\N	2017-04-26 17:55:50.79	{}
J5tWBgt91+QT9/j9eKgQ	ljr+mdhFYpVziaRs0plq	wVBTv2oT9Zu8IUiNcu7t	574	\N	2017-04-25 19:08:09.784	{}
UhcM7SSBaKPmTZiUzFOq	3KOaA2+6IjmFPfm4ChIJ	nRY4oQ6FO1/1QeJfD9SQ	703	\N	2017-04-24 16:43:09.642	{}
EK0to4DMcCHIHNC2GYKo	SBdioRVUMTzSJjoTQ8iG	3ivc9uCjilsvumU7Vqbm	148	\N	2017-04-25 00:52:21.54	{}
TwExszu8ov5jGZKz4a9c	kMjFmLjttJpQS3rzutBf	Loc5UWpBwKw20QipAxO/	862	\N	2017-04-25 01:29:11.965	{}
+WF9ECLgTW/bKmRY9jno	/cFEfNMpFxRDc1+1PpSb	MbThFCstiI1CO3Q1TbWX	951	\N	2017-04-26 14:37:00.741	{}
RiLtYxlB5yP/036zskCN	TMTdMrgBYgxYoTLKWv35	5u/NfExwO9ef6eA1PTE7	614	\N	2017-04-24 12:44:47.005	{}
fJgyMp0geyoRPHMa+ke5	TMTdMrgBYgxYoTLKWv35	F5o+9kbgy4nX67AcECKy	633	\N	2017-04-24 01:26:19.275	{}
A9/cuZ9/YldLoFshtkOo	XklfmXtmNz7WRzaFwJPY	ix3Mcp8lFcbaIc6cSCGn	395	\N	2017-04-24 19:50:17.033	{}
FPILux4VyZuCq8hc5qnM	YPGpbTqv9aeZHXxBNgIC	J0WjYEjcW6XxMPUp/h4Q	323	\N	2017-04-24 07:29:36.424	{}
Z5o48F7P85BbTevnaKTK	sAxdggjzUR7+K6sSxnyU	qObZJrbC7EQyCGBsAfSy	628	\N	2017-04-26 04:43:42.575	{}
ZMpu/hSly33cO8mo4rZT	0/Dg4ohpw1BIoLvDgRkh	wk+dIhfirC+e4V3Hsi/F	662	\N	2017-04-26 04:41:03.94	{}
F9Z7reXqceioXC3DHt+k	0/Dg4ohpw1BIoLvDgRkh	zXEeqbW5cEtrjIaq6+p/	250	\N	2017-04-25 21:57:25.955	{}
AWBTsow9Qd69Ei8hhAFH	+2fxb2EecC80U2DcxPMF	2/+Fxmhv+s/k+H4mHUms	842	\N	2017-04-26 18:43:30.303	{}
NFisB3UoCj36iMVjGEbQ	sAxdggjzUR7+K6sSxnyU	3hEaa4dPEkZwl84fWsPS	681	\N	2017-04-24 17:19:27.262	{}
b33dsWnYQn9TLXQB1WBm	XklfmXtmNz7WRzaFwJPY	DT8aL1s3TpbY+Pp0JprI	281	\N	2017-04-25 14:05:56.28	{}
Svk0+WCWBpIsDNIrx2Sx	sAxdggjzUR7+K6sSxnyU	xqEIFcKtrs79V1GvCfjM	430	\N	2017-04-26 10:53:54.077	{}
jBqK5MuLEjOPfAgKnnCv	/cFEfNMpFxRDc1+1PpSb	0aYRcG/M0/X/yYGNJAtm	302	\N	2017-04-25 07:22:27.33	{}
+FKuBrFVGhP01Thq337s	Hjjd3Ns0lvG3cs9jj4N7	42jQoic5jPtKkVz/FDjO	993	\N	2017-04-26 11:17:14.241	{}
zCyJNnhFL97HpqtPyZkD	SBdioRVUMTzSJjoTQ8iG	nO7uZUnpBcOfIZeqNtMJ	770	\N	2017-04-25 15:33:51.602	{}
r/z1YfbXyxHDz+zlhszW	budgvhf/oqc9FWtiR59c	z95tJp4X5L9vBJKb0lWY	816	\N	2017-04-25 00:48:25.172	{}
EzqiCcueyg1BcaNALEna	rc+ccdAK8F4ROpIC299B	RsThs7f+YarkpJQ9b5AW	876	\N	2017-04-24 23:59:29.946	{}
NHkdmqqo7+3nVvQTuQPP	TMTdMrgBYgxYoTLKWv35	bKeGlGsiR36OnvQt6Jv8	507	\N	2017-04-24 09:02:02.53	{}
zjP/xQIdzDIkDrKCJM1w	y90eN2IFt6lwJmUaK9TF	wXA7apJ37w4JqdlwN65J	156	\N	2017-04-25 05:38:43.195	{}
BtobJac4f3oH98EtUW9H	Hjjd3Ns0lvG3cs9jj4N7	U6e6GfiWUUgXR2x1KG69	203	\N	2017-04-25 16:54:50.765	{}
MFvIvGnsBvItXRiRrS2w	VErp5+HZdn3Yz2G88TZh	uvXBVW6xJcavNKmEBIVY	745	\N	2017-04-25 15:30:14.952	{}
svxofOkzPlJ7LrsK9DyX	ljr+mdhFYpVziaRs0plq	/wcVJZDDfXqd/P0mRVM6	735	\N	2017-04-25 15:30:42.311	{}
j29+fHZo8SS/Y8meeUcj	SBdioRVUMTzSJjoTQ8iG	4yK7vx1ekhuQ7wVO6kYM	957	\N	2017-04-25 22:16:00.093	{}
l0hY2CLAv5Tb6iQO5ax5	3KOaA2+6IjmFPfm4ChIJ	kOvJqxyTC0T/kuk1vZZ3	98	\N	2017-04-26 22:39:00.896	{}
UJebzfMtXAZIT1aQiSL1	0/Dg4ohpw1BIoLvDgRkh	L+/B6F5ejrSr8lqPeN30	4	\N	2017-04-26 08:33:47.5	{}
9O6WYk2J2vLJ7knXdnBr	nbFMJA7w8Ms8VOsgI8Uj	6KryoSrWf5AvjQH8ogqs	950	\N	2017-04-25 16:00:39.698	{}
0qedYV2/s/KXqg9tAkMn	TMTdMrgBYgxYoTLKWv35	tBDb8F150sbq51wCVjVP	841	\N	2017-04-24 06:00:46.411	{}
T8xtrTnrisW31TskQnnR	ljr+mdhFYpVziaRs0plq	r49mnatyGyT1FMKiWajG	116	\N	2017-04-24 19:07:09.554	{}
kakZsAp6XvjpVN1ky7Wd	CBp22Vfd78M4NgkRafEo	ZeUgcf1m5S8cal6hpxHD	515	\N	2017-04-25 15:44:32.933	{}
14Zf77gVmGCZLLw402E7	3KOaA2+6IjmFPfm4ChIJ	bbV0S9TaH41W5cUUc/xR	676	\N	2017-04-24 13:41:54.961	{}
/nBscHVIxVRfSR7uTpdb	/cFEfNMpFxRDc1+1PpSb	Vhi0Pgnt0f/iJYVVqlDV	448	\N	2017-04-24 22:21:46.066	{}
7yybWpe8HguFrv6BiNDZ	YPGpbTqv9aeZHXxBNgIC	RJ+mY3NeSMG33Im2nMWe	206	\N	2017-04-24 01:00:35.036	{}
z7CMt3ZtXdAFIU9cY2wo	CBp22Vfd78M4NgkRafEo	+YahB8dn45dWgxbQKPo2	98	\N	2017-04-25 03:34:29.578	{}
xO0aGp+rfUbcCEwnVbCT	CBp22Vfd78M4NgkRafEo	1Fuuc0ItfmiFbsZcYc//	493	\N	2017-04-26 10:49:19.085	{}
qwUZvxmPy2xkR1gMJqR1	VErp5+HZdn3Yz2G88TZh	Ej1dsATXZFPrH1nNKhSh	450	\N	2017-04-24 13:39:32.333	{}
Qejv4KvPxeo1U88CPhNl	XklfmXtmNz7WRzaFwJPY	YyNILZgOF/StfrrXbbOx	493	\N	2017-04-24 14:44:55.872	{}
C0aNlJvYwtL2cbmpUyfe	+2fxb2EecC80U2DcxPMF	56ZhLQV0ZO55MYlrpJ0/	965	\N	2017-04-26 21:20:39.933	{}
bT4JCcUTFviCTfAIGRFH	SBdioRVUMTzSJjoTQ8iG	Brm3g5xATmBROWbeDzev	835	\N	2017-04-26 17:29:33.316	{}
rIgF/YdFztQKpfQT2WPo	nbFMJA7w8Ms8VOsgI8Uj	kt6cc6Pmh7UZGMv19kTY	170	\N	2017-04-25 05:05:42.036	{}
wRBethSXkgpZDqSUDwam	sAxdggjzUR7+K6sSxnyU	u3ZLZ1wSaBUI1ir/s87f	856	\N	2017-04-24 19:22:24.617	{}
vmoEK1zlUdJvGbCLaPJ4	ljr+mdhFYpVziaRs0plq	SPix0928XawGZzUL6Kk/	958	\N	2017-04-26 06:17:39.957	{}
Pu8AbxMGTAMqn2pL6uYV	0/Dg4ohpw1BIoLvDgRkh	YGwamAmejWkGT2LbhCTz	432	\N	2017-04-25 02:49:53.46	{}
Qe6fV2j6eGbxqkeLAkYK	budgvhf/oqc9FWtiR59c	zaG+gDxF5/Dqy1LKpOsH	164	\N	2017-04-24 00:16:15.401	{}
XozNQA9BxeXbYFEYuXDe	3KOaA2+6IjmFPfm4ChIJ	tZSRHXott6U7y2nfL4p2	272	\N	2017-04-24 21:45:10.182	{}
tAeulETDjzWigBlkzCfT	budgvhf/oqc9FWtiR59c	A9NvltJJdnsQMPuPbtT5	700	\N	2017-04-24 11:12:49.271	{}
WS8R8Gpzz1GL4JGc0Nfb	ZNerBKfcGYvzcUKaYlqg	35DOZvz03Fh9/vhxaZ6h	155	\N	2017-04-24 01:57:18.441	{}
nVnVpI3bdBSJZMs5MHLS	Mooca+XNOJQaJb6IILB6	oFHzW7M8uHrJzroQVXxH	701	\N	2017-04-24 17:19:02.907	{}
fViKGIb500qNwPJx8MTV	sAxdggjzUR7+K6sSxnyU	wwuPyhGagwYUqRSH59Q5	18	\N	2017-04-25 00:06:46.4	{}
Nutt25VaSFpuyfx2aNsu	YPGpbTqv9aeZHXxBNgIC	FsHA/yYzkyrvxjDL7jmx	788	\N	2017-04-25 19:53:59.562	{}
WZ/Dp89842GDRlx4AcAI	TMTdMrgBYgxYoTLKWv35	vWIB+YBZMNy4/vxnNCQI	462	\N	2017-04-24 07:04:16.086	{}
xbDXhTWOkp9gTpj93Fdc	XklfmXtmNz7WRzaFwJPY	r8nUQ7i1nq4g5JCxBAV7	137	\N	2017-04-24 17:14:00.996	{}
Fwi66eticG9BU/cX7dys	y90eN2IFt6lwJmUaK9TF	KhReTUGJJqO8kWa5kgIs	683	\N	2017-04-25 20:06:29.247	{}
cXrwIoBhpSSVpp7j02Hk	Mooca+XNOJQaJb6IILB6	N2m0kYjYefC5EaE1TKyU	481	\N	2017-04-24 02:48:21.648	{}
u9bMXX2y1u+hKlMxEv6X	TMTdMrgBYgxYoTLKWv35	va+dgTyi0kL3dIcgn48J	460	\N	2017-04-24 00:35:54.274	{}
Sz4zmSk/twLDkEEeR576	ljr+mdhFYpVziaRs0plq	VOc28aaxQDAYO8y6JV6h	693	\N	2017-04-24 19:20:12.342	{}
8sV9ODdwjqOFRkC9E12c	sAxdggjzUR7+K6sSxnyU	bSUJms9ytpe0LJCy+49v	438	\N	2017-04-24 10:14:35.339	{}
QX2dadDnHp/pEcM0OpyL	CBp22Vfd78M4NgkRafEo	g53TbiDOJdJAkfVV7Dq3	181	\N	2017-04-25 16:12:13.03	{}
6cmmRYfiRseNMQ3vHEvV	XklfmXtmNz7WRzaFwJPY	ungxFy6KF+BduXSw6aNb	946	\N	2017-04-25 23:29:57.096	{}
CgZOVEgXS+CefMhgVRLb	+2fxb2EecC80U2DcxPMF	C/RqIpnX/pI2SotfrOxl	769	\N	2017-04-25 11:44:20.99	{}
g6RuHRQYgh10DOXLKdmo	XklfmXtmNz7WRzaFwJPY	kWoBWJ7K9YAT1tVxGzHc	504	\N	2017-04-26 09:46:23.944	{}
qAr/nVZM4ntmvQ5Vei6Q	Mooca+XNOJQaJb6IILB6	nRY4oQ6FO1/1QeJfD9SQ	817	\N	2017-04-26 17:54:59.299	{}
H5e0oyA5Ko2s4BlulXhJ	3KOaA2+6IjmFPfm4ChIJ	3ivc9uCjilsvumU7Vqbm	272	\N	2017-04-25 07:51:06.813	{}
qLkGO3usrIay9CwIU3Kl	SBdioRVUMTzSJjoTQ8iG	v0/uFtYnnfnaglP4uUwh	872	\N	2017-04-26 05:32:40.898	{}
Xc8yRq1cQa7oTf6YpXW9	0/Dg4ohpw1BIoLvDgRkh	kiFFetKW04Yrhp6Cg7iM	850	\N	2017-04-26 04:08:39.806	{}
iKyalZi9lc565m193Y/e	Mooca+XNOJQaJb6IILB6	5u/NfExwO9ef6eA1PTE7	941	\N	2017-04-24 05:48:34.977	{}
Kyo34Kdjzfgl42Oy66sL	Hjjd3Ns0lvG3cs9jj4N7	J1rgIY5aLoqOR48jl7YH	133	\N	2017-04-25 03:32:21.733	{}
oIG2oGAYd033p6UnohHj	VErp5+HZdn3Yz2G88TZh	QA++Kdn184yTKqKfTwR9	30	\N	2017-04-25 09:10:06.332	{}
WDh0W/FdfoNpfhExM8Ub	y90eN2IFt6lwJmUaK9TF	ix3Mcp8lFcbaIc6cSCGn	328	\N	2017-04-24 12:26:53.757	{}
7hnVyv+hLvjtSRCotDM3	rc+ccdAK8F4ROpIC299B	J0WjYEjcW6XxMPUp/h4Q	906	\N	2017-04-24 10:34:49.685	{}
k1IYAId/W0oAbyI45qvF	Hjjd3Ns0lvG3cs9jj4N7	OPNrxs7dPLp93Ln6aBuI	651	\N	2017-04-25 15:02:40.161	{}
S+r9HODtlRfPRn82uAUH	ljr+mdhFYpVziaRs0plq	WqxeqRscZU3eI/V+vJ4+	311	\N	2017-04-26 06:11:19.08	{}
UEZuMAO6W0rclb4ZVR+0	0/Dg4ohpw1BIoLvDgRkh	3CDA1FGas2GwfOxvLQ5c	635	\N	2017-04-25 15:07:34.444	{}
O8GkZFk2Azd7XyJt9BWd	YPGpbTqv9aeZHXxBNgIC	2lIo9jpuu/L5ekctK0hw	617	\N	2017-04-26 22:51:05.108	{}
Qf0N87/F8JMH1trahV+Q	CBp22Vfd78M4NgkRafEo	uESzXMpsf6g+HEvMWIA3	77	\N	2017-04-26 10:55:37.887	{}
/urOh8/AeoKNUct41TWb	ZNerBKfcGYvzcUKaYlqg	JQYRDAWAk45nGnhLSWhx	563	\N	2017-04-26 18:26:15.313	{}
ylSzMv45DAey+CDZqAaH	/cFEfNMpFxRDc1+1PpSb	78a49+FqXMeRBJjW84Nm	109	\N	2017-04-26 18:32:03.045	{}
XrJwRp6BI8U1h6jmNlC8	YPGpbTqv9aeZHXxBNgIC	xqEIFcKtrs79V1GvCfjM	414	\N	2017-04-24 06:56:09.431	{}
q6VtxCvxpo1GUBSYuymC	3KOaA2+6IjmFPfm4ChIJ	0aYRcG/M0/X/yYGNJAtm	99	\N	2017-04-25 14:24:31.898	{}
b87tFkpI6Vz0VSQ33qWN	rc+ccdAK8F4ROpIC299B	42jQoic5jPtKkVz/FDjO	57	\N	2017-04-25 01:46:11.718	{}
dK/tGRJQmY6QUAMlojxW	3KOaA2+6IjmFPfm4ChIJ	Tk2nWZkvlXcO9xwqydL/	508	\N	2017-04-26 16:24:56.44	{}
qIQaqNQHpToc0o48er8D	rc+ccdAK8F4ROpIC299B	TplX8W/+vRMKUBR5PRC4	952	\N	2017-04-25 13:14:24.362	{}
AoXCg+n6EttOZ2RrtA/4	0/Dg4ohpw1BIoLvDgRkh	mX4grTAwwSGuecHNm3mY	914	\N	2017-04-25 08:31:10.301	{}
vnLyKTwaqNs7pXBEl1uP	XklfmXtmNz7WRzaFwJPY	D2JhHQi0jZGFKUXdbOCA	500	\N	2017-04-24 09:05:35.692	{}
a0jLxDKONxbeK9AYbaz/	nbFMJA7w8Ms8VOsgI8Uj	wXA7apJ37w4JqdlwN65J	566	\N	2017-04-24 15:25:31.428	{}
BpXLBwQ5sNXSdjj0LMAG	XklfmXtmNz7WRzaFwJPY	/1JN4ijVNKPJTcmz/Idf	931	\N	2017-04-26 19:26:47.274	{}
dfupYyye/Cp4QvIvkNoC	XklfmXtmNz7WRzaFwJPY	TgqEedOJM3+osCXDJmk7	728	\N	2017-04-26 15:11:13.373	{}
kcV9R1m2RNZt/z//U8md	CBp22Vfd78M4NgkRafEo	MXHnuThLBxyMqf2x9RYX	905	\N	2017-04-25 07:34:11.682	{}
CO/U5Ojyyu/nK/o+E6so	rc+ccdAK8F4ROpIC299B	5AtIOTMpR2HWS/urXzzl	476	\N	2017-04-25 06:41:41.043	{}
MSEP2cgyHZxiacufP3Yd	Mooca+XNOJQaJb6IILB6	kOvJqxyTC0T/kuk1vZZ3	381	\N	2017-04-24 19:56:45.138	{}
o4P18ZI2BfA0zGOJuhg6	y90eN2IFt6lwJmUaK9TF	L+/B6F5ejrSr8lqPeN30	442	\N	2017-04-26 17:27:59.711	{}
vzSeRfj+c4b/C1JVRviE	sAxdggjzUR7+K6sSxnyU	zUhgyYpKavBCzYUkWUl1	776	\N	2017-04-26 00:05:16.189	{}
fXnW3G4khTIOXDNhIajT	nbFMJA7w8Ms8VOsgI8Uj	YZ5KjVTkfycwHcGhfhLm	619	\N	2017-04-25 00:29:51.872	{}
T/sdFJzKNCWU+00Vq5+B	nbFMJA7w8Ms8VOsgI8Uj	IVVV+EyyVp8CIr8dh3Xa	190	\N	2017-04-25 21:15:44.574	{}
B2OR9yPtKUCJ73PcAsjD	nbFMJA7w8Ms8VOsgI8Uj	e2XpYBeA93QZ4s8yR4a1	215	\N	2017-04-25 09:50:00.811	{}
STTcxWewAXZtqohBvMhU	VErp5+HZdn3Yz2G88TZh	HjTXXwBTFx8XPyM1k1jt	312	\N	2017-04-26 12:43:00.902	{}
a5TwSAlS5RIAX7z5UsYj	XklfmXtmNz7WRzaFwJPY	hTGMbTZe/Oalm1bkZ9nT	202	\N	2017-04-26 04:59:13.193	{}
6OmEXMyVsXP53iE4zSOE	+2fxb2EecC80U2DcxPMF	muH3+mbrGNEZz3RN28C/	954	\N	2017-04-26 19:06:51.621	{}
uyxcTPyJRLPSd32bOnzT	rc+ccdAK8F4ROpIC299B	jwiW/EMbj3+22e/vuJBF	233	\N	2017-04-26 03:57:47.962	{}
6NhtISJgAz9HexsaTKuv	/cFEfNMpFxRDc1+1PpSb	1Fuuc0ItfmiFbsZcYc//	49	\N	2017-04-25 01:47:53.781	{}
ET6boKxJ1+KlCbCEr/2U	SBdioRVUMTzSJjoTQ8iG	mFOIH3P8dCL9gFunJoMP	301	\N	2017-04-24 22:09:47.45	{}
NH7j0lr7labfux7NmPa6	CBp22Vfd78M4NgkRafEo	TmA60eUk/eSPAxliVWvu	841	\N	2017-04-24 14:05:47.663	{}
paDxo1Q9mSLyH1ejb/Dg	nbFMJA7w8Ms8VOsgI8Uj	bvZfMZ5UNxXhczbWj57k	570	\N	2017-04-24 10:17:32.514	{}
crticTytaBJI8beru85T	ZNerBKfcGYvzcUKaYlqg	34gU/stM1HjVMqYBbeYy	671	\N	2017-04-26 11:08:06.72	{}
KRzy5SbcLagHmXKE8lT1	XklfmXtmNz7WRzaFwJPY	oIkMyoKnCCuqeejyR3Ww	703	\N	2017-04-25 11:25:29.679	{}
lcpm3USmoWQeObeT2CbS	TMTdMrgBYgxYoTLKWv35	kt6cc6Pmh7UZGMv19kTY	179	\N	2017-04-24 05:24:46.65	{}
V3zkZW+wKELziyXDLHzb	Hjjd3Ns0lvG3cs9jj4N7	+2g4HO+WW0WceYVvgaeU	506	\N	2017-04-26 01:42:07.158	{}
5kXBUGLC4sNBMyo9Ju91	y90eN2IFt6lwJmUaK9TF	kOfIDrxpMkehDzg6h/Qy	791	\N	2017-04-26 19:35:25.708	{}
3/XF5GTCWXXiTOvzon2E	CBp22Vfd78M4NgkRafEo	iB1yVx7wL7vUVWntNT0O	719	\N	2017-04-24 13:23:25.848	{}
ha4YK+quXGYJ90HAgTQ3	kMjFmLjttJpQS3rzutBf	TfV8Rj5vviivHod09QWk	263	\N	2017-04-25 20:54:30.895	{}
jj5nBtv/CrzrNHW4t+Kl	nbFMJA7w8Ms8VOsgI8Uj	tZSRHXott6U7y2nfL4p2	248	\N	2017-04-26 21:11:34.87	{}
Nygt/1g3cbQk1V0YKnJ2	Mooca+XNOJQaJb6IILB6	O2wDntI78tu+T7NYV35b	489	\N	2017-04-25 01:22:21.16	{}
I+FfR92Ug3IcbXMyufRM	0/Dg4ohpw1BIoLvDgRkh	+KFq6H5gE2G3XNzN0WFF	54	\N	2017-04-24 03:37:54.703	{}
dYG2WwxzGmuqCUjITfwc	TMTdMrgBYgxYoTLKWv35	35DOZvz03Fh9/vhxaZ6h	195	\N	2017-04-24 19:14:02.591	{}
z1FTY3c8gQ0fhznNb7aV	YPGpbTqv9aeZHXxBNgIC	oFHzW7M8uHrJzroQVXxH	896	\N	2017-04-24 09:33:45.96	{}
8sjodg1cLSnvW7aJ7c62	SBdioRVUMTzSJjoTQ8iG	uFBXmkHI0ztcqHAecY/i	325	\N	2017-04-24 09:34:42.441	{}
kzQks/VPQlJdCOVGBizg	ZNerBKfcGYvzcUKaYlqg	FsHA/yYzkyrvxjDL7jmx	421	\N	2017-04-26 09:47:28.27	{}
DDt2Wax1i+e8LI6J6qG+	3KOaA2+6IjmFPfm4ChIJ	vWIB+YBZMNy4/vxnNCQI	655	\N	2017-04-26 07:54:03.935	{}
7Dv0HZ9ZMakLQgoiS3X+	XklfmXtmNz7WRzaFwJPY	Aue0ZMRucYCvc9Nc+DwM	136	\N	2017-04-24 05:53:52.703	{}
x06Jn5PZ9VHMiG+ltWtI	Mooca+XNOJQaJb6IILB6	AAAmshqUyNGd5YN4rgGH	737	\N	2017-04-26 08:48:57.278	{}
TXvB/pWCXkK81HmPn4G+	rc+ccdAK8F4ROpIC299B	KhReTUGJJqO8kWa5kgIs	533	\N	2017-04-25 21:29:00.223	{}
NSY4GtB3XY68GNrfT9q/	XklfmXtmNz7WRzaFwJPY	tkYXKYurS41iKLPnU7i7	951	\N	2017-04-25 22:52:46.038	{}
tkHnPX7O16E4dm4WSK7g	3KOaA2+6IjmFPfm4ChIJ	B3S8oAKMAM59czAQM9Qq	196	\N	2017-04-25 15:34:06.591	{}
o8CnMYhs+S/31eHy3axr	VErp5+HZdn3Yz2G88TZh	ZP1GPC+i2CXZVnl9GYb7	430	\N	2017-04-24 18:27:16.402	{}
rhXzZVxBUayDBOXs2Y5h	0/Dg4ohpw1BIoLvDgRkh	g53TbiDOJdJAkfVV7Dq3	851	\N	2017-04-25 19:10:36.93	{}
UvvETEmuNw4AzYi8y15S	YPGpbTqv9aeZHXxBNgIC	QPxY+750eT4NfxyrXz8G	945	\N	2017-04-24 02:35:32.769	{}
yacv8qgL0twqPXR6VH1q	rc+ccdAK8F4ROpIC299B	C/RqIpnX/pI2SotfrOxl	791	\N	2017-04-24 02:48:39.839	{}
j1ivnSvj6m8nwQqkCEcY	+2fxb2EecC80U2DcxPMF	kWoBWJ7K9YAT1tVxGzHc	886	\N	2017-04-25 20:35:06.558	{}
A7/HzTquDsX4cDOocr7+	rc+ccdAK8F4ROpIC299B	gRGZ7MezXg5x1YTQ+kv6	98	\N	2017-04-25 12:00:43.163	{}
mZAGG2oB8FD3d13uVlE8	budgvhf/oqc9FWtiR59c	ZAW151HGQCKKqimRLisC	220	\N	2017-04-25 04:06:37.995	{}
xR7UfS4h8Q3Lk14/YE96	budgvhf/oqc9FWtiR59c	Loc5UWpBwKw20QipAxO/	675	\N	2017-04-25 02:42:42.547	{}
ycBVjD6VWo6L4rhhkwXR	VErp5+HZdn3Yz2G88TZh	kiFFetKW04Yrhp6Cg7iM	563	\N	2017-04-24 16:04:08.297	{}
AWKND0GmWq4ngcklpVxL	kMjFmLjttJpQS3rzutBf	5u/NfExwO9ef6eA1PTE7	421	\N	2017-04-24 03:18:20.197	{}
veeLXy5XFdYdWqtjGhQY	CBp22Vfd78M4NgkRafEo	F5o+9kbgy4nX67AcECKy	582	\N	2017-04-24 23:58:58.116	{}
qRx1lBu05CnHQOL8W7VK	VErp5+HZdn3Yz2G88TZh	Dr9TrSfvVOPKA9Ox26vE	181	\N	2017-04-24 20:48:49.874	{}
EP8Oj+gVzT7SmqLJAWiu	SBdioRVUMTzSJjoTQ8iG	VRB60g1OHcTkrbbpfMXb	963	\N	2017-04-26 11:54:27.801	{}
/2oMztuDMST4lSJW39it	y90eN2IFt6lwJmUaK9TF	WqxeqRscZU3eI/V+vJ4+	735	\N	2017-04-25 10:40:35.821	{}
8TZCL51OTGQ/X7OWbIRO	+2fxb2EecC80U2DcxPMF	CDjW4fVWUlVAY5ENtqU8	433	\N	2017-04-25 04:36:15.257	{}
7zkqZOvxvJqH0rMtywjc	YPGpbTqv9aeZHXxBNgIC	2lIo9jpuu/L5ekctK0hw	870	\N	2017-04-25 18:38:05.599	{}
wYyj3IpXV+rfTYPidLA8	/cFEfNMpFxRDc1+1PpSb	2/+Fxmhv+s/k+H4mHUms	153	\N	2017-04-26 00:34:41.43	{}
QQZlI/VKzeVrrM5luDnl	kMjFmLjttJpQS3rzutBf	3hEaa4dPEkZwl84fWsPS	973	\N	2017-04-26 16:29:30.345	{}
oIJR68h3RmCXR9PrPs9j	budgvhf/oqc9FWtiR59c	DT8aL1s3TpbY+Pp0JprI	19	\N	2017-04-26 20:38:17.776	{}
01XltaJzB4MF8cy93QR+	rc+ccdAK8F4ROpIC299B	9AJwBZiro266QvZF51YF	879	\N	2017-04-26 17:35:58.069	{}
8be0azatNvHV6H4Ax0K+	nbFMJA7w8Ms8VOsgI8Uj	0aYRcG/M0/X/yYGNJAtm	99	\N	2017-04-24 13:14:44.678	{}
jSeiNYSJRXRhsTXeNn3U	ZNerBKfcGYvzcUKaYlqg	/GjBU0I+Dv+u/j6p+M9p	334	\N	2017-04-25 14:48:42.358	{}
FrzdsBHQdqamuuqQNbb6	Hjjd3Ns0lvG3cs9jj4N7	fYxNI4s84hUfwgceNye9	483	\N	2017-04-26 15:58:33.927	{}
tzRd/GsvuKJyZupOXUVO	YPGpbTqv9aeZHXxBNgIC	z95tJp4X5L9vBJKb0lWY	424	\N	2017-04-26 18:22:04.798	{}
yPgVK2vV9k9RoHSz1A93	y90eN2IFt6lwJmUaK9TF	RsThs7f+YarkpJQ9b5AW	58	\N	2017-04-26 13:47:01.816	{}
iQ511GpHOccFVeQkBAYA	CBp22Vfd78M4NgkRafEo	bKeGlGsiR36OnvQt6Jv8	579	\N	2017-04-24 11:30:09.178	{}
SMGMkoeJgqG5PmfEm5uK	XklfmXtmNz7WRzaFwJPY	xCVXYtEzQebsxaDah2vG	545	\N	2017-04-26 02:30:40.992	{}
adeI4odOY2eWcYf3eAa5	kMjFmLjttJpQS3rzutBf	U6e6GfiWUUgXR2x1KG69	163	\N	2017-04-26 05:14:35.908	{}
qscFRwPfPfkOgwO/nza/	y90eN2IFt6lwJmUaK9TF	uvXBVW6xJcavNKmEBIVY	190	\N	2017-04-24 00:44:30.252	{}
mj6K3o9mxS4srCAuITSe	sAxdggjzUR7+K6sSxnyU	d8lZQ0RqfLctcs9Jhdau	698	\N	2017-04-24 23:40:25.342	{}
OCXrjWxV4nDpLUN8vJk+	rc+ccdAK8F4ROpIC299B	MXHnuThLBxyMqf2x9RYX	815	\N	2017-04-26 10:41:23.894	{}
ZPOkp/zPf+wKvypDw+9Y	budgvhf/oqc9FWtiR59c	5AtIOTMpR2HWS/urXzzl	247	\N	2017-04-26 16:23:17.42	{}
VfUJ3XErAXCLYBtC3VnV	Mooca+XNOJQaJb6IILB6	kOvJqxyTC0T/kuk1vZZ3	672	\N	2017-04-26 19:45:42.515	{}
utZG+D9byGK4aY/XLDW6	ZNerBKfcGYvzcUKaYlqg	L+/B6F5ejrSr8lqPeN30	732	\N	2017-04-24 08:29:11.051	{}
ohxfHSXW3SdNGKxQYDU3	budgvhf/oqc9FWtiR59c	6KryoSrWf5AvjQH8ogqs	149	\N	2017-04-24 03:14:01.203	{}
/KrwvhgupA4SRUPEHRDe	XklfmXtmNz7WRzaFwJPY	tBDb8F150sbq51wCVjVP	265	\N	2017-04-26 22:54:10.644	{}
doAeKwJlRziIPz2oNc2G	YPGpbTqv9aeZHXxBNgIC	tBDb8F150sbq51wCVjVP	973	\N	2017-04-25 11:13:13.913	{}
wkR9tJYNMWAdfGM5uEjC	/cFEfNMpFxRDc1+1PpSb	Vhi0Pgnt0f/iJYVVqlDV	762	\N	2017-04-25 13:56:11.469	{}
x4oEGoj03tPFD4jc69MS	rc+ccdAK8F4ROpIC299B	muH3+mbrGNEZz3RN28C/	3	\N	2017-04-25 20:54:25.601	{}
CbQvZp8+z+gubsMdb1Kg	+2fxb2EecC80U2DcxPMF	iYBjNh82z2SK5H9M/YPK	471	\N	2017-04-26 08:37:33.209	{}
Gi8Mpd8bn8DCdfLawr+O	y90eN2IFt6lwJmUaK9TF	BcSrc5QQHlfh1XgzXAWw	574	\N	2017-04-26 05:06:01.182	{}
DLk3YJMfthA1U5lYPsoW	Hjjd3Ns0lvG3cs9jj4N7	mFOIH3P8dCL9gFunJoMP	590	\N	2017-04-24 20:26:42.78	{}
U1M4i7Pso6AgvDolr4tQ	VErp5+HZdn3Yz2G88TZh	USG2aFuCA3eXVKAwFdSB	100	\N	2017-04-26 13:03:19.938	{}
vDo4IkAzhqQsPkoeDmSL	ZNerBKfcGYvzcUKaYlqg	bvZfMZ5UNxXhczbWj57k	459	\N	2017-04-26 08:50:56.935	{}
29Yo4PytXv3Nqb4WYhoW	0/Dg4ohpw1BIoLvDgRkh	56ZhLQV0ZO55MYlrpJ0/	682	\N	2017-04-25 09:54:01.342	{}
s7psg3ZRieTeMBNwlpAq	CBp22Vfd78M4NgkRafEo	kt6cc6Pmh7UZGMv19kTY	652	\N	2017-04-26 02:47:48.646	{}
bydAGjBi3+/mijSefBT6	0/Dg4ohpw1BIoLvDgRkh	ItVfA7vmGRfXT7VE4ZEw	104	\N	2017-04-24 21:51:47.031	{}
AeFJ/Bf6ShAoDPwztkbj	VErp5+HZdn3Yz2G88TZh	kOfIDrxpMkehDzg6h/Qy	163	\N	2017-04-25 08:44:26.514	{}
vL8H3zUg1T7X7yR2BroH	Hjjd3Ns0lvG3cs9jj4N7	n3TJfYvA/O91macTa+aZ	793	\N	2017-04-25 13:55:41.956	{}
Kz8LbkykR9g4zMlp/xZa	+2fxb2EecC80U2DcxPMF	VJxONa44CnuLblOXSHHA	740	\N	2017-04-26 22:58:21.77	{}
L7TzGJGVeyQlbeTReCLY	CBp22Vfd78M4NgkRafEo	J9/bsP6mcTr4HIaK8KJC	578	\N	2017-04-26 14:39:09.815	{}
nTd2PUpwJ1KhdyiZGcoD	Mooca+XNOJQaJb6IILB6	dV2BZuZmeqwSCYYMeSgu	918	\N	2017-04-24 12:53:44.32	{}
fRKs7NTe2ha6qilNS3D9	y90eN2IFt6lwJmUaK9TF	A9NvltJJdnsQMPuPbtT5	581	\N	2017-04-24 08:43:53.217	{}
jUcAeBvRtriegyvz5oCB	nbFMJA7w8Ms8VOsgI8Uj	35DOZvz03Fh9/vhxaZ6h	410	\N	2017-04-25 13:58:16.31	{}
USFBedQ2H61GoQR8h25T	budgvhf/oqc9FWtiR59c	oFHzW7M8uHrJzroQVXxH	154	\N	2017-04-25 07:02:21.948	{}
MAgxYHI1qGJmfpqnRxfp	CBp22Vfd78M4NgkRafEo	wwuPyhGagwYUqRSH59Q5	919	\N	2017-04-24 04:16:24.022	{}
laxct35ejWTNFdRtspd7	TMTdMrgBYgxYoTLKWv35	FsHA/yYzkyrvxjDL7jmx	931	\N	2017-04-24 12:10:07.595	{}
wPXbAbSisHpGkT94gvz/	sAxdggjzUR7+K6sSxnyU	9iLudLiowiDb3PU6lfMN	222	\N	2017-04-25 12:49:14.355	{}
gy/XzXc2JfpQ08Fzb+Oz	budgvhf/oqc9FWtiR59c	AAAmshqUyNGd5YN4rgGH	57	\N	2017-04-25 11:23:59.217	{}
tU3OXYCqE5DG+IEMDk/k	Mooca+XNOJQaJb6IILB6	bFdyWo+XvwHOl7sZINqH	383	\N	2017-04-26 16:20:15.393	{}
E4WHAfR9IkjvaTpbvJJY	+2fxb2EecC80U2DcxPMF	B3S8oAKMAM59czAQM9Qq	642	\N	2017-04-25 19:21:20.163	{}
cZy89KDf0ixulmgYmEuR	0/Dg4ohpw1BIoLvDgRkh	ZP1GPC+i2CXZVnl9GYb7	184	\N	2017-04-26 18:58:22.387	{}
Jl5Gym7IJs/tKHEOE6GZ	kMjFmLjttJpQS3rzutBf	mLV7ekJBzLyXyCmnU2g9	632	\N	2017-04-25 10:01:32.213	{}
unnuTF2yO8mnASnVfTVy	ljr+mdhFYpVziaRs0plq	XYAd5Zh/y3KFUVrfBaMV	104	\N	2017-04-26 08:17:02.254	{}
9tqTNWyCXzNZikChLCf+	0/Dg4ohpw1BIoLvDgRkh	ypsn+18pu/Kj7toQQgEk	495	\N	2017-04-24 07:10:03.434	{}
WZkalwao6lsC6czoGFt5	XklfmXtmNz7WRzaFwJPY	TYQ80BLHc6zh1O3t6boZ	416	\N	2017-04-24 04:51:33.519	{}
KlTAQ5/NS+4NefLX8FNs	ljr+mdhFYpVziaRs0plq	tuwIwDTcWMij5Lsn+dF2	576	\N	2017-04-24 03:30:20.082	{}
0MxFaKl8b7GgfNiRCNCE	VErp5+HZdn3Yz2G88TZh	gRGZ7MezXg5x1YTQ+kv6	51	\N	2017-04-26 15:36:43.265	{}
oCqFxpiVvQOIDhs4ShcW	XklfmXtmNz7WRzaFwJPY	ZAW151HGQCKKqimRLisC	959	\N	2017-04-24 19:12:20.267	{}
C4o+nqtYZeYZ9RxH7FKb	SBdioRVUMTzSJjoTQ8iG	dfhRtMV0IfVIflXJA74X	683	\N	2017-04-26 04:34:01.096	{}
BLGGJdroK3J+Y5/ohgtV	/cFEfNMpFxRDc1+1PpSb	V/k/SjCdny9tP/yhfOnL	383	\N	2017-04-25 16:47:29.375	{}
KfLA2+BGR3/MluTI7DSH	ZNerBKfcGYvzcUKaYlqg	s3TECC9coOAQ/4HdlxJm	411	\N	2017-04-24 06:37:00.857	{}
cztO0HE5QMeEob9d/f9j	ljr+mdhFYpVziaRs0plq	F5o+9kbgy4nX67AcECKy	667	\N	2017-04-24 00:39:28.449	{}
s86/A+XHULH6davlcsjp	TMTdMrgBYgxYoTLKWv35	ix3Mcp8lFcbaIc6cSCGn	779	\N	2017-04-26 23:03:49.691	{}
KY5MDjPG2LZRJR5TBf3d	3KOaA2+6IjmFPfm4ChIJ	J0WjYEjcW6XxMPUp/h4Q	932	\N	2017-04-24 17:27:12.534	{}
lPT/qnqbxGp51Y55rQFd	SBdioRVUMTzSJjoTQ8iG	OPNrxs7dPLp93Ln6aBuI	915	\N	2017-04-26 11:19:30.196	{}
bnX3ZH5VEDFNBqbmMnUz	TMTdMrgBYgxYoTLKWv35	WqxeqRscZU3eI/V+vJ4+	207	\N	2017-04-24 06:25:50.769	{}
h5TBBx0v6NjBCGAHsbJb	TMTdMrgBYgxYoTLKWv35	3CDA1FGas2GwfOxvLQ5c	765	\N	2017-04-25 00:14:49.906	{}
J0xPfz2Q5GIjwuO94SRg	budgvhf/oqc9FWtiR59c	3Ee4hBrrev0nY1CLY193	488	\N	2017-04-25 13:17:47.38	{}
gzKkMsc6LiHI973t56Ez	+2fxb2EecC80U2DcxPMF	uESzXMpsf6g+HEvMWIA3	51	\N	2017-04-26 08:43:34.436	{}
ZVJeC3ZBzp5jB7iu7bKK	ZNerBKfcGYvzcUKaYlqg	78a49+FqXMeRBJjW84Nm	97	\N	2017-04-26 08:26:25.464	{}
D6nwCxtEaQIoe1iuHwCu	budgvhf/oqc9FWtiR59c	fx5FF+vvMjCD3PLsxHfl	955	\N	2017-04-25 02:24:00.354	{}
Y6bvuOyQFZiy7/tPPlAI	ZNerBKfcGYvzcUKaYlqg	kxS1BeeahcMjzaj0/hif	542	\N	2017-04-24 01:06:57.658	{}
cXtLZZdxXo0QR5WYlcox	/cFEfNMpFxRDc1+1PpSb	/GjBU0I+Dv+u/j6p+M9p	312	\N	2017-04-24 09:26:38.771	{}
lq+GxD4LzZ6fK/WXa9ui	TMTdMrgBYgxYoTLKWv35	fYxNI4s84hUfwgceNye9	432	\N	2017-04-26 11:11:48.381	{}
bpgfWBgVNn5klCVON9pA	3KOaA2+6IjmFPfm4ChIJ	gFPwbWaaERQNQmSSysVg	29	\N	2017-04-25 12:03:30.974	{}
wGFsbHbmGeGN+QbYzrSe	Mooca+XNOJQaJb6IILB6	RsThs7f+YarkpJQ9b5AW	125	\N	2017-04-24 06:27:53.202	{}
xU+4/bpxwmyQOiGIWb5R	ZNerBKfcGYvzcUKaYlqg	mX4grTAwwSGuecHNm3mY	533	\N	2017-04-24 06:39:52.833	{}
Eps1+ed16nJjN8Skobuv	nbFMJA7w8Ms8VOsgI8Uj	xQbnGD+4He+bN9YhT1j7	680	\N	2017-04-24 05:51:17.889	{}
RVl6658vWcWnrmXvlyVa	YPGpbTqv9aeZHXxBNgIC	wXA7apJ37w4JqdlwN65J	479	\N	2017-04-24 19:07:12.504	{}
MFSyVYTrrk3fy7BCfv2b	Hjjd3Ns0lvG3cs9jj4N7	/1JN4ijVNKPJTcmz/Idf	693	\N	2017-04-26 16:16:27.834	{}
7cV9r79H4dGUMBRIBCAY	Hjjd3Ns0lvG3cs9jj4N7	d8lZQ0RqfLctcs9Jhdau	412	\N	2017-04-26 08:34:20.854	{}
0rxUvalwrPkaMjkaKrIE	0/Dg4ohpw1BIoLvDgRkh	a/e+iAXp5yJd5e4NZZsF	891	\N	2017-04-26 05:03:16.37	{}
FsHvr9BJdgw3aXBxOXhv	SBdioRVUMTzSJjoTQ8iG	tbl5xjC/uEJJQesAGUGl	653	\N	2017-04-24 03:33:20.058	{}
mmO8rSAggi0GqeUCynJS	YPGpbTqv9aeZHXxBNgIC	5AtIOTMpR2HWS/urXzzl	348	\N	2017-04-26 14:39:33.357	{}
Ws93gnSkYiwXffRy7MJ8	y90eN2IFt6lwJmUaK9TF	I1BqKwsQft8m3T75pDo6	285	\N	2017-04-24 18:37:11.985	{}
fnAKr4wm3dSJm49QT/8E	TMTdMrgBYgxYoTLKWv35	zUhgyYpKavBCzYUkWUl1	1	\N	2017-04-26 03:57:40.693	{}
4tLIv/V8Fbq4sWBD0t+X	ZNerBKfcGYvzcUKaYlqg	6KryoSrWf5AvjQH8ogqs	757	\N	2017-04-26 16:38:38.559	{}
FWhMSI8JO5wgT0Fa2yb3	YPGpbTqv9aeZHXxBNgIC	IVVV+EyyVp8CIr8dh3Xa	152	\N	2017-04-24 11:05:02.002	{}
AIwxwY12JYl4q0jQmGP7	kMjFmLjttJpQS3rzutBf	e2XpYBeA93QZ4s8yR4a1	242	\N	2017-04-26 16:19:50.324	{}
CNiU0H+A1i98uprx1zoB	ljr+mdhFYpVziaRs0plq	rxTyOSplpcn8dnjo/adk	914	\N	2017-04-26 15:38:10.787	{}
EHgAyIf7QsWTFEyp12c8	YPGpbTqv9aeZHXxBNgIC	esk7+l2uhMtsgprnpuuW	714	\N	2017-04-26 11:57:56.202	{}
kW7KFKH+Zh/S6PpY4wBX	ZNerBKfcGYvzcUKaYlqg	RJ+mY3NeSMG33Im2nMWe	42	\N	2017-04-24 20:43:52.586	{}
YnAJyFiQOTvo2lWg5UWq	ljr+mdhFYpVziaRs0plq	jwiW/EMbj3+22e/vuJBF	84	\N	2017-04-25 15:37:00.151	{}
RuJ9GFrkkpPK/G8+RQ+8	ljr+mdhFYpVziaRs0plq	BcSrc5QQHlfh1XgzXAWw	222	\N	2017-04-25 16:14:38.327	{}
BIE/kkIRWDGEapBJL6Ti	ZNerBKfcGYvzcUKaYlqg	oP/r2lZmgfki6Ta0nW5V	341	\N	2017-04-26 15:42:33.786	{}
KdxoCbnNMwnWIPAy10JN	+2fxb2EecC80U2DcxPMF	TmA60eUk/eSPAxliVWvu	196	\N	2017-04-26 09:13:20.735	{}
/41CibGubpKnw357n2IF	CBp22Vfd78M4NgkRafEo	YyNILZgOF/StfrrXbbOx	479	\N	2017-04-24 07:00:46.428	{}
5Tu7qqDzpWuiWujwxBac	XklfmXtmNz7WRzaFwJPY	56ZhLQV0ZO55MYlrpJ0/	116	\N	2017-04-26 20:38:17.059	{}
afuIG147ottGoBLZZINR	VErp5+HZdn3Yz2G88TZh	bfNEf7WaxhTBCSyrYFGF	188	\N	2017-04-26 10:51:18.076	{}
AcKPHlK7QFBDbyPzRFPX	Mooca+XNOJQaJb6IILB6	IEaNOQ0FdwgajKVrJ/pt	820	\N	2017-04-24 08:16:09.139	{}
M6sPTbukVlrqDW7uUw41	Mooca+XNOJQaJb6IILB6	u3ZLZ1wSaBUI1ir/s87f	438	\N	2017-04-24 23:59:59.668	{}
ShaoHdKyBb8pkormKhpo	VErp5+HZdn3Yz2G88TZh	kOfIDrxpMkehDzg6h/Qy	47	\N	2017-04-26 07:33:12.63	{}
Aee5Rsl+I3DX1VU9/SJT	0/Dg4ohpw1BIoLvDgRkh	n3TJfYvA/O91macTa+aZ	550	\N	2017-04-26 12:41:45.126	{}
BEQ9sgJQc1nuSBsi0b7p	VErp5+HZdn3Yz2G88TZh	06JaNcOUnLo4c+wfGISx	499	\N	2017-04-24 01:03:59.982	{}
F9uLYH6kgI5p1nz6UYBg	+2fxb2EecC80U2DcxPMF	J9/bsP6mcTr4HIaK8KJC	407	\N	2017-04-26 20:43:18.422	{}
GsDk06FGtKsARVW1TSsp	YPGpbTqv9aeZHXxBNgIC	SvQDWNt+MRtoWPp/U7W9	94	\N	2017-04-24 18:58:21.695	{}
dhdYxCFuGLXD0e4UWoRv	TMTdMrgBYgxYoTLKWv35	O2wDntI78tu+T7NYV35b	859	\N	2017-04-25 14:48:16.829	{}
djLX5z1Qm+lQLd3xI3Up	TMTdMrgBYgxYoTLKWv35	gYySmHDQFnlSeSTMFmzt	295	\N	2017-04-26 13:48:38.038	{}
5eH136Q69TcyBicWlrRc	y90eN2IFt6lwJmUaK9TF	35DOZvz03Fh9/vhxaZ6h	466	\N	2017-04-26 11:55:40.248	{}
y0LpflTMt+RJ2Z0eZFOD	sAxdggjzUR7+K6sSxnyU	oFHzW7M8uHrJzroQVXxH	492	\N	2017-04-25 20:59:50.252	{}
E/0pxpc+e/cwB1PDkA39	rc+ccdAK8F4ROpIC299B	jthlSSB+N6sxxq0WFj6i	567	\N	2017-04-24 16:50:26.72	{}
Xnz9sTgLH7WGLUhkgAcS	y90eN2IFt6lwJmUaK9TF	jbhoeFjdjBV/VrTmAQK8	914	\N	2017-04-26 10:30:28.878	{}
S7xzCvI1dAChQne+HzGg	VErp5+HZdn3Yz2G88TZh	9iLudLiowiDb3PU6lfMN	417	\N	2017-04-24 04:04:50.09	{}
aPAQp+a7TBaU6bdIFCY+	y90eN2IFt6lwJmUaK9TF	r8nUQ7i1nq4g5JCxBAV7	796	\N	2017-04-26 20:05:37.729	{}
k4aMhN6A1MYOkJihSaNL	Hjjd3Ns0lvG3cs9jj4N7	N2m0kYjYefC5EaE1TKyU	389	\N	2017-04-24 00:24:11.316	{}
4AUwxwG3bRJKpY9Y/GP/	+2fxb2EecC80U2DcxPMF	J4dNEW+yJYDnKdh+Op+0	427	\N	2017-04-24 02:09:50.02	{}
psGp2K5JhBhpmYhVwQzb	rc+ccdAK8F4ROpIC299B	B3S8oAKMAM59czAQM9Qq	175	\N	2017-04-24 00:36:51.259	{}
CgODMBpaV3/U8tt1B7Qw	CBp22Vfd78M4NgkRafEo	ZP1GPC+i2CXZVnl9GYb7	971	\N	2017-04-25 00:18:34.217	{}
k7ygMcXR6z/3/RM3NN/B	SBdioRVUMTzSJjoTQ8iG	mLV7ekJBzLyXyCmnU2g9	401	\N	2017-04-25 18:37:40.071	{}
xSRfNSU1vHNtf+N5H7ZB	rc+ccdAK8F4ROpIC299B	XYAd5Zh/y3KFUVrfBaMV	529	\N	2017-04-24 11:23:10.627	{}
ud4eCMQtbN/Um0HbAO2Y	budgvhf/oqc9FWtiR59c	H3dO1NtpTiVl0L67Aagh	843	\N	2017-04-24 12:40:55.796	{}
ezbTcyb44/DQS1ppDUuT	sAxdggjzUR7+K6sSxnyU	C/RqIpnX/pI2SotfrOxl	11	\N	2017-04-26 08:29:04.6	{}
iRriPFcPb9BZ38uzwWma	ZNerBKfcGYvzcUKaYlqg	kWoBWJ7K9YAT1tVxGzHc	556	\N	2017-04-25 16:57:24.574	{}
Oy+6/GIIdKUfGNofOvUO	budgvhf/oqc9FWtiR59c	nRY4oQ6FO1/1QeJfD9SQ	505	\N	2017-04-24 14:06:56.638	{}
mcY4xVIIfWOg2JYJY9R6	TMTdMrgBYgxYoTLKWv35	3ivc9uCjilsvumU7Vqbm	560	\N	2017-04-24 20:10:55.944	{}
0N6Ui6rCeFNOC/ZJQXsO	TMTdMrgBYgxYoTLKWv35	kiFFetKW04Yrhp6Cg7iM	466	\N	2017-04-24 20:33:50.818	{}
sUyrp6rh99I556UvNHLp	sAxdggjzUR7+K6sSxnyU	V/k/SjCdny9tP/yhfOnL	515	\N	2017-04-26 21:18:12.09	{}
f9DBB0PMbPfwd8zeDl73	kMjFmLjttJpQS3rzutBf	J1rgIY5aLoqOR48jl7YH	941	\N	2017-04-25 14:20:30.427	{}
GIzR+EC6CqsRuAB/TgYS	ZNerBKfcGYvzcUKaYlqg	ix3Mcp8lFcbaIc6cSCGn	984	\N	2017-04-26 10:02:48.765	{}
VYLK89J8kSkZo/deoeDy	/cFEfNMpFxRDc1+1PpSb	Dr9TrSfvVOPKA9Ox26vE	330	\N	2017-04-24 13:56:55.334	{}
Fj0vHiY4I+AAnJ8C/JFd	CBp22Vfd78M4NgkRafEo	8rDn6vLbvs00mi34qIGX	55	\N	2017-04-25 09:40:55.611	{}
SpCKX/0pN87QvkupBy5C	kMjFmLjttJpQS3rzutBf	qObZJrbC7EQyCGBsAfSy	598	\N	2017-04-25 06:42:31.815	{}
Q4UQ+K91TM6c1bvYOsMR	kMjFmLjttJpQS3rzutBf	wk+dIhfirC+e4V3Hsi/F	609	\N	2017-04-26 04:50:18.311	{}
NdKmUoYFLLyRV0D1fWWX	sAxdggjzUR7+K6sSxnyU	3CDA1FGas2GwfOxvLQ5c	611	\N	2017-04-24 08:06:17.65	{}
Jf3EP4svq0QJe0JcWLuY	nbFMJA7w8Ms8VOsgI8Uj	3Ee4hBrrev0nY1CLY193	15	\N	2017-04-25 13:33:21.852	{}
r4qLVK99mBoncMj99qzu	/cFEfNMpFxRDc1+1PpSb	uESzXMpsf6g+HEvMWIA3	973	\N	2017-04-24 13:35:09.972	{}
RZgfv369S3QbKnDnBnaa	SBdioRVUMTzSJjoTQ8iG	3hEaa4dPEkZwl84fWsPS	83	\N	2017-04-24 06:58:15.955	{}
sbDFCyTx3BInQ0QVE3b5	y90eN2IFt6lwJmUaK9TF	DT8aL1s3TpbY+Pp0JprI	342	\N	2017-04-25 19:13:12.812	{}
ZvLB0mJNVsVIeeU0ZcRs	XklfmXtmNz7WRzaFwJPY	Y0TBa3XlrlJ+sF6zkX8k	56	\N	2017-04-25 12:53:41.9	{}
G07YAd1iWQu7uLxGZE2j	ZNerBKfcGYvzcUKaYlqg	kxS1BeeahcMjzaj0/hif	555	\N	2017-04-24 09:49:05.251	{}
LL//5bkQOv+vtKkrXwTS	YPGpbTqv9aeZHXxBNgIC	42jQoic5jPtKkVz/FDjO	250	\N	2017-04-26 14:58:27.089	{}
fMRSbRYOCNJVn2ChOA6w	TMTdMrgBYgxYoTLKWv35	nO7uZUnpBcOfIZeqNtMJ	256	\N	2017-04-24 15:34:57.562	{}
huFHDQ0m4jp9UMTHp3jX	budgvhf/oqc9FWtiR59c	gFPwbWaaERQNQmSSysVg	90	\N	2017-04-24 19:35:27.718	{}
LqdaJW644jpNMwBmFn87	+2fxb2EecC80U2DcxPMF	mX4grTAwwSGuecHNm3mY	445	\N	2017-04-24 05:57:59.396	{}
TA2JijxB1j9xfCzHnwPX	0/Dg4ohpw1BIoLvDgRkh	mX4grTAwwSGuecHNm3mY	427	\N	2017-04-25 20:50:08.62	{}
0gIFJ5o25Xl5MMIHs57A	sAxdggjzUR7+K6sSxnyU	xCVXYtEzQebsxaDah2vG	637	\N	2017-04-25 07:31:25.662	{}
s+hfJJS7qseqvTzYFuSU	TMTdMrgBYgxYoTLKWv35	U6e6GfiWUUgXR2x1KG69	657	\N	2017-04-25 21:27:19.424	{}
FtOCeWe137txqmaU17zf	y90eN2IFt6lwJmUaK9TF	TgqEedOJM3+osCXDJmk7	635	\N	2017-04-24 09:16:22.033	{}
gskVN9rMOoJcv/Vu5Lnm	sAxdggjzUR7+K6sSxnyU	a/e+iAXp5yJd5e4NZZsF	92	\N	2017-04-25 02:29:53.668	{}
DDpNnkwmLCpyaSgnx0s2	nbFMJA7w8Ms8VOsgI8Uj	tbl5xjC/uEJJQesAGUGl	447	\N	2017-04-24 09:13:37.443	{}
QhsVioNTSV9tWf9NVmGh	Mooca+XNOJQaJb6IILB6	kOvJqxyTC0T/kuk1vZZ3	583	\N	2017-04-24 22:15:59.188	{}
MgAALnrMeX7QzfTuyHGs	ljr+mdhFYpVziaRs0plq	L+/B6F5ejrSr8lqPeN30	226	\N	2017-04-25 02:23:39.282	{}
HS6p+FeDoX8Zqenhm9jj	sAxdggjzUR7+K6sSxnyU	RXfonBBi8eD0Gjipd4nV	408	\N	2017-04-24 05:06:58.316	{}
iWDxhd0cRLaeYC9sR+9f	0/Dg4ohpw1BIoLvDgRkh	5M0LYrIdTR+8ShtcGCCq	397	\N	2017-04-25 11:05:56.644	{}
sOpfwJaeXCB+j/w8+3QU	ZNerBKfcGYvzcUKaYlqg	IVVV+EyyVp8CIr8dh3Xa	946	\N	2017-04-26 15:20:19.43	{}
A4C/Tlc0ptrCLnM3rOwm	nbFMJA7w8Ms8VOsgI8Uj	e2XpYBeA93QZ4s8yR4a1	85	\N	2017-04-26 09:52:00.17	{}
bVVaSX2uZd/amR9zTOdo	y90eN2IFt6lwJmUaK9TF	muH3+mbrGNEZz3RN28C/	862	\N	2017-04-24 18:22:06.089	{}
i2W3hs8PowAZiRecRXW9	ZNerBKfcGYvzcUKaYlqg	h+MZlRhovfC4aPUF81Lt	947	\N	2017-04-25 23:46:27.115	{}
X6qUTsOM/V7+JWCTCJnX	ljr+mdhFYpVziaRs0plq	Ej1dsATXZFPrH1nNKhSh	871	\N	2017-04-25 22:20:58.483	{}
cVbGW5a2Todam35EHjeU	budgvhf/oqc9FWtiR59c	9yF0Ru6Q+EqjJF3Btl1F	989	\N	2017-04-25 17:57:16.132	{}
stuzYZrSttzzxdQ8nEkb	sAxdggjzUR7+K6sSxnyU	34gU/stM1HjVMqYBbeYy	287	\N	2017-04-25 10:40:12.23	{}
aOoTn7AJcQk5stYErAZA	budgvhf/oqc9FWtiR59c	34gU/stM1HjVMqYBbeYy	408	\N	2017-04-25 23:47:32.581	{}
NLNJp6SpMw3woAIawknI	0/Dg4ohpw1BIoLvDgRkh	oIkMyoKnCCuqeejyR3Ww	460	\N	2017-04-25 10:34:59.535	{}
OBIxGY7/lV8n08kZyg3M	ZNerBKfcGYvzcUKaYlqg	kt6cc6Pmh7UZGMv19kTY	722	\N	2017-04-26 14:05:37.338	{}
HD/z96APNCD9Un30x5f8	3KOaA2+6IjmFPfm4ChIJ	ItVfA7vmGRfXT7VE4ZEw	766	\N	2017-04-25 01:25:13.166	{}
pN5BLWwgzgNupAWFbC9N	YPGpbTqv9aeZHXxBNgIC	SPix0928XawGZzUL6Kk/	352	\N	2017-04-24 23:46:24.17	{}
a7xwzs2EH0jTy3zn1F07	TMTdMrgBYgxYoTLKWv35	VJxONa44CnuLblOXSHHA	655	\N	2017-04-25 09:50:15.885	{}
pnE5C4pQvY2UJJ2hhw5K	VErp5+HZdn3Yz2G88TZh	TT6lV3Da+edmBRtegDMW	35	\N	2017-04-25 14:28:28.922	{}
lEYB1CE6Lu44i650sS6w	VErp5+HZdn3Yz2G88TZh	O2wDntI78tu+T7NYV35b	585	\N	2017-04-24 06:50:11.423	{}
xu0DRQKAfRV9uHhywsI3	Hjjd3Ns0lvG3cs9jj4N7	+KFq6H5gE2G3XNzN0WFF	257	\N	2017-04-24 04:02:44.945	{}
rsO4kQSYUpj3xfOcgIHM	/cFEfNMpFxRDc1+1PpSb	i2RB16CZOdxMbDrWP8JC	805	\N	2017-04-26 10:15:30.932	{}
AOeseksHEfKAChFcOwmn	VErp5+HZdn3Yz2G88TZh	RGadtVwgyqPcFpcIj6IX	971	\N	2017-04-24 10:31:00.783	{}
4WMecNd5FNEEbFAGCwRr	/cFEfNMpFxRDc1+1PpSb	jthlSSB+N6sxxq0WFj6i	604	\N	2017-04-24 18:14:52.344	{}
g2Ujh/m9l7++cDmns+eZ	XklfmXtmNz7WRzaFwJPY	jbhoeFjdjBV/VrTmAQK8	737	\N	2017-04-26 11:49:59.694	{}
eDy8Wm4/5SdkWIIY+W4A	CBp22Vfd78M4NgkRafEo	Aue0ZMRucYCvc9Nc+DwM	385	\N	2017-04-24 07:20:27.214	{}
gAGxzZP3zzqV8MarV5Hp	YPGpbTqv9aeZHXxBNgIC	AAAmshqUyNGd5YN4rgGH	767	\N	2017-04-26 00:37:49.041	{}
VVSpSfQwaY8Ht46FAzq0	TMTdMrgBYgxYoTLKWv35	KhReTUGJJqO8kWa5kgIs	661	\N	2017-04-24 16:55:17.472	{}
ASvFoEXVJ7OcM4aXi6D+	VErp5+HZdn3Yz2G88TZh	J4dNEW+yJYDnKdh+Op+0	308	\N	2017-04-26 04:06:37.312	{}
qxiq6QbKAzWN/2Cxu2i8	nbFMJA7w8Ms8VOsgI8Uj	VOc28aaxQDAYO8y6JV6h	619	\N	2017-04-26 03:47:50.142	{}
l/sdIiZeTYAcda+Smf1o	budgvhf/oqc9FWtiR59c	I+dYk2/QYXfRgeNhEVGK	159	\N	2017-04-26 01:46:38.906	{}
KrS819o8JkLNg6Ate0Io	y90eN2IFt6lwJmUaK9TF	QPxY+750eT4NfxyrXz8G	31	\N	2017-04-26 23:01:57.043	{}
d+LhIJhImbpbbRnOm4xf	Hjjd3Ns0lvG3cs9jj4N7	TYQ80BLHc6zh1O3t6boZ	582	\N	2017-04-25 22:02:19.045	{}
fpxe/sicAlUAng6JMYUH	VErp5+HZdn3Yz2G88TZh	tuwIwDTcWMij5Lsn+dF2	456	\N	2017-04-24 00:30:10.479	{}
tLa+iCcUF16EEb8r/EYE	nbFMJA7w8Ms8VOsgI8Uj	gRGZ7MezXg5x1YTQ+kv6	88	\N	2017-04-26 20:48:59.55	{}
d52jO6huRGs06jxsT3V/	0/Dg4ohpw1BIoLvDgRkh	ZAW151HGQCKKqimRLisC	977	\N	2017-04-24 19:20:13.566	{}
9TMNs6r2pzAMPZi8s7VH	budgvhf/oqc9FWtiR59c	v0/uFtYnnfnaglP4uUwh	246	\N	2017-04-25 14:27:25.56	{}
S5cFP5q/YbOR/fFvoPfa	nbFMJA7w8Ms8VOsgI8Uj	kiFFetKW04Yrhp6Cg7iM	556	\N	2017-04-24 13:04:28.352	{}
H40NzlV8382l8a/TaNsT	rc+ccdAK8F4ROpIC299B	V/k/SjCdny9tP/yhfOnL	879	\N	2017-04-26 04:45:24.781	{}
ZLranVjeteYQMEbenyiz	nbFMJA7w8Ms8VOsgI8Uj	F5o+9kbgy4nX67AcECKy	296	\N	2017-04-24 07:45:09.039	{}
gpfRCPd4APaoDKHN61xo	ZNerBKfcGYvzcUKaYlqg	Dr9TrSfvVOPKA9Ox26vE	222	\N	2017-04-24 14:42:28.815	{}
VuH1PEh3aCmjQJEH0iTP	nbFMJA7w8Ms8VOsgI8Uj	VRB60g1OHcTkrbbpfMXb	54	\N	2017-04-26 18:17:09.048	{}
wiZF7Bz1A4emvvUhH/nF	Mooca+XNOJQaJb6IILB6	qObZJrbC7EQyCGBsAfSy	69	\N	2017-04-26 17:18:40.028	{}
TbXtfJ2e2ArtrAAVRliw	budgvhf/oqc9FWtiR59c	wk+dIhfirC+e4V3Hsi/F	349	\N	2017-04-26 16:10:01.748	{}
u1vHLslXCx28hWi+s/bv	0/Dg4ohpw1BIoLvDgRkh	3CDA1FGas2GwfOxvLQ5c	595	\N	2017-04-25 06:47:55.067	{}
NWZzXHCk8ELSk0BWUzLv	VErp5+HZdn3Yz2G88TZh	3Ee4hBrrev0nY1CLY193	778	\N	2017-04-24 00:18:54.4	{}
C/yMOrr/VUjpNIcyshw5	budgvhf/oqc9FWtiR59c	3hEaa4dPEkZwl84fWsPS	858	\N	2017-04-26 04:56:38.142	{}
4yuI+8QUpJaVyUSpKVn7	+2fxb2EecC80U2DcxPMF	veA3G9e1Dje1x8Tqvu16	647	\N	2017-04-25 01:31:46.5	{}
ql++m4ohcmvgMMNAe24q	3KOaA2+6IjmFPfm4ChIJ	9AJwBZiro266QvZF51YF	566	\N	2017-04-26 14:58:54.17	{}
Nkg5twLp1pVhtlhglX/f	sAxdggjzUR7+K6sSxnyU	0aYRcG/M0/X/yYGNJAtm	358	\N	2017-04-26 12:30:03.27	{}
zTAtmQfAy7/ovMZ6/jNh	YPGpbTqv9aeZHXxBNgIC	/GjBU0I+Dv+u/j6p+M9p	780	\N	2017-04-24 07:20:04.096	{}
fZkC24gjAXhqRB7ksJxc	XklfmXtmNz7WRzaFwJPY	6wmjE3uwTSZINRaOFRFO	715	\N	2017-04-24 20:53:54.16	{}
IqjwysjY8xccH5SBjblc	rc+ccdAK8F4ROpIC299B	Tk2nWZkvlXcO9xwqydL/	964	\N	2017-04-25 10:33:13.421	{}
vXRzM/mZw4tchRfTZCuK	budgvhf/oqc9FWtiR59c	TplX8W/+vRMKUBR5PRC4	48	\N	2017-04-26 17:10:16.232	{}
N5pxkc5Sf0+KIpO6MnJe	Hjjd3Ns0lvG3cs9jj4N7	D2JhHQi0jZGFKUXdbOCA	815	\N	2017-04-24 12:15:37.199	{}
vTyQYAZcHFn3Cf+WaQBz	VErp5+HZdn3Yz2G88TZh	wXA7apJ37w4JqdlwN65J	141	\N	2017-04-25 11:28:45.809	{}
c7j4KhGxc5pBELCpBRG3	y90eN2IFt6lwJmUaK9TF	/1JN4ijVNKPJTcmz/Idf	799	\N	2017-04-26 11:41:15.691	{}
quxiXHb8wiXdKDpfue9W	kMjFmLjttJpQS3rzutBf	d8lZQ0RqfLctcs9Jhdau	758	\N	2017-04-25 23:44:10.942	{}
0/KsgecX4qeerusov1ox	Hjjd3Ns0lvG3cs9jj4N7	MXHnuThLBxyMqf2x9RYX	26	\N	2017-04-25 17:28:50.232	{}
i8Ppagu7WeRIQsXekthv	y90eN2IFt6lwJmUaK9TF	tbl5xjC/uEJJQesAGUGl	768	\N	2017-04-24 20:41:20.749	{}
1x8t9bRJqvAP9UeCULsB	ljr+mdhFYpVziaRs0plq	I1BqKwsQft8m3T75pDo6	927	\N	2017-04-24 05:52:19.719	{}
4J+f/pGx7ubWqymQelNP	kMjFmLjttJpQS3rzutBf	NLUV9IYvt+YVxZReZ7bu	873	\N	2017-04-25 02:00:01.601	{}
+e9kDZhv1u0vAxgQLJ8n	3KOaA2+6IjmFPfm4ChIJ	RXfonBBi8eD0Gjipd4nV	453	\N	2017-04-26 03:56:41.566	{}
jtxsyY+vGePR7oF2ucmP	rc+ccdAK8F4ROpIC299B	YZ5KjVTkfycwHcGhfhLm	460	\N	2017-04-26 05:35:46.333	{}
BSGIgRIXT0ear9lfSBXd	Mooca+XNOJQaJb6IILB6	tBDb8F150sbq51wCVjVP	202	\N	2017-04-25 20:37:13.07	{}
S3wfReyOmfCSrByhEAXh	YPGpbTqv9aeZHXxBNgIC	r49mnatyGyT1FMKiWajG	183	\N	2017-04-24 20:16:20.474	{}
RzC4VLZ/fm0JG1QWrJXj	XklfmXtmNz7WRzaFwJPY	ZeUgcf1m5S8cal6hpxHD	497	\N	2017-04-26 08:06:54.347	{}
sM7X2FtBbf2s2VMOk+tv	CBp22Vfd78M4NgkRafEo	BBuNp8/PWPaNiWTxKcVf	482	\N	2017-04-26 07:38:00.519	{}
H0U1vCbld9ysaBet+Ryj	CBp22Vfd78M4NgkRafEo	aQJTOyQtMaQ7mGwL4VtH	817	\N	2017-04-25 02:02:29.781	{}
mbXH8DTrSQstbSC/2NT0	Hjjd3Ns0lvG3cs9jj4N7	Q1Gj1Hi1QW9kUnL1LDjm	501	\N	2017-04-26 11:47:10.487	{}
iZWc8csTVgyNgaiwjU8O	/cFEfNMpFxRDc1+1PpSb	+kexVvlwST2wwazO3f3H	835	\N	2017-04-26 22:47:00.681	{}
qjnAZ6ec9qOV0XEjeij9	/cFEfNMpFxRDc1+1PpSb	q8JJVBkcn8bBVYAwYK8H	633	\N	2017-04-25 08:58:45.335	{}
Vft5ewDclk5EtAmtpVYM	TMTdMrgBYgxYoTLKWv35	h+MZlRhovfC4aPUF81Lt	563	\N	2017-04-25 22:16:50.166	{}
NP2RZNuVG6EszHwlfOlq	VErp5+HZdn3Yz2G88TZh	oP/r2lZmgfki6Ta0nW5V	601	\N	2017-04-26 10:35:27.505	{}
VHKHhG0VnzDYCMNbLOlx	nbFMJA7w8Ms8VOsgI8Uj	TmA60eUk/eSPAxliVWvu	283	\N	2017-04-26 21:00:07.414	{}
KwAMWtT3I3x9w9dSCxPC	XklfmXtmNz7WRzaFwJPY	YyNILZgOF/StfrrXbbOx	874	\N	2017-04-24 21:34:08.871	{}
hFZiEsEmK3lhyHs1pINK	Mooca+XNOJQaJb6IILB6	56ZhLQV0ZO55MYlrpJ0/	642	\N	2017-04-25 12:15:35.758	{}
aUxdtFfuzCRT45qXXNe4	CBp22Vfd78M4NgkRafEo	bfNEf7WaxhTBCSyrYFGF	698	\N	2017-04-24 13:40:33.637	{}
cepjIsMLZ/Y+Z6UsvntO	rc+ccdAK8F4ROpIC299B	IEaNOQ0FdwgajKVrJ/pt	194	\N	2017-04-25 18:08:00.189	{}
LiZS4YxcZ+aEzxdoRoA7	0/Dg4ohpw1BIoLvDgRkh	u3ZLZ1wSaBUI1ir/s87f	161	\N	2017-04-24 06:03:41.011	{}
10CBlCwuyMwFRQ2d/UdD	Mooca+XNOJQaJb6IILB6	kOfIDrxpMkehDzg6h/Qy	66	\N	2017-04-25 21:09:17.202	{}
Ljib1LGaiyCOo+Mz5TlH	YPGpbTqv9aeZHXxBNgIC	iB1yVx7wL7vUVWntNT0O	439	\N	2017-04-24 22:08:25.932	{}
FTCt8w8rsKcLtPHRW2gF	ljr+mdhFYpVziaRs0plq	TfV8Rj5vviivHod09QWk	753	\N	2017-04-25 06:02:43.79	{}
oSxFAiuuJdm4lwcgyQup	budgvhf/oqc9FWtiR59c	TT6lV3Da+edmBRtegDMW	960	\N	2017-04-25 23:07:51.137	{}
EBG9o3m2yt203qB/8jEI	/cFEfNMpFxRDc1+1PpSb	at2Ldk9Pzrwqgc4PXVdk	867	\N	2017-04-26 22:09:34.241	{}
wrSEz1zXb9ejTo/EUwuJ	budgvhf/oqc9FWtiR59c	gYySmHDQFnlSeSTMFmzt	799	\N	2017-04-24 13:39:09.095	{}
wHhYbFHxP6uklR0ueZmi	SBdioRVUMTzSJjoTQ8iG	i2RB16CZOdxMbDrWP8JC	362	\N	2017-04-24 17:04:20.363	{}
yNyd38wl1E1o/T2tscYn	Hjjd3Ns0lvG3cs9jj4N7	RGadtVwgyqPcFpcIj6IX	744	\N	2017-04-26 05:51:36.085	{}
wwl1N4fJ3iyEo8iG02nU	budgvhf/oqc9FWtiR59c	uFBXmkHI0ztcqHAecY/i	294	\N	2017-04-25 11:27:05.986	{}
R+wbLnAwalJWtqYWt/YS	VErp5+HZdn3Yz2G88TZh	jbhoeFjdjBV/VrTmAQK8	66	\N	2017-04-24 17:50:52.608	{}
iSEkICHj8DCiiAODXwnB	kMjFmLjttJpQS3rzutBf	9iLudLiowiDb3PU6lfMN	897	\N	2017-04-24 13:34:27.955	{}
twFxjuZELM8tCGmnVkLJ	y90eN2IFt6lwJmUaK9TF	r8nUQ7i1nq4g5JCxBAV7	243	\N	2017-04-25 02:20:37.705	{}
sv/xFZWgXZfcZXECxXSn	y90eN2IFt6lwJmUaK9TF	KhReTUGJJqO8kWa5kgIs	650	\N	2017-04-26 07:32:22.94	{}
koT10A2q0ZWxYQa3SBp/	ljr+mdhFYpVziaRs0plq	bFdyWo+XvwHOl7sZINqH	653	\N	2017-04-25 08:59:32.592	{}
ikOGP8a3oNafww6/c615	Hjjd3Ns0lvG3cs9jj4N7	va+dgTyi0kL3dIcgn48J	623	\N	2017-04-25 09:13:33.743	{}
VZSSh8EMf5mxQG+UdO70	Mooca+XNOJQaJb6IILB6	ZP1GPC+i2CXZVnl9GYb7	38	\N	2017-04-26 14:55:26.456	{}
u9At5P1PaxLIPsZoQSRX	0/Dg4ohpw1BIoLvDgRkh	I+dYk2/QYXfRgeNhEVGK	562	\N	2017-04-24 10:58:58.99	{}
/+fHtFELpUU/ncad5Hi+	ZNerBKfcGYvzcUKaYlqg	g53TbiDOJdJAkfVV7Dq3	605	\N	2017-04-26 19:16:39.808	{}
hnWUbZxs7KhQ1OmpDInQ	rc+ccdAK8F4ROpIC299B	ungxFy6KF+BduXSw6aNb	864	\N	2017-04-25 18:39:29.887	{}
58HDNiwNMNoMnTvqov6+	Hjjd3Ns0lvG3cs9jj4N7	C/RqIpnX/pI2SotfrOxl	964	\N	2017-04-26 00:08:15.698	{}
/loe993pYaRltD6G7iUy	0/Dg4ohpw1BIoLvDgRkh	kWoBWJ7K9YAT1tVxGzHc	270	\N	2017-04-24 02:23:54.074	{}
J2ESdIGUsgOBiwYOK4Uu	YPGpbTqv9aeZHXxBNgIC	nRY4oQ6FO1/1QeJfD9SQ	35	\N	2017-04-24 17:46:23.302	{}
JBElZGvHYpaBWSEuhshS	+2fxb2EecC80U2DcxPMF	3ivc9uCjilsvumU7Vqbm	893	\N	2017-04-26 06:01:11.413	{}
+SH8/vnENB74H5H0+1Xc	ZNerBKfcGYvzcUKaYlqg	Loc5UWpBwKw20QipAxO/	728	\N	2017-04-24 00:25:39.154	{}
VTruii24aaQ9PKXLcn6Q	ljr+mdhFYpVziaRs0plq	KJNoh/ej84YWQnnLAjFM	843	\N	2017-04-26 02:40:44.248	{}
+QXDStr/JAfS4n5iHKgy	sAxdggjzUR7+K6sSxnyU	s3TECC9coOAQ/4HdlxJm	448	\N	2017-04-26 01:59:42.451	{}
yY2I+05rTjC9R/mAq0J4	kMjFmLjttJpQS3rzutBf	QA++Kdn184yTKqKfTwR9	784	\N	2017-04-26 13:27:11.281	{}
BXqaKD9/wBisfS0ymHzJ	budgvhf/oqc9FWtiR59c	Dr9TrSfvVOPKA9Ox26vE	9	\N	2017-04-24 06:30:10.63	{}
HZ05Z65ukRYnTolbjN1g	+2fxb2EecC80U2DcxPMF	J0WjYEjcW6XxMPUp/h4Q	141	\N	2017-04-26 11:31:35.532	{}
EUJgrxb0iMYuWOTl6hfU	TMTdMrgBYgxYoTLKWv35	WqxeqRscZU3eI/V+vJ4+	294	\N	2017-04-25 23:03:33.214	{}
BAECOeO/4gx2oQLoKTeP	VErp5+HZdn3Yz2G88TZh	CDjW4fVWUlVAY5ENtqU8	853	\N	2017-04-25 12:06:29.113	{}
wTbuPzBu6JxHNEmYIAwI	0/Dg4ohpw1BIoLvDgRkh	CDjW4fVWUlVAY5ENtqU8	803	\N	2017-04-24 10:10:52.076	{}
T2rjxlGgeQrkIzsIymAk	TMTdMrgBYgxYoTLKWv35	2lIo9jpuu/L5ekctK0hw	341	\N	2017-04-24 16:15:05.392	{}
B0BguV6qOhSCKKNYsE1U	budgvhf/oqc9FWtiR59c	2/+Fxmhv+s/k+H4mHUms	15	\N	2017-04-24 12:44:12.024	{}
7FgJQqqrEPHyBxUk3UZa	sAxdggjzUR7+K6sSxnyU	78a49+FqXMeRBJjW84Nm	144	\N	2017-04-26 16:28:57.288	{}
ExSlGdcCn6+M/sge5U0m	0/Dg4ohpw1BIoLvDgRkh	fx5FF+vvMjCD3PLsxHfl	621	\N	2017-04-26 23:13:09.231	{}
xJqYpWo1n3c3ry+Sm51Y	y90eN2IFt6lwJmUaK9TF	kxS1BeeahcMjzaj0/hif	659	\N	2017-04-24 15:57:19.417	{}
oorR39mZY6khEOQ84Hms	YPGpbTqv9aeZHXxBNgIC	/GjBU0I+Dv+u/j6p+M9p	668	\N	2017-04-25 19:01:18.625	{}
m7/kaaQAte9GB4h9xkEg	CBp22Vfd78M4NgkRafEo	6wmjE3uwTSZINRaOFRFO	250	\N	2017-04-25 17:34:17.482	{}
0BSHIcHXT2AmFZA3+Sfl	Hjjd3Ns0lvG3cs9jj4N7	z95tJp4X5L9vBJKb0lWY	539	\N	2017-04-26 22:25:29.128	{}
Snii6W6t+YErkaNKMBhi	TMTdMrgBYgxYoTLKWv35	TplX8W/+vRMKUBR5PRC4	434	\N	2017-04-24 20:41:12.228	{}
USit2ISEUlrKZ8pm8jBY	YPGpbTqv9aeZHXxBNgIC	mX4grTAwwSGuecHNm3mY	32	\N	2017-04-25 07:28:53.743	{}
e0BZg9y+kU06slKIdF6D	kMjFmLjttJpQS3rzutBf	xCVXYtEzQebsxaDah2vG	312	\N	2017-04-25 22:27:32.807	{}
AUjLNIdP5MfvWHxG9Qsa	Mooca+XNOJQaJb6IILB6	/1JN4ijVNKPJTcmz/Idf	527	\N	2017-04-26 15:41:43.569	{}
kliArY8X+ba0UGinJAvU	SBdioRVUMTzSJjoTQ8iG	TgqEedOJM3+osCXDJmk7	239	\N	2017-04-26 06:09:24.123	{}
TMa6uwlgQ4f1dz2CWlVN	ZNerBKfcGYvzcUKaYlqg	a/e+iAXp5yJd5e4NZZsF	639	\N	2017-04-25 15:29:38.974	{}
58Puj6eSCOmCKNnLn8fq	+2fxb2EecC80U2DcxPMF	tbl5xjC/uEJJQesAGUGl	159	\N	2017-04-24 08:21:03.702	{}
OGeb/zJbpUKKr1W66xdE	VErp5+HZdn3Yz2G88TZh	kOvJqxyTC0T/kuk1vZZ3	269	\N	2017-04-25 20:02:13.944	{}
tyvBXCEUqQJTonkAZeRu	/cFEfNMpFxRDc1+1PpSb	NLUV9IYvt+YVxZReZ7bu	294	\N	2017-04-24 19:06:16.905	{}
M0SWk+Eyha3qbWP47d9Y	SBdioRVUMTzSJjoTQ8iG	09n6j6bCEnQcNZWCXXw3	66	\N	2017-04-25 02:25:08.478	{}
uUfQl6BS2QnmzL9cvNKj	Hjjd3Ns0lvG3cs9jj4N7	5M0LYrIdTR+8ShtcGCCq	284	\N	2017-04-26 04:58:59.737	{}
ilGvR3xKuzWl8OXDPf10	CBp22Vfd78M4NgkRafEo	IVVV+EyyVp8CIr8dh3Xa	926	\N	2017-04-24 08:32:09.802	{}
EGfaanmRvL5q0NBTQw7Y	y90eN2IFt6lwJmUaK9TF	e2XpYBeA93QZ4s8yR4a1	636	\N	2017-04-24 02:18:15.63	{}
MMcrRztBzmhmx/PDEWLh	0/Dg4ohpw1BIoLvDgRkh	ilxDp6qJGfsCKDWvoJK9	566	\N	2017-04-25 10:51:08.854	{}
EpRk6ed8yUyc/T2MRQ1E	XklfmXtmNz7WRzaFwJPY	esk7+l2uhMtsgprnpuuW	847	\N	2017-04-25 14:44:07.711	{}
a1WPDZORLz81X6TYGdUL	SBdioRVUMTzSJjoTQ8iG	0YD41fg1u2CfSRn7oJZF	102	\N	2017-04-26 15:31:44.122	{}
yWZEvZB84LnSsmuIZkYd	rc+ccdAK8F4ROpIC299B	JiZ2D82AFB4JE3RV8V2r	905	\N	2017-04-24 13:26:15.07	{}
3DQ4lrsU4xVK166Exjqp	sAxdggjzUR7+K6sSxnyU	BcSrc5QQHlfh1XgzXAWw	87	\N	2017-04-25 17:57:37.877	{}
X+BvZol0rqVPnLtjWrM9	3KOaA2+6IjmFPfm4ChIJ	Ej1dsATXZFPrH1nNKhSh	1	\N	2017-04-26 16:20:16.063	{}
rWdb822KVZ33mYg6mUN+	/cFEfNMpFxRDc1+1PpSb	9yF0Ru6Q+EqjJF3Btl1F	666	\N	2017-04-26 20:11:05.377	{}
rYNczoJG7bwz00ApcFe1	Mooca+XNOJQaJb6IILB6	34gU/stM1HjVMqYBbeYy	901	\N	2017-04-25 14:13:13.208	{}
Z2dqrTLoYt4e7UhuIuNK	+2fxb2EecC80U2DcxPMF	oIkMyoKnCCuqeejyR3Ww	357	\N	2017-04-26 07:49:19.541	{}
ZpfFx8HNgYDogoUBmD05	ZNerBKfcGYvzcUKaYlqg	Brm3g5xATmBROWbeDzev	866	\N	2017-04-26 10:15:53.924	{}
EMDAfc+JmEzQnlSXTmr0	TMTdMrgBYgxYoTLKWv35	kt6cc6Pmh7UZGMv19kTY	137	\N	2017-04-25 12:31:14.82	{}
kn1Wc+X7d6dxGPZTSupo	YPGpbTqv9aeZHXxBNgIC	u3ZLZ1wSaBUI1ir/s87f	140	\N	2017-04-24 22:58:54.004	{}
3RuBApCvDZhMRkHpOzDM	budgvhf/oqc9FWtiR59c	kOfIDrxpMkehDzg6h/Qy	946	\N	2017-04-25 13:44:23.966	{}
Ggt3tzlTUCy2Es4gOoEJ	+2fxb2EecC80U2DcxPMF	eSP4HEKPd6KnUKdXNgi+	83	\N	2017-04-25 05:38:05.956	{}
I25Oimx9wGx2hnOD8/nV	budgvhf/oqc9FWtiR59c	YGwamAmejWkGT2LbhCTz	506	\N	2017-04-26 08:33:58.274	{}
VNAeQecyIRUMqcKEn56G	rc+ccdAK8F4ROpIC299B	TfV8Rj5vviivHod09QWk	563	\N	2017-04-24 07:20:36.012	{}
nejsKKxBT7i+iHNSCLTx	/cFEfNMpFxRDc1+1PpSb	tZSRHXott6U7y2nfL4p2	631	\N	2017-04-25 23:40:30.795	{}
2kS+jDra/pXo2PQIBNCZ	/cFEfNMpFxRDc1+1PpSb	at2Ldk9Pzrwqgc4PXVdk	415	\N	2017-04-26 21:56:41.605	{}
Xd4UJ8B/zaUNUysH3a4Z	CBp22Vfd78M4NgkRafEo	35DOZvz03Fh9/vhxaZ6h	435	\N	2017-04-24 08:25:26.183	{}
M3t6xiiS6rbgfSWej+IS	/cFEfNMpFxRDc1+1PpSb	i2RB16CZOdxMbDrWP8JC	353	\N	2017-04-25 11:31:40.027	{}
WOnbY30S3oIkvYERZFyN	CBp22Vfd78M4NgkRafEo	wwuPyhGagwYUqRSH59Q5	937	\N	2017-04-24 03:20:29.026	{}
bJCw8kSWDsS9YBU+bSE8	sAxdggjzUR7+K6sSxnyU	jthlSSB+N6sxxq0WFj6i	818	\N	2017-04-25 08:55:40.928	{}
xVqZ0cF1qKRaF4W1pck9	budgvhf/oqc9FWtiR59c	jbhoeFjdjBV/VrTmAQK8	871	\N	2017-04-24 07:07:42.724	{}
UpfSJ27ZAIV0UVT6QIBC	CBp22Vfd78M4NgkRafEo	9iLudLiowiDb3PU6lfMN	378	\N	2017-04-26 17:10:59.943	{}
rTlbB6fIjdj40SrOjjfR	y90eN2IFt6lwJmUaK9TF	AAAmshqUyNGd5YN4rgGH	894	\N	2017-04-24 02:58:07.089	{}
Ee7uLDfG3IKf7WX7cZJh	VErp5+HZdn3Yz2G88TZh	N2m0kYjYefC5EaE1TKyU	4	\N	2017-04-24 21:37:40.496	{}
ULiFoNm7y1uyxy1S+hrh	3KOaA2+6IjmFPfm4ChIJ	J4dNEW+yJYDnKdh+Op+0	797	\N	2017-04-24 11:39:13.225	{}
YAc9x0tHU7PagwDPMYV6	SBdioRVUMTzSJjoTQ8iG	VOc28aaxQDAYO8y6JV6h	561	\N	2017-04-24 16:37:33.326	{}
AThB3cdlcYXjAr089i2b	0/Dg4ohpw1BIoLvDgRkh	bSUJms9ytpe0LJCy+49v	867	\N	2017-04-26 18:42:49.31	{}
L3hjg9jwNPUgERXbZcBn	+2fxb2EecC80U2DcxPMF	QPxY+750eT4NfxyrXz8G	255	\N	2017-04-24 23:35:14.268	{}
rMZsfcUXAZxvYTJQM0dn	sAxdggjzUR7+K6sSxnyU	ypsn+18pu/Kj7toQQgEk	229	\N	2017-04-24 00:03:12.954	{}
Cymr12U2xvVWskfpDUqx	nbFMJA7w8Ms8VOsgI8Uj	C/RqIpnX/pI2SotfrOxl	791	\N	2017-04-25 15:06:48.959	{}
4tSHJbxBzp1QtHP/Gzvx	TMTdMrgBYgxYoTLKWv35	kWoBWJ7K9YAT1tVxGzHc	544	\N	2017-04-26 07:13:33.19	{}
tVUkWy6XuWjr5gMekIP8	YPGpbTqv9aeZHXxBNgIC	ZAW151HGQCKKqimRLisC	573	\N	2017-04-26 02:47:28.486	{}
2v4yEbMSA2Lz7UtFR0e7	+2fxb2EecC80U2DcxPMF	Loc5UWpBwKw20QipAxO/	291	\N	2017-04-24 23:07:26.097	{}
ceZupAITXmrvEBUGC8Ss	nbFMJA7w8Ms8VOsgI8Uj	MbThFCstiI1CO3Q1TbWX	285	\N	2017-04-26 06:31:06.305	{}
U7d+21awLvjgCKjh5VHN	kMjFmLjttJpQS3rzutBf	J1rgIY5aLoqOR48jl7YH	986	\N	2017-04-25 20:55:57.137	{}
9esaFuHTWg/hL3IpEvjP	/cFEfNMpFxRDc1+1PpSb	QA++Kdn184yTKqKfTwR9	813	\N	2017-04-26 08:24:17.491	{}
4Tf/1oaEOjwotdmlbLjz	0/Dg4ohpw1BIoLvDgRkh	ix3Mcp8lFcbaIc6cSCGn	546	\N	2017-04-25 09:04:19.013	{}
o19Gs5fmaymXgt4wB/cB	XklfmXtmNz7WRzaFwJPY	J0WjYEjcW6XxMPUp/h4Q	423	\N	2017-04-24 15:55:56.888	{}
Vp+XYKpb6P2GbOXpLRQr	y90eN2IFt6lwJmUaK9TF	8rDn6vLbvs00mi34qIGX	434	\N	2017-04-24 21:25:29.123	{}
yzXk0wSxu0lmgoM9DldH	+2fxb2EecC80U2DcxPMF	WqxeqRscZU3eI/V+vJ4+	82	\N	2017-04-26 08:25:43.675	{}
OwTUlNAABTpX2zouZEh3	XklfmXtmNz7WRzaFwJPY	CDjW4fVWUlVAY5ENtqU8	378	\N	2017-04-26 22:24:15.741	{}
s9uAudTRNYlCZoU+fsyw	nbFMJA7w8Ms8VOsgI8Uj	zXEeqbW5cEtrjIaq6+p/	347	\N	2017-04-25 19:28:28.104	{}
J6LgrgQgKOFaP7HFHGHj	budgvhf/oqc9FWtiR59c	2/+Fxmhv+s/k+H4mHUms	937	\N	2017-04-26 10:22:23.002	{}
M04qEmoCis6+SXcwHypn	Hjjd3Ns0lvG3cs9jj4N7	JQYRDAWAk45nGnhLSWhx	62	\N	2017-04-25 02:41:23.433	{}
/DFHpebSdRkRttyeTNKi	budgvhf/oqc9FWtiR59c	78a49+FqXMeRBJjW84Nm	67	\N	2017-04-25 07:47:47.072	{}
85UOJ82eQX4XJXPrz0QP	budgvhf/oqc9FWtiR59c	Y0TBa3XlrlJ+sF6zkX8k	549	\N	2017-04-26 22:33:33.667	{}
4AuzzfA/M2MLkjbwfh3j	+2fxb2EecC80U2DcxPMF	kxS1BeeahcMjzaj0/hif	109	\N	2017-04-26 10:25:29.44	{}
JrVGN/HF/U+uG3/DskAP	nbFMJA7w8Ms8VOsgI8Uj	42jQoic5jPtKkVz/FDjO	902	\N	2017-04-24 10:04:56.439	{}
U3e1tKCycO4vxCefxIo4	ZNerBKfcGYvzcUKaYlqg	nO7uZUnpBcOfIZeqNtMJ	334	\N	2017-04-26 13:34:27.751	{}
ItRcikw/HhtN7OjS5pQd	TMTdMrgBYgxYoTLKWv35	z95tJp4X5L9vBJKb0lWY	914	\N	2017-04-26 04:18:57.571	{}
JlUtRi2LN8ii82Z9U9vw	SBdioRVUMTzSJjoTQ8iG	TplX8W/+vRMKUBR5PRC4	527	\N	2017-04-24 15:40:20.078	{}
8jlu+E8z0CtdvkkCY/E9	ljr+mdhFYpVziaRs0plq	bKeGlGsiR36OnvQt6Jv8	142	\N	2017-04-25 10:25:17.374	{}
9/oQ1QuPoJwDVbBBkJuM	y90eN2IFt6lwJmUaK9TF	wXA7apJ37w4JqdlwN65J	146	\N	2017-04-26 13:51:49.447	{}
S7yYKIaqqQwTBGNl9BZi	sAxdggjzUR7+K6sSxnyU	U6e6GfiWUUgXR2x1KG69	202	\N	2017-04-24 20:32:18.506	{}
XT+G4X5Eex+AU9MjAzCF	ljr+mdhFYpVziaRs0plq	/1JN4ijVNKPJTcmz/Idf	501	\N	2017-04-26 14:35:18.942	{}
/18Y17ojj30/ZjiCEtft	TMTdMrgBYgxYoTLKWv35	d8lZQ0RqfLctcs9Jhdau	82	\N	2017-04-26 20:50:42.185	{}
ZGrCjaX36ktFj6X0h/mM	nbFMJA7w8Ms8VOsgI8Uj	/wcVJZDDfXqd/P0mRVM6	545	\N	2017-04-26 03:59:54.115	{}
l2jqHaU0ks0ywMo6rpa9	Mooca+XNOJQaJb6IILB6	4yK7vx1ekhuQ7wVO6kYM	349	\N	2017-04-25 22:19:33.011	{}
+pl+7aDFnMUhjwihZ4mG	CBp22Vfd78M4NgkRafEo	5AtIOTMpR2HWS/urXzzl	241	\N	2017-04-24 20:49:26.633	{}
aKQJLhpIpgh4UlQ4j/77	SBdioRVUMTzSJjoTQ8iG	I1BqKwsQft8m3T75pDo6	376	\N	2017-04-25 04:57:12.273	{}
pQs0mXmMGpPWpCuTn+C4	YPGpbTqv9aeZHXxBNgIC	7/xzrSWg0Cs1TUuQk6eT	421	\N	2017-04-26 00:54:26.003	{}
PWL3hLl+65Lw3BMWwKeC	rc+ccdAK8F4ROpIC299B	6KryoSrWf5AvjQH8ogqs	737	\N	2017-04-26 22:22:21.584	{}
7i/mQkPjTwL4IsfjJMoi	SBdioRVUMTzSJjoTQ8iG	tBDb8F150sbq51wCVjVP	959	\N	2017-04-25 14:11:40.255	{}
P6X/na4VhdqLR5DdPqD0	SBdioRVUMTzSJjoTQ8iG	IVVV+EyyVp8CIr8dh3Xa	211	\N	2017-04-24 03:48:29.069	{}
5jWOcRYnjsBEigMQVBrU	CBp22Vfd78M4NgkRafEo	ZeUgcf1m5S8cal6hpxHD	8	\N	2017-04-26 04:53:52.358	{}
M5VUw6AEPfjRFN3TcEaN	TMTdMrgBYgxYoTLKWv35	ilxDp6qJGfsCKDWvoJK9	147	\N	2017-04-26 11:37:07.769	{}
WIL5S+QGXX9cahY6V5Oa	Hjjd3Ns0lvG3cs9jj4N7	esk7+l2uhMtsgprnpuuW	373	\N	2017-04-24 02:48:05.594	{}
u8PIl9K2Ga0pCydIihpj	rc+ccdAK8F4ROpIC299B	1Fuuc0ItfmiFbsZcYc//	244	\N	2017-04-24 23:17:23.921	{}
W+dlNnaUdIgwERfmyFhc	kMjFmLjttJpQS3rzutBf	Ej1dsATXZFPrH1nNKhSh	952	\N	2017-04-25 03:27:38.054	{}
fgupWkLNq8KHtzgaQQ4r	SBdioRVUMTzSJjoTQ8iG	YyNILZgOF/StfrrXbbOx	173	\N	2017-04-24 13:17:00.845	{}
EBjMajRK9BaJHO1MV0+3	Hjjd3Ns0lvG3cs9jj4N7	34gU/stM1HjVMqYBbeYy	387	\N	2017-04-25 05:40:22.58	{}
KT4WSvddbY6w0dbYkIJT	rc+ccdAK8F4ROpIC299B	oIkMyoKnCCuqeejyR3Ww	717	\N	2017-04-26 13:54:18.163	{}
5VMsPbiv2uEoEzduNzwS	3KOaA2+6IjmFPfm4ChIJ	bfNEf7WaxhTBCSyrYFGF	254	\N	2017-04-25 23:39:38.225	{}
pJvb7Ymr9F6Uor8e2U5o	VErp5+HZdn3Yz2G88TZh	IEaNOQ0FdwgajKVrJ/pt	342	\N	2017-04-24 07:56:22.181	{}
2J622zIVp4Duf7zQTVlA	sAxdggjzUR7+K6sSxnyU	u3ZLZ1wSaBUI1ir/s87f	977	\N	2017-04-25 18:43:11.812	{}
B18YDi8yiZsrcE2frUBo	rc+ccdAK8F4ROpIC299B	eSP4HEKPd6KnUKdXNgi+	251	\N	2017-04-24 10:58:18.094	{}
b3DPyfU4KHYoe+a/Kawe	0/Dg4ohpw1BIoLvDgRkh	YGwamAmejWkGT2LbhCTz	11	\N	2017-04-25 05:37:40.228	{}
Bxh5QzhCa9xQ7XKTwU2E	rc+ccdAK8F4ROpIC299B	zaG+gDxF5/Dqy1LKpOsH	126	\N	2017-04-25 00:22:52.78	{}
GZPSI+qHMm2gO4T7AHUf	nbFMJA7w8Ms8VOsgI8Uj	SvQDWNt+MRtoWPp/U7W9	112	\N	2017-04-25 15:04:41.988	{}
YLfMPf3tJc4nLdkz0wfX	y90eN2IFt6lwJmUaK9TF	A9NvltJJdnsQMPuPbtT5	433	\N	2017-04-25 10:56:54.866	{}
QrkbOzE0t1UpvQLjRH86	kMjFmLjttJpQS3rzutBf	i2RB16CZOdxMbDrWP8JC	62	\N	2017-04-25 09:34:54.695	{}
0uHtncVjEw913UuVaA7D	TMTdMrgBYgxYoTLKWv35	RGadtVwgyqPcFpcIj6IX	961	\N	2017-04-24 15:57:53.281	{}
0v5LIMuXt8Kg5C1niqpT	ljr+mdhFYpVziaRs0plq	FsHA/yYzkyrvxjDL7jmx	428	\N	2017-04-26 14:08:20.357	{}
By8aFUynwEV0QiXV7ry9	ljr+mdhFYpVziaRs0plq	9iLudLiowiDb3PU6lfMN	667	\N	2017-04-24 20:32:27.299	{}
Mv0fnug11gVestI0lnkI	VErp5+HZdn3Yz2G88TZh	r8nUQ7i1nq4g5JCxBAV7	62	\N	2017-04-26 09:26:06.061	{}
Wq03R4y/G5iM7PJzuUVW	/cFEfNMpFxRDc1+1PpSb	KhReTUGJJqO8kWa5kgIs	272	\N	2017-04-25 23:12:59.863	{}
sIZQ0em4Ej21hn5iXIBr	TMTdMrgBYgxYoTLKWv35	tkYXKYurS41iKLPnU7i7	60	\N	2017-04-26 01:54:22.175	{}
HUHLiv07UIDyliZjJHLQ	kMjFmLjttJpQS3rzutBf	B3S8oAKMAM59czAQM9Qq	833	\N	2017-04-26 15:29:32.868	{}
tISq781VUkW2bBHFI4wi	/cFEfNMpFxRDc1+1PpSb	ZP1GPC+i2CXZVnl9GYb7	794	\N	2017-04-25 07:56:09.983	{}
42uNVpdRkAxxEms6lLh+	y90eN2IFt6lwJmUaK9TF	mLV7ekJBzLyXyCmnU2g9	97	\N	2017-04-26 08:24:55.2	{}
E0n4B/1+u53pEzdqaxy1	YPGpbTqv9aeZHXxBNgIC	g53TbiDOJdJAkfVV7Dq3	719	\N	2017-04-24 08:47:25.846	{}
lYHuj/WWK+3D8jcUOZ0P	YPGpbTqv9aeZHXxBNgIC	ungxFy6KF+BduXSw6aNb	424	\N	2017-04-25 08:15:56.544	{}
uBIVh2G2keoyr9iNCb+2	kMjFmLjttJpQS3rzutBf	H3dO1NtpTiVl0L67Aagh	400	\N	2017-04-26 21:06:03.418	{}
9M0e72YdxuxS/CcGa3pZ	kMjFmLjttJpQS3rzutBf	tuwIwDTcWMij5Lsn+dF2	62	\N	2017-04-24 14:01:19.516	{}
dtJY6H6cs/2Yjo1/eIQU	0/Dg4ohpw1BIoLvDgRkh	wVBTv2oT9Zu8IUiNcu7t	914	\N	2017-04-25 01:57:28.556	{}
GYsdkdOgETKQRcvyogOw	/cFEfNMpFxRDc1+1PpSb	ZAW151HGQCKKqimRLisC	571	\N	2017-04-25 11:48:09.047	{}
GNTogNbb7UrbhdOHeWwl	kMjFmLjttJpQS3rzutBf	dfhRtMV0IfVIflXJA74X	529	\N	2017-04-26 19:21:25.591	{}
aG2t3HVCwHi8zymfl0gQ	kMjFmLjttJpQS3rzutBf	KJNoh/ej84YWQnnLAjFM	223	\N	2017-04-24 09:50:58.879	{}
xA6O7DZxW+gzQb9lBdLa	Hjjd3Ns0lvG3cs9jj4N7	J1rgIY5aLoqOR48jl7YH	199	\N	2017-04-24 14:48:14.011	{}
H/66ndqCuUYrSnD6dLw2	TMTdMrgBYgxYoTLKWv35	QA++Kdn184yTKqKfTwR9	539	\N	2017-04-24 02:24:37.831	{}
JqVR6LfYiexHsWJKbaZW	0/Dg4ohpw1BIoLvDgRkh	Dr9TrSfvVOPKA9Ox26vE	649	\N	2017-04-25 02:57:01.52	{}
yRKbDnEu45WsIVseZT/n	sAxdggjzUR7+K6sSxnyU	VRB60g1OHcTkrbbpfMXb	602	\N	2017-04-26 14:09:41.288	{}
CLgfuLRviiXXcLcqs14m	VErp5+HZdn3Yz2G88TZh	qObZJrbC7EQyCGBsAfSy	952	\N	2017-04-24 14:49:19.998	{}
XkFSxAhtCijLJZ09YUiB	CBp22Vfd78M4NgkRafEo	wk+dIhfirC+e4V3Hsi/F	780	\N	2017-04-26 06:20:29.8	{}
g6H1P9uygZnlQwD2qYrM	rc+ccdAK8F4ROpIC299B	zXEeqbW5cEtrjIaq6+p/	984	\N	2017-04-25 10:18:24.587	{}
Ftvl3NDMqDeiw6s/RoX5	rc+ccdAK8F4ROpIC299B	2/+Fxmhv+s/k+H4mHUms	416	\N	2017-04-24 13:47:27.312	{}
ACMZkkP+aBuAPhxyZ+87	kMjFmLjttJpQS3rzutBf	3hEaa4dPEkZwl84fWsPS	519	\N	2017-04-25 06:04:57.555	{}
Q5+n1D+1pl8Ynj0OQjbI	0/Dg4ohpw1BIoLvDgRkh	veA3G9e1Dje1x8Tqvu16	62	\N	2017-04-25 16:21:31.138	{}
cSHiw8064nGhCpEZ8zgf	Mooca+XNOJQaJb6IILB6	xqEIFcKtrs79V1GvCfjM	327	\N	2017-04-25 15:07:51.688	{}
wXfOlnP6BhdlRY6HCF07	kMjFmLjttJpQS3rzutBf	0aYRcG/M0/X/yYGNJAtm	916	\N	2017-04-25 07:38:35.293	{}
oHF2MKHHun5+Js/s1cAg	CBp22Vfd78M4NgkRafEo	42jQoic5jPtKkVz/FDjO	812	\N	2017-04-26 12:39:37.925	{}
vXbSr5qrDoeTc+WnCenI	Mooca+XNOJQaJb6IILB6	fYxNI4s84hUfwgceNye9	473	\N	2017-04-25 06:31:07.425	{}
CQncjL8kIUS7jUofa/Cn	Hjjd3Ns0lvG3cs9jj4N7	z95tJp4X5L9vBJKb0lWY	970	\N	2017-04-26 23:38:03.277	{}
LhJgVwT7TVYCD/hI7YWD	sAxdggjzUR7+K6sSxnyU	TplX8W/+vRMKUBR5PRC4	681	\N	2017-04-25 22:45:44.088	{}
HbV24DsEaJVj5uOg6Esb	sAxdggjzUR7+K6sSxnyU	xQbnGD+4He+bN9YhT1j7	389	\N	2017-04-24 16:14:04.401	{}
JAtGSHX4zyEtdqeNfPaz	+2fxb2EecC80U2DcxPMF	U6e6GfiWUUgXR2x1KG69	427	\N	2017-04-24 20:12:02.206	{}
Cgl4MYSK3zKLiX0cJBw5	kMjFmLjttJpQS3rzutBf	TgqEedOJM3+osCXDJmk7	621	\N	2017-04-25 09:16:55.481	{}
dZehBvkFgzzCce9bRBVo	nbFMJA7w8Ms8VOsgI8Uj	/wcVJZDDfXqd/P0mRVM6	761	\N	2017-04-26 07:26:55.43	{}
QGefePdBkIFQnb4K9N76	Mooca+XNOJQaJb6IILB6	MXHnuThLBxyMqf2x9RYX	760	\N	2017-04-26 04:39:07.763	{}
MAdqwgAoFdDQNZXKIqVx	VErp5+HZdn3Yz2G88TZh	5AtIOTMpR2HWS/urXzzl	296	\N	2017-04-26 09:12:52.255	{}
HbELcGUrwpTyyAVgZe3G	nbFMJA7w8Ms8VOsgI8Uj	I1BqKwsQft8m3T75pDo6	906	\N	2017-04-24 08:36:20.392	{}
F1DHRj5EY+5cc7bj5plN	3KOaA2+6IjmFPfm4ChIJ	7/xzrSWg0Cs1TUuQk6eT	367	\N	2017-04-24 14:27:31.141	{}
18KwmgiNtSyueaCMg7k6	budgvhf/oqc9FWtiR59c	09n6j6bCEnQcNZWCXXw3	297	\N	2017-04-26 03:34:44.763	{}
ijdwndMHhnVh7784Sizu	SBdioRVUMTzSJjoTQ8iG	5M0LYrIdTR+8ShtcGCCq	952	\N	2017-04-24 05:43:48.451	{}
3Dk54ZQF/w5L5sAiOWXq	nbFMJA7w8Ms8VOsgI8Uj	r49mnatyGyT1FMKiWajG	880	\N	2017-04-24 01:01:53.694	{}
MtnayRGl5G77OlpVFdSi	CBp22Vfd78M4NgkRafEo	ZeUgcf1m5S8cal6hpxHD	949	\N	2017-04-26 23:38:30.243	{}
/gZ1KyT7NhKVlzpTwWuC	YPGpbTqv9aeZHXxBNgIC	BBuNp8/PWPaNiWTxKcVf	960	\N	2017-04-25 02:27:01.208	{}
eXQq9hxnFpK05Atl+47I	SBdioRVUMTzSJjoTQ8iG	H8qyN0kXxpRXJ8A8aXec	736	\N	2017-04-24 11:04:42.651	{}
Kbmd4uxwaA7ZLcOp9OeN	ljr+mdhFYpVziaRs0plq	aQJTOyQtMaQ7mGwL4VtH	439	\N	2017-04-25 22:36:59.66	{}
dr5SzWAyZiWRNyQfjfxT	SBdioRVUMTzSJjoTQ8iG	Q1Gj1Hi1QW9kUnL1LDjm	819	\N	2017-04-25 22:36:30.611	{}
hTePoGbfKvhjlusQztdp	SBdioRVUMTzSJjoTQ8iG	JiZ2D82AFB4JE3RV8V2r	365	\N	2017-04-26 14:14:50.964	{}
36bN33YRXfCZvum9Ag0l	3KOaA2+6IjmFPfm4ChIJ	2+UmcV9zVHRLeLIOJUax	329	\N	2017-04-24 09:16:17.361	{}
Ogq1npLtNTJNxNRY0do9	nbFMJA7w8Ms8VOsgI8Uj	r49mnatyGyT1FMKiWajG	177	\N	2017-04-25 07:26:59.677	{}
2GnS1tmdDlp1yDfLw0go	VErp5+HZdn3Yz2G88TZh	rxTyOSplpcn8dnjo/adk	225	\N	2017-04-24 11:19:18.114	{}
iuQg+aR3J8mH+siYAAkt	rc+ccdAK8F4ROpIC299B	H8qyN0kXxpRXJ8A8aXec	343	\N	2017-04-24 12:46:30.705	{}
Ny6g4r8Qwy5kvFEISqrw	Mooca+XNOJQaJb6IILB6	0YD41fg1u2CfSRn7oJZF	481	\N	2017-04-24 01:07:10.049	{}
2fyqJi6qkRMuKW9FZ2Km	VErp5+HZdn3Yz2G88TZh	JiZ2D82AFB4JE3RV8V2r	729	\N	2017-04-24 03:53:04.246	{}
WN9tI2kcq1q0lTrAOlSk	ZNerBKfcGYvzcUKaYlqg	+kexVvlwST2wwazO3f3H	846	\N	2017-04-25 09:50:49.851	{}
sHHZYK4nwkNYrq8P5cN/	YPGpbTqv9aeZHXxBNgIC	q8JJVBkcn8bBVYAwYK8H	2	\N	2017-04-25 18:15:49.66	{}
Kysa2WbUXyNT7o5KMCT/	Hjjd3Ns0lvG3cs9jj4N7	wanLuELmYXk0dlqpCrnm	43	\N	2017-04-25 05:02:45.283	{}
Os3oABqDlUIEljeGNOy8	0/Dg4ohpw1BIoLvDgRkh	QUPUDc49dYTZAuSefHhv	291	\N	2017-04-24 16:09:10.51	{}
p/P4IxhyzdjrWDFdRw31	Mooca+XNOJQaJb6IILB6	i4KuehPwIdOPVlnK62/m	499	\N	2017-04-25 22:44:58.355	{}
Jkur25+ufreKAoqmvZ4D	nbFMJA7w8Ms8VOsgI8Uj	jOHv9qh1s9hj6+kuLmVa	363	\N	2017-04-24 16:08:21.032	{}
iqdmXMsAN7lnuUc/kdv3	budgvhf/oqc9FWtiR59c	5Kv9b9sp0ewEEA2Jotp9	743	\N	2017-04-25 16:07:41.884	{}
yMSWTG5vYT/cz1EoxB5i	TMTdMrgBYgxYoTLKWv35	1UufxAWZsxWW3HyFyMO3	70	\N	2017-04-25 15:07:50.981	{}
OK7r3hahE7sb7XUYEbiV	VErp5+HZdn3Yz2G88TZh	h2C9W42cJMJ73ezGdKnt	78	\N	2017-04-25 07:21:32.278	{}
OP4o59V372C6WacsovEU	CBp22Vfd78M4NgkRafEo	DnklZhCuAnke9aOB1iUI	84	\N	2017-04-24 09:35:26.157	{}
P0V8/8x56njx3ZPDFRjN	kMjFmLjttJpQS3rzutBf	2AEKfg3ssjqyP2C+KQNv	170	\N	2017-04-25 20:49:48.858	{}
IYuCg5+QXLzLcjJfvFaA	/cFEfNMpFxRDc1+1PpSb	yF+NPQPKuAL5GvZwGoSP	305	\N	2017-04-25 01:04:51.819	{}
xIF2T++ryRsw+W9F6+Lp	/cFEfNMpFxRDc1+1PpSb	yAhAJboIEIBjSo5syKRF	804	\N	2017-04-26 11:48:51.792	{}
F5+PGJYRAGFi4E9tk52b	VErp5+HZdn3Yz2G88TZh	W0Teu68RKPemEd7RKqwK	57	\N	2017-04-26 22:33:53.114	{}
H9KC4f8u5U5dgvfkm5QD	+2fxb2EecC80U2DcxPMF	xWV0D5DONK4qj8UDHoSI	900	\N	2017-04-24 21:23:07.149	{}
IvfbyWnUqvWsxBRPUifZ	ZNerBKfcGYvzcUKaYlqg	aTbM4pk52ewkV1/qc5gK	442	\N	2017-04-25 19:21:24.131	{}
V47zfWdVqdPjOckBhWif	kMjFmLjttJpQS3rzutBf	qRA/DRvi/QFyHNDj1Nrb	634	\N	2017-04-26 03:25:48.623	{}
UdQOCV11nj2RIIxBODhn	VErp5+HZdn3Yz2G88TZh	VzZiHeFCGvYUJ7df+fbx	800	\N	2017-04-26 07:24:12.306	{}
y2M89K7Hdf3mn1/zChQk	TMTdMrgBYgxYoTLKWv35	RjdqlasVWKM8vUS0X2Zs	584	\N	2017-04-25 21:40:42.098	{}
4V0yvZN54bC2iNvQFFMp	TMTdMrgBYgxYoTLKWv35	IhfEeC2JKYv3JWjUicxq	791	\N	2017-04-25 11:59:03.92	{}
yvCaZw1MdHf7huBrSZ7S	0/Dg4ohpw1BIoLvDgRkh	AT6koPGycncpKqZbF3zU	175	\N	2017-04-25 12:59:46.805	{}
eCRDjMGAUzGDKA7BmfpI	/cFEfNMpFxRDc1+1PpSb	rxTyOSplpcn8dnjo/adk	447	\N	2017-04-25 23:27:07.257	{}
U0uxvOm8UJnEnGg8BBZq	/cFEfNMpFxRDc1+1PpSb	H8qyN0kXxpRXJ8A8aXec	684	\N	2017-04-25 09:35:06.328	{}
3DGgOFAT2yRyFQPbk5QF	VErp5+HZdn3Yz2G88TZh	0YD41fg1u2CfSRn7oJZF	939	\N	2017-04-26 02:47:25.195	{}
RxDBuSS/1nEXM6e1P1gB	ljr+mdhFYpVziaRs0plq	5Wb3bXW64k/0e7f57XdL	595	\N	2017-04-24 03:15:20.817	{}
m9549uqaYrHKaLVfTrTy	+2fxb2EecC80U2DcxPMF	2+UmcV9zVHRLeLIOJUax	898	\N	2017-04-25 19:50:02.622	{}
w+SbvS8doYAtCizEiVJJ	rc+ccdAK8F4ROpIC299B	SV5CDRbHSDGYqHBoS/68	950	\N	2017-04-24 10:36:18.332	{}
b6McgMJCAPjg/A7L1x8d	nbFMJA7w8Ms8VOsgI8Uj	5rijO1bcavruwQBEQBf4	161	\N	2017-04-25 04:09:40.895	{}
7y3isOwvS28JradlRbX7	VErp5+HZdn3Yz2G88TZh	QUPUDc49dYTZAuSefHhv	538	\N	2017-04-25 01:21:55.017	{}
OwjKvnbFO6G+5GzKPrPA	sAxdggjzUR7+K6sSxnyU	i4KuehPwIdOPVlnK62/m	606	\N	2017-04-26 09:28:15.741	{}
g4iK9X3hOgEx25hH9XQn	rc+ccdAK8F4ROpIC299B	0byLUPVD4/5FnD9pDgpn	389	\N	2017-04-26 02:56:05.35	{}
GcujcKmVZvmdPXAshCx2	3KOaA2+6IjmFPfm4ChIJ	5Kv9b9sp0ewEEA2Jotp9	49	\N	2017-04-24 14:16:05.699	{}
z41NHYjA3vD3W9VZS60+	3KOaA2+6IjmFPfm4ChIJ	1UufxAWZsxWW3HyFyMO3	617	\N	2017-04-26 07:18:41.608	{}
Jra3OJUgbKEy/mISAMkB	ZNerBKfcGYvzcUKaYlqg	h2C9W42cJMJ73ezGdKnt	683	\N	2017-04-25 11:15:55.523	{}
drX10EfWpkay/NEu/1bX	Mooca+XNOJQaJb6IILB6	DnklZhCuAnke9aOB1iUI	170	\N	2017-04-24 16:40:02.396	{}
YRCbxMF+YTNi+UCcxbQq	kMjFmLjttJpQS3rzutBf	sge5E1P9u7v28OFLSozh	381	\N	2017-04-25 22:33:04.717	{}
WjqlXOLr2S0UVdAGCyOC	/cFEfNMpFxRDc1+1PpSb	yF+NPQPKuAL5GvZwGoSP	840	\N	2017-04-26 13:21:28.616	{}
cNvO5qkcO0aSFBx5BHb2	3KOaA2+6IjmFPfm4ChIJ	yAhAJboIEIBjSo5syKRF	967	\N	2017-04-25 20:54:08.993	{}
m2CIb3vJw2HOtvLSUONE	Hjjd3Ns0lvG3cs9jj4N7	CqGjJBwbWkjE5oMYKrLy	831	\N	2017-04-26 12:01:55.367	{}
frHBGMExVfQm7h2bflpL	rc+ccdAK8F4ROpIC299B	BUhTnaIig/xdOm8Ttc0i	483	\N	2017-04-25 08:49:50.992	{}
ibSSdjVETov0sY5/hCJh	/cFEfNMpFxRDc1+1PpSb	SQwDrLyMC1Ne0P5tJ6h+	223	\N	2017-04-24 03:39:58.583	{}
ahnSP3aNesA8eu2fE5qR	/cFEfNMpFxRDc1+1PpSb	S1pcWcVe117zsHh1815B	352	\N	2017-04-25 11:10:32.118	{}
2G4akPD6oQITqGN2tJ8Y	ZNerBKfcGYvzcUKaYlqg	crAyoDt3d4KdsZJMv2lG	585	\N	2017-04-24 08:12:37.259	{}
i67XN37IMevo0lM3h/bX	nbFMJA7w8Ms8VOsgI8Uj	AT6koPGycncpKqZbF3zU	27	\N	2017-04-24 22:42:40.425	{}
Z3pFya8TzzGe6Dge8d6K	ZNerBKfcGYvzcUKaYlqg	FYFM8oSY4mozNGths+uK	149	\N	2017-04-25 05:36:05.392	{}
Tb95+HbofrmyHdXkLLtb	TMTdMrgBYgxYoTLKWv35	BBuNp8/PWPaNiWTxKcVf	801	\N	2017-04-24 11:13:12.718	{}
S8SG8EEN/ozSamiMSH+p	XklfmXtmNz7WRzaFwJPY	H8qyN0kXxpRXJ8A8aXec	863	\N	2017-04-25 20:29:16.152	{}
mjEpoe76b6YC0fXeVF7H	rc+ccdAK8F4ROpIC299B	Q1Gj1Hi1QW9kUnL1LDjm	582	\N	2017-04-25 10:42:11.933	{}
zPXCjJgVZitg87Y/tYxr	XklfmXtmNz7WRzaFwJPY	JiZ2D82AFB4JE3RV8V2r	565	\N	2017-04-25 06:25:34.45	{}
wxuf24/jKXhQucL0YL0D	nbFMJA7w8Ms8VOsgI8Uj	+kexVvlwST2wwazO3f3H	918	\N	2017-04-26 01:27:46.671	{}
ScLYQyaSFU3JDoPAUGc4	YPGpbTqv9aeZHXxBNgIC	2+UmcV9zVHRLeLIOJUax	919	\N	2017-04-26 01:23:43.478	{}
EwhuUOh9tXXKRXXooS/l	ZNerBKfcGYvzcUKaYlqg	V93rLTKY6/1L/wxxOsQW	750	\N	2017-04-24 01:30:24.072	{}
ybctBVHA3JnHlm28jgHl	XklfmXtmNz7WRzaFwJPY	qMFZsSGuDNq3oy3gCZL5	273	\N	2017-04-24 00:08:21.129	{}
1cVsqCVHVr2NdJIzpVxz	TMTdMrgBYgxYoTLKWv35	Y4xmjMJ50lULd1rhMM1m	871	\N	2017-04-24 13:24:55.379	{}
m5JXI25hovbFa8q1BPif	YPGpbTqv9aeZHXxBNgIC	S6pi7OB5BtVRAL3ZHWkP	433	\N	2017-04-26 08:53:49.433	{}
LxzLiX5pYomOatIsZ2E6	0/Dg4ohpw1BIoLvDgRkh	0byLUPVD4/5FnD9pDgpn	724	\N	2017-04-25 04:18:49.297	{}
d5eTxc7A9tkMCy0vBjkz	rc+ccdAK8F4ROpIC299B	LZF8bDICD49czTO3Gxf6	148	\N	2017-04-24 00:36:39.081	{}
lO+4UpywKjS9Rs5HsXiZ	kMjFmLjttJpQS3rzutBf	1UufxAWZsxWW3HyFyMO3	955	\N	2017-04-25 20:07:59.098	{}
1jDdQZYgEk8j8OsrWo6+	0/Dg4ohpw1BIoLvDgRkh	FIPgIz6+PVM3ICFEO8kO	913	\N	2017-04-25 20:44:36.821	{}
7YA325B8dqEe6aOlEeJF	Mooca+XNOJQaJb6IILB6	ikQRmU/RpuZLermu3Kr4	722	\N	2017-04-25 03:09:04.604	{}
ndz11dDDmiodLr838Fcn	TMTdMrgBYgxYoTLKWv35	n7phjrCsh4CyJbGgKSCX	366	\N	2017-04-24 03:17:56.7	{}
PWoHN/H40WADV1wGib9j	sAxdggjzUR7+K6sSxnyU	l9xDU17zyEL88PXfb0Fe	310	\N	2017-04-24 11:01:52.698	{}
/FsXbaza/m9wflAVw2+E	y90eN2IFt6lwJmUaK9TF	W0Teu68RKPemEd7RKqwK	425	\N	2017-04-25 01:43:56.616	{}
syzHXk1TPBjY5XwCec9W	CBp22Vfd78M4NgkRafEo	udwb9uTzL6YtMXS/NpAa	890	\N	2017-04-26 18:11:08.549	{}
KdeChjAY/7GEDo+dmVgu	y90eN2IFt6lwJmUaK9TF	BUhTnaIig/xdOm8Ttc0i	954	\N	2017-04-25 02:51:28.876	{}
QlJTLqwjhP+qh2rg8uFZ	budgvhf/oqc9FWtiR59c	khTzxLcoSrgIAqFnJUMx	820	\N	2017-04-24 15:38:39.328	{}
7kLxfgppSteCcnfscbkV	sAxdggjzUR7+K6sSxnyU	VzZiHeFCGvYUJ7df+fbx	320	\N	2017-04-26 22:15:29.962	{}
AD3ZAVao9HJF6iYZvxEf	Mooca+XNOJQaJb6IILB6	RjdqlasVWKM8vUS0X2Zs	298	\N	2017-04-25 13:59:46.049	{}
HI7+ftJKEZUUS+FXZPRh	budgvhf/oqc9FWtiR59c	IhfEeC2JKYv3JWjUicxq	693	\N	2017-04-26 06:49:52.741	{}
ydEg1HhAupwkWkRn/hbo	ZNerBKfcGYvzcUKaYlqg	AT6koPGycncpKqZbF3zU	65	\N	2017-04-24 01:05:33.78	{}
O+Wm1tLwjFMEPDbEtbPy	rc+ccdAK8F4ROpIC299B	FYFM8oSY4mozNGths+uK	643	\N	2017-04-26 08:16:34.312	{}
lwd9HURmG8BPwENt9yCf	rc+ccdAK8F4ROpIC299B	BBuNp8/PWPaNiWTxKcVf	199	\N	2017-04-26 22:58:59.958	{}
QFFTv6kBmPULZnUKZhbp	budgvhf/oqc9FWtiR59c	aQJTOyQtMaQ7mGwL4VtH	207	\N	2017-04-26 06:39:58.87	{}
QhVeeaIDEPOziCFAFQ2r	rc+ccdAK8F4ROpIC299B	Q1Gj1Hi1QW9kUnL1LDjm	117	\N	2017-04-24 04:59:47.493	{}
BgjkR+09I6Xe48GxYVp7	sAxdggjzUR7+K6sSxnyU	JiZ2D82AFB4JE3RV8V2r	348	\N	2017-04-24 08:48:59.205	{}
IW+OB9RPpBPdulkmM0Y3	VErp5+HZdn3Yz2G88TZh	2+UmcV9zVHRLeLIOJUax	821	\N	2017-04-25 21:50:58.334	{}
oNziVebdx6gHVzs+mYbz	SBdioRVUMTzSJjoTQ8iG	V93rLTKY6/1L/wxxOsQW	238	\N	2017-04-24 23:27:03.465	{}
MOAlQ/MV/H0mgBkKZD8W	rc+ccdAK8F4ROpIC299B	qMFZsSGuDNq3oy3gCZL5	163	\N	2017-04-25 21:43:14.697	{}
90GNNQwUyWuwr2fl/mKy	Mooca+XNOJQaJb6IILB6	QUPUDc49dYTZAuSefHhv	557	\N	2017-04-24 04:18:13.599	{}
29g5wD7QAOv87TUZZb+a	3KOaA2+6IjmFPfm4ChIJ	S6pi7OB5BtVRAL3ZHWkP	886	\N	2017-04-25 11:00:31.727	{}
NzZOxTW+Yrb64eyT/w6D	SBdioRVUMTzSJjoTQ8iG	0byLUPVD4/5FnD9pDgpn	451	\N	2017-04-26 23:32:05.069	{}
UG5UgV0yWNkU9NmJ6FIO	ZNerBKfcGYvzcUKaYlqg	78BpQ96O/0R7pCLmRz4Z	433	\N	2017-04-24 06:16:52.344	{}
oT7UKVlNQjB9XUEx/Q9J	/cFEfNMpFxRDc1+1PpSb	MbMkW3m+nWueo9b35S4V	611	\N	2017-04-24 00:43:22.425	{}
h0HyEKbMGNJmGvxSXQXa	TMTdMrgBYgxYoTLKWv35	h2C9W42cJMJ73ezGdKnt	984	\N	2017-04-26 10:24:12.977	{}
jzAuKJYtJOZMC6cbwLNK	y90eN2IFt6lwJmUaK9TF	DnklZhCuAnke9aOB1iUI	390	\N	2017-04-26 12:03:07.114	{}
k9d3HO9BsU7rovdf3Rjw	+2fxb2EecC80U2DcxPMF	n7phjrCsh4CyJbGgKSCX	847	\N	2017-04-24 21:02:28.153	{}
A6OLRYP9i5iy+Z9+VCl/	3KOaA2+6IjmFPfm4ChIJ	l9xDU17zyEL88PXfb0Fe	266	\N	2017-04-26 02:30:02.8	{}
cJPX+sh1T1Y/E8ZtYCyT	kMjFmLjttJpQS3rzutBf	HxTHbWpz0MehysCOZaIG	508	\N	2017-04-24 08:03:59.072	{}
nefv5KsI1ig01I9FMIWp	+2fxb2EecC80U2DcxPMF	xWV0D5DONK4qj8UDHoSI	781	\N	2017-04-25 21:45:25.591	{}
n39953MMCR4OmbnBS8iF	Mooca+XNOJQaJb6IILB6	khTzxLcoSrgIAqFnJUMx	125	\N	2017-04-25 19:56:28.324	{}
zzEcF6RXoOfbdMLFVkBN	rc+ccdAK8F4ROpIC299B	qRA/DRvi/QFyHNDj1Nrb	538	\N	2017-04-24 09:52:02.001	{}
9W5pPgbs89cbF8+6ToMd	rc+ccdAK8F4ROpIC299B	S1pcWcVe117zsHh1815B	311	\N	2017-04-25 07:52:48.282	{}
jFFNXPAq+wFJmbMJxHYT	ZNerBKfcGYvzcUKaYlqg	crAyoDt3d4KdsZJMv2lG	860	\N	2017-04-25 16:10:29.138	{}
AGGRWuJGnTvhOObQAj0F	+2fxb2EecC80U2DcxPMF	aydaNJLMKvW4daL5Q0aW	876	\N	2017-04-25 09:43:52.112	{}
kA+A2tKHNaixApZxPpJ1	ZNerBKfcGYvzcUKaYlqg	FYFM8oSY4mozNGths+uK	59	\N	2017-04-25 18:45:23.226	{}
R2mZ3M+XFZ971JfHh4bl	CBp22Vfd78M4NgkRafEo	aQJTOyQtMaQ7mGwL4VtH	293	\N	2017-04-24 09:59:11.285	{}
EOpzZWxfLLFcomkRJD3H	y90eN2IFt6lwJmUaK9TF	5Wb3bXW64k/0e7f57XdL	32	\N	2017-04-25 18:43:08.322	{}
QLFdel8khMNjueE5Jc8H	YPGpbTqv9aeZHXxBNgIC	/aEGoMsAJBEZd1eAC49Q	669	\N	2017-04-26 05:28:25.919	{}
KWifaIt4MkRt1CZUl8rI	rc+ccdAK8F4ROpIC299B	SV5CDRbHSDGYqHBoS/68	105	\N	2017-04-24 18:11:17.97	{}
X//SiOsCtLE1GwKi1fl9	y90eN2IFt6lwJmUaK9TF	wanLuELmYXk0dlqpCrnm	673	\N	2017-04-24 17:17:08.741	{}
GG6vPp9gRmI5a5b/knfn	3KOaA2+6IjmFPfm4ChIJ	QUPUDc49dYTZAuSefHhv	809	\N	2017-04-24 20:10:23.157	{}
TL6syJjShG/hL1cn9jBI	Hjjd3Ns0lvG3cs9jj4N7	S6pi7OB5BtVRAL3ZHWkP	54	\N	2017-04-24 12:23:54.869	{}
nK0nNNY7bJkYZwEqEa8j	nbFMJA7w8Ms8VOsgI8Uj	78BpQ96O/0R7pCLmRz4Z	178	\N	2017-04-24 22:34:47.047	{}
uPcz6XfSXnkC4irVBn+7	/cFEfNMpFxRDc1+1PpSb	MbMkW3m+nWueo9b35S4V	233	\N	2017-04-26 11:57:23.84	{}
xQbhjG6ehoYZl4X4oqZg	sAxdggjzUR7+K6sSxnyU	1UufxAWZsxWW3HyFyMO3	648	\N	2017-04-25 09:53:07.454	{}
fdeOJGuI7GqOJSrvJzND	XklfmXtmNz7WRzaFwJPY	H9Q2R8p6dXw4oaM4IInr	536	\N	2017-04-25 15:54:29.535	{}
faCPoT5Dq0DQGq/SWMx1	nbFMJA7w8Ms8VOsgI8Uj	2AEKfg3ssjqyP2C+KQNv	74	\N	2017-04-24 12:34:46.266	{}
ngphxrgm8NH/rV8qsWU5	ZNerBKfcGYvzcUKaYlqg	yF+NPQPKuAL5GvZwGoSP	429	\N	2017-04-26 18:25:59.786	{}
Rmx+IuEa9mskOzL8/Xi+	SBdioRVUMTzSJjoTQ8iG	l9xDU17zyEL88PXfb0Fe	664	\N	2017-04-25 06:01:10.158	{}
0F0ihcNe6DOo0vWUBhxB	sAxdggjzUR7+K6sSxnyU	HxTHbWpz0MehysCOZaIG	393	\N	2017-04-26 04:35:18.357	{}
+XkoCGEtx6Y3eXLPOLxD	+2fxb2EecC80U2DcxPMF	xWV0D5DONK4qj8UDHoSI	469	\N	2017-04-24 21:19:04.808	{}
y+wdS+MGjmYR6FZj4X0V	YPGpbTqv9aeZHXxBNgIC	FcKQiYsCLVt0izrAdZ+d	798	\N	2017-04-24 20:39:14.207	{}
wluc9z8vb/2SrUaRRwlH	ZNerBKfcGYvzcUKaYlqg	SQwDrLyMC1Ne0P5tJ6h+	682	\N	2017-04-25 20:37:25.415	{}
vfiNcjWh3HCnAdD1yOpB	0/Dg4ohpw1BIoLvDgRkh	VzZiHeFCGvYUJ7df+fbx	191	\N	2017-04-24 08:34:53.152	{}
B6wULGEIGNyBqH7+JCk4	TMTdMrgBYgxYoTLKWv35	RjdqlasVWKM8vUS0X2Zs	270	\N	2017-04-25 11:13:41.855	{}
IgRYfpHgESQwOm3W54Nq	kMjFmLjttJpQS3rzutBf	IhfEeC2JKYv3JWjUicxq	553	\N	2017-04-25 05:18:01.56	{}
/4LTAWtFSDbyCYxRmp4w	SBdioRVUMTzSJjoTQ8iG	AT6koPGycncpKqZbF3zU	143	\N	2017-04-24 19:20:03.104	{}
Mz09C8YBlrqkb3c6Y+vG	nbFMJA7w8Ms8VOsgI8Uj	FYFM8oSY4mozNGths+uK	117	\N	2017-04-25 03:19:48.674	{}
HFjcrEHaeLJaMQKlC6Rf	sAxdggjzUR7+K6sSxnyU	0YD41fg1u2CfSRn7oJZF	978	\N	2017-04-25 03:14:17.808	{}
A76iMBmKUTPQysFjrpO/	ljr+mdhFYpVziaRs0plq	5Wb3bXW64k/0e7f57XdL	964	\N	2017-04-24 06:41:15.954	{}
A2J99yxtCFM1cFEmfBQK	y90eN2IFt6lwJmUaK9TF	+kexVvlwST2wwazO3f3H	645	\N	2017-04-26 12:55:49.315	{}
CiIyB6c2Ev4VsFfPuMCg	sAxdggjzUR7+K6sSxnyU	q8JJVBkcn8bBVYAwYK8H	234	\N	2017-04-25 13:57:40.034	{}
BBlEvHbtYAjWpE9Fa0FK	CBp22Vfd78M4NgkRafEo	qMFZsSGuDNq3oy3gCZL5	133	\N	2017-04-25 16:47:08.019	{}
zdD0gbHpk1CqeKK4DOyi	ZNerBKfcGYvzcUKaYlqg	Y4xmjMJ50lULd1rhMM1m	978	\N	2017-04-26 21:00:40.864	{}
a7fkCIgBHaVQQ0Y466cX	3KOaA2+6IjmFPfm4ChIJ	S6pi7OB5BtVRAL3ZHWkP	570	\N	2017-04-26 17:32:59.996	{}
e2NBHErS8/QlMhUpprUh	nbFMJA7w8Ms8VOsgI8Uj	0byLUPVD4/5FnD9pDgpn	384	\N	2017-04-24 23:37:52.797	{}
0zORxIPQbQGjxy39LJvT	Hjjd3Ns0lvG3cs9jj4N7	LZF8bDICD49czTO3Gxf6	293	\N	2017-04-24 07:16:37.67	{}
NIUpV+H2JEkjspu3VZpp	y90eN2IFt6lwJmUaK9TF	MbMkW3m+nWueo9b35S4V	538	\N	2017-04-24 20:08:57.485	{}
b1r5JIvPNmcP0nllojvL	YPGpbTqv9aeZHXxBNgIC	FIPgIz6+PVM3ICFEO8kO	930	\N	2017-04-25 15:11:41.32	{}
ScT2iQPMLXCVKvSTtaH+	SBdioRVUMTzSJjoTQ8iG	ikQRmU/RpuZLermu3Kr4	314	\N	2017-04-26 11:18:32.358	{}
2m9shy4L5vkg+/NJNIZk	VErp5+HZdn3Yz2G88TZh	n7phjrCsh4CyJbGgKSCX	554	\N	2017-04-24 16:57:42.487	{}
n8S1NKjf0Hrd3Tcl0Qd5	TMTdMrgBYgxYoTLKWv35	l9xDU17zyEL88PXfb0Fe	251	\N	2017-04-25 08:42:06.049	{}
XqCi/K4f4RAm6zuaeqKd	sAxdggjzUR7+K6sSxnyU	W0Teu68RKPemEd7RKqwK	561	\N	2017-04-25 07:25:17.379	{}
hWPF7M6aG2J0zYJj7OvM	kMjFmLjttJpQS3rzutBf	udwb9uTzL6YtMXS/NpAa	404	\N	2017-04-26 16:04:38.009	{}
tTH6l8ClrnKDPBK/v4sp	ZNerBKfcGYvzcUKaYlqg	BUhTnaIig/xdOm8Ttc0i	418	\N	2017-04-24 23:23:38.076	{}
9iaqGOP1o6M1Zfaz3W3K	/cFEfNMpFxRDc1+1PpSb	SQwDrLyMC1Ne0P5tJ6h+	326	\N	2017-04-25 20:21:32.767	{}
rxskj3lJUTLbSIDNrZpW	Hjjd3Ns0lvG3cs9jj4N7	RjdqlasVWKM8vUS0X2Zs	739	\N	2017-04-24 15:03:32.178	{}
TSGMDEv3miKBSmVYWX+f	/cFEfNMpFxRDc1+1PpSb	crAyoDt3d4KdsZJMv2lG	974	\N	2017-04-26 20:02:12.327	{}
yllelzRILRNEnAnYePyU	y90eN2IFt6lwJmUaK9TF	BCE0eoqwclbd+w5uI2fo	842	\N	2017-04-25 05:03:17.994	{}
tpW/ZcsP0ncIKLuydYqk	Mooca+XNOJQaJb6IILB6	/aEGoMsAJBEZd1eAC49Q	672	\N	2017-04-25 05:24:03.072	{}
MTx2eTpx3tBAMq/z6XTL	budgvhf/oqc9FWtiR59c	SV5CDRbHSDGYqHBoS/68	355	\N	2017-04-25 16:22:46.004	{}
BtQNBEkxkVpy9MKxBv33	+2fxb2EecC80U2DcxPMF	V93rLTKY6/1L/wxxOsQW	874	\N	2017-04-24 01:48:35.121	{}
WHoKhDzb/cbpRZEwLp9g	rc+ccdAK8F4ROpIC299B	qMFZsSGuDNq3oy3gCZL5	199	\N	2017-04-26 18:00:09.82	{}
wIcnGTaIBpJ4z/oUB8lG	ZNerBKfcGYvzcUKaYlqg	Y4xmjMJ50lULd1rhMM1m	935	\N	2017-04-26 19:53:34.058	{}
3HJYcS+doKzg2ynfMUmr	TMTdMrgBYgxYoTLKWv35	S6pi7OB5BtVRAL3ZHWkP	856	\N	2017-04-26 02:24:58.612	{}
mr7+5lITcXy1HkuClblZ	SBdioRVUMTzSJjoTQ8iG	78BpQ96O/0R7pCLmRz4Z	102	\N	2017-04-24 13:51:49.13	{}
k0DjHFgtSVGcDal7dcjD	Hjjd3Ns0lvG3cs9jj4N7	MbMkW3m+nWueo9b35S4V	310	\N	2017-04-26 06:17:52.705	{}
xd4VMtd55HRD2/Adgbev	0/Dg4ohpw1BIoLvDgRkh	h2C9W42cJMJ73ezGdKnt	827	\N	2017-04-25 08:19:42.334	{}
sCn92PaSNKk34mvgANkB	rc+ccdAK8F4ROpIC299B	H9Q2R8p6dXw4oaM4IInr	763	\N	2017-04-24 02:15:58.278	{}
vskFxi+tpEyK2bXyTkiB	XklfmXtmNz7WRzaFwJPY	2AEKfg3ssjqyP2C+KQNv	266	\N	2017-04-26 21:25:59.144	{}
EtLNok/UoVKeX3acRRAF	rc+ccdAK8F4ROpIC299B	yF+NPQPKuAL5GvZwGoSP	764	\N	2017-04-24 00:08:23.905	{}
SaNSQ4tufR3/2X5oMNoo	YPGpbTqv9aeZHXxBNgIC	yAhAJboIEIBjSo5syKRF	555	\N	2017-04-25 00:43:19.78	{}
OKvePzOLim0EO1928lOC	/cFEfNMpFxRDc1+1PpSb	CqGjJBwbWkjE5oMYKrLy	215	\N	2017-04-26 11:47:31.435	{}
dw2F1CVov3zyisOpHBZc	nbFMJA7w8Ms8VOsgI8Uj	BUhTnaIig/xdOm8Ttc0i	863	\N	2017-04-25 12:35:33.536	{}
8RIso1hKd6K/Uvue0p76	TMTdMrgBYgxYoTLKWv35	khTzxLcoSrgIAqFnJUMx	246	\N	2017-04-26 13:59:17.946	{}
cFw5L8XDW9pHw7tb0cwf	Mooca+XNOJQaJb6IILB6	qRA/DRvi/QFyHNDj1Nrb	860	\N	2017-04-25 22:07:32.417	{}
t+Ez3TsoCA1wmBmpQIMM	+2fxb2EecC80U2DcxPMF	VzZiHeFCGvYUJ7df+fbx	492	\N	2017-04-26 21:51:53.125	{}
3bXcAb8rEb2cpK2b4ZBz	y90eN2IFt6lwJmUaK9TF	crAyoDt3d4KdsZJMv2lG	867	\N	2017-04-25 09:32:13.696	{}
AOPHysHS4x8KWm2Nf5F0	ljr+mdhFYpVziaRs0plq	aydaNJLMKvW4daL5Q0aW	358	\N	2017-04-26 23:15:31.88	{}
VkQwxTF2z6FqmTZMfKuV	SBdioRVUMTzSJjoTQ8iG	BCE0eoqwclbd+w5uI2fo	44	\N	2017-04-26 02:31:40.08	{}
UcsDRx5raaCQ0JKUzTNC	kMjFmLjttJpQS3rzutBf	V93rLTKY6/1L/wxxOsQW	450	\N	2017-04-24 05:13:57.885	{}
RHBamBozYqPWL0fAXHNR	sAxdggjzUR7+K6sSxnyU	5rijO1bcavruwQBEQBf4	939	\N	2017-04-24 23:46:23.961	{}
ZRSRyV1sJdHD2gyrqVuP	CBp22Vfd78M4NgkRafEo	GNaBls/CdmguX5G+wFpR	146	\N	2017-04-24 14:02:22.019	{}
PiFRNGrOz0Acf3kLOxlZ	kMjFmLjttJpQS3rzutBf	Y4xmjMJ50lULd1rhMM1m	183	\N	2017-04-26 12:49:53.213	{}
s71ojqvE/yzCLD5cdUnd	y90eN2IFt6lwJmUaK9TF	jOHv9qh1s9hj6+kuLmVa	940	\N	2017-04-24 17:52:45.19	{}
dD05j6bbkpZ0+rIQZDin	Hjjd3Ns0lvG3cs9jj4N7	78BpQ96O/0R7pCLmRz4Z	673	\N	2017-04-25 14:01:34.886	{}
53qxWJqog6tLGXe/zf3X	Mooca+XNOJQaJb6IILB6	MbMkW3m+nWueo9b35S4V	289	\N	2017-04-25 16:05:15.438	{}
MVFNhpY3N/zLYNRAnhX8	SBdioRVUMTzSJjoTQ8iG	H9Q2R8p6dXw4oaM4IInr	640	\N	2017-04-24 00:45:59.635	{}
SOQZWETNqoI5gAYelrFl	/cFEfNMpFxRDc1+1PpSb	ikQRmU/RpuZLermu3Kr4	515	\N	2017-04-26 22:32:27.966	{}
0LwzhgQInqgtX/VtqhpH	CBp22Vfd78M4NgkRafEo	n7phjrCsh4CyJbGgKSCX	612	\N	2017-04-24 07:23:54.746	{}
HZfDxlqBEM7MVbos5p9B	kMjFmLjttJpQS3rzutBf	l9xDU17zyEL88PXfb0Fe	876	\N	2017-04-25 02:57:57.211	{}
SBr4jUAMxwayu85nUf/L	kMjFmLjttJpQS3rzutBf	HxTHbWpz0MehysCOZaIG	317	\N	2017-04-26 06:36:05.553	{}
EZThuK+LhCSPccKDFdvb	nbFMJA7w8Ms8VOsgI8Uj	xWV0D5DONK4qj8UDHoSI	299	\N	2017-04-26 10:04:50.343	{}
jqC8gTBNz3CRN/yuMR/d	Hjjd3Ns0lvG3cs9jj4N7	aTbM4pk52ewkV1/qc5gK	661	\N	2017-04-26 07:40:20.497	{}
zPyRh0LiePfZJK9I/q1L	/cFEfNMpFxRDc1+1PpSb	qRA/DRvi/QFyHNDj1Nrb	352	\N	2017-04-26 16:04:53.591	{}
ErJoYWgBPwEso5ytAw07	nbFMJA7w8Ms8VOsgI8Uj	S1pcWcVe117zsHh1815B	494	\N	2017-04-25 14:58:54.778	{}
zBghaeQVmXC2kv+3mW5Y	/cFEfNMpFxRDc1+1PpSb	crAyoDt3d4KdsZJMv2lG	37	\N	2017-04-26 14:21:40.951	{}
q+7tZGvSbNHBj9W40wrE	y90eN2IFt6lwJmUaK9TF	AT6koPGycncpKqZbF3zU	427	\N	2017-04-24 16:02:59.564	{}
9Px9MWo+DdyOxuULGHwj	3KOaA2+6IjmFPfm4ChIJ	FYFM8oSY4mozNGths+uK	664	\N	2017-04-25 05:01:14.002	{}
GjpM2JH1lPCrAX2jMHrd	Hjjd3Ns0lvG3cs9jj4N7	5rijO1bcavruwQBEQBf4	54	\N	2017-04-25 03:59:21.28	{}
p/xyuZh2p6RlOsfN5C4U	VErp5+HZdn3Yz2G88TZh	GNaBls/CdmguX5G+wFpR	472	\N	2017-04-24 03:42:53.453	{}
dSt53kL9b29cdVNQvVhv	budgvhf/oqc9FWtiR59c	Y4xmjMJ50lULd1rhMM1m	609	\N	2017-04-26 14:30:57.93	{}
Luq3enRHLfiMVXr+CeCA	VErp5+HZdn3Yz2G88TZh	jOHv9qh1s9hj6+kuLmVa	433	\N	2017-04-25 15:29:47.484	{}
6jWvmkVsIFJgMpzGxefM	XklfmXtmNz7WRzaFwJPY	LZF8bDICD49czTO3Gxf6	773	\N	2017-04-26 18:36:00.064	{}
RqeJ0/ijfiIxbCNnGeor	rc+ccdAK8F4ROpIC299B	1UufxAWZsxWW3HyFyMO3	468	\N	2017-04-24 04:52:34.915	{}
qLHY7lniPOYIW+GPwLCq	Mooca+XNOJQaJb6IILB6	H9Q2R8p6dXw4oaM4IInr	11	\N	2017-04-24 16:01:07.951	{}
56q8bL0fVVfnePL+Ujxv	VErp5+HZdn3Yz2G88TZh	ikQRmU/RpuZLermu3Kr4	406	\N	2017-04-24 14:48:15.771	{}
VmqYVaNmOrC5BkO4pEQo	ljr+mdhFYpVziaRs0plq	sge5E1P9u7v28OFLSozh	974	\N	2017-04-25 06:20:37.434	{}
kw3U1qMff2QVufKtHCKn	XklfmXtmNz7WRzaFwJPY	yF+NPQPKuAL5GvZwGoSP	848	\N	2017-04-25 20:59:00.825	{}
q7Z3O2wDR7xli00Ui7S/	nbFMJA7w8Ms8VOsgI8Uj	W0Teu68RKPemEd7RKqwK	150	\N	2017-04-25 10:17:41.239	{}
KM9RTKdlNzMDI31cMGHl	SBdioRVUMTzSJjoTQ8iG	xWV0D5DONK4qj8UDHoSI	435	\N	2017-04-25 10:14:24.793	{}
Jq83nv6BQWaQLwTYr6cf	XklfmXtmNz7WRzaFwJPY	FcKQiYsCLVt0izrAdZ+d	246	\N	2017-04-24 22:52:07.214	{}
Y87pWU+dufRwYmBk/TDk	XklfmXtmNz7WRzaFwJPY	SQwDrLyMC1Ne0P5tJ6h+	477	\N	2017-04-24 12:45:06.965	{}
Repmak1AQd/7HBUqLxmN	Hjjd3Ns0lvG3cs9jj4N7	VzZiHeFCGvYUJ7df+fbx	732	\N	2017-04-24 06:30:50.255	{}
x8PLUviGFK9HpJtuQ/zN	TMTdMrgBYgxYoTLKWv35	RjdqlasVWKM8vUS0X2Zs	886	\N	2017-04-26 05:36:07.097	{}
0Y4f3TO+WWTw8ad0fSoe	SBdioRVUMTzSJjoTQ8iG	IhfEeC2JKYv3JWjUicxq	733	\N	2017-04-25 05:46:55.329	{}
ws/lJ4RdtVLEX95mhoYe	Mooca+XNOJQaJb6IILB6	BCE0eoqwclbd+w5uI2fo	70	\N	2017-04-24 23:15:30.849	{}
l4FmJVzWBUEnQWcP9fpv	YPGpbTqv9aeZHXxBNgIC	b/sbbIZpDDXLnZcIkYng	259	\N	2018-04-20 10:06:08	{}
G20bWvM2iy8dOTvVkkBa	XklfmXtmNz7WRzaFwJPY	ypLy0yfg7xspHcFe+aCq	85	\N	2018-04-20 09:25:41	{}
HNyASO/PxL5NUVx/+Ath	XklfmXtmNz7WRzaFwJPY	bcIP9xWQa69qDOkrnVpc	558	\N	2018-03-26 21:29:59	{}
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: ismailmellouli
--

COPY public.tag (id, name, "createdBy", "createdDate", "__postTag_tag_inverse", "__userVote_tag_inverse") FROM stdin;
ZNerBKfcGYvzcUKaYlqg	gaming	\N	2018-04-23 15:50:50	{yDCK9bvVz+OPyKphMJqf,KpfqoJkvQHPYfG7LlFHA,LcvTmLxbh8ic0f5wLq/S,1SSJP+nh1dHPDbSYj3Ba,mk70XT3urWLyfZZ3Iiwn,fckFhAcEimvjdMJVYmkH,rzcNqcSVR8GF9trWH7f+,KysVDUESh6mCALF5nQAh,lftCqmDeAR3cEpZHBxqS,1OGDgqutiudVC+VkXNzJ,megQbGSo8F2sH6/zJC6K,YxrgwXWJJGIxANfsTx3y,ArYw7NhdqNWL9QqzeNL+,glXOGS2TM6OAp1MFUx6Y,ZrHI0TYkQ/qJFmufkbUa,1QA5tmem4iHmDxraIHe7,mYrssQBhzVAyIOkrv7IZ,7s08R9ug4jhLnlQ7cN8x,LwKQkVXIP+2otgaclerD,/xjBobGuXqaYoUtlsVOd,13ODUC+tj+8KEKQzjkrA,VwyLSIegQC/smNMjRmZq,6zjYaEnV7AxCCShIEV44,msBdUUDO3EoZGD7dzpak,uzd340PottN6Zkci0SNI,7i2e4TUmv+9IxGcROWrl,7L1ek+t83NEkGr5eG6R4,N6XKhMtxmFtu/jybEk/f,fi78xi3RXOLnrnBB4r+8,MM6PtKAUVLR0Khg0Jths,ipL1PS8c6FkHjdo0ck8+,I15W8CVit2ItxfoZeGHA,Rjzct/ZKQmxLt3l0sDw+,B3ucaGd/7/peTnMjriF4,UtKLeUs/mpSlwY/eZNrl,R0W0RZijUt7exNzwkP1n,5HF/1wJQEbD4CiF6+JOw,0iBqa/esqQ54KxBtjvYk,H7t1CJu6S+Rfe2Z4ccw9,/wr3p0//YwLC5nr7mJYk,5qovD6oaxcFdrrCUa1iz,7eoEOX70nUvPrvWcpI/L,0yD85VTr3Ry7KGGOUGBh,uvA7Yhs0fgcG9CeSYWRX,c0gqM2J2B6w9WdHgmV6b,jto/uyOK++1u1Bb/AOQh,X2fc6ssB9wJIsy4rtH1M,2ZzWsN2ncHKg2vh5hHnC,y7Izvn52jHOBqjoOYbfc,TWVFVaRilOoH04Go06/Q,BAyuM5S3rYEfAouSoT2O,BmJ26lNt/wQnM33C3rM7,waPsxP2PdGFR9VA1TXKq,SFUnWcC8nAKnPTOFje9V,eYbsfYnBhnwjAEaEhTnw,+M1nMfhnYCFbd3FEBjOc,EboLFxVh0KwkbbhHnEqp,weh7WBH1VYohhGPK3mNA,wYT4pLQTKHlGKL7QT8xl,TR0aXBXlx/XfVXUoxHCz,C+S/fVJ1Q98HVBm1XGTP,nAHe8fnQTki9gg6o5+u+,q7k3Ve0NcalOLshNujNU,tnzdAS/32acJsgjM3KIU,c9Z+ss7CGff0PSZcR/bU,p16SCufiUkcaDpup+zoY,FnRy8aayGyOJfDuHO9pb,JELfH+tYsj49qaoJLtGU,XE4iN3pB98wF2FmXZMIQ,ZZ23+HZWVml9UATHfSuC,A6cbWYtulUsW/OFbtmp3,DEKrcYlME0bsn3f356hT,oIGZ+WyfWECymaJDYSjE,i+CGvcziT+zq6aKryYfp,AgTezsZYtmWc521+dGCV,ZGdw6vqVe34UoaJzgW/p,L8LqlogWB5+ErwAPsL4h,RZo4w04XcTptOdS1lzwo,lnICVHsXzSIuzLQXPXyV,8IWxW4VuiDCagKQDPJMF,ZZzZcMuSWCz9BLV9C/g+,DGrgyED/G3V58k3R+dZ3,Fjc5QL3Atjq37nP9LLhj,yR49OdBApQgCJ1oJSJXp,iqAKg/pZHEQErmZ5x4ry,uYpDoXMuSpZUVRI0o36g,fwrRMhuKswWKbFX9RIe+,ALxSkrfI/nEfCz4m9Unl,VQKAfEm5MbKTMvYHdrxx,NvvTRxDCIl063mo6/SUe,qlEjYwCypEmWsjAzGzc6,p/CqfBu+DisIv1oItLbo,LL6bVRRt4STRreHJWcTh,R6ybe0eH8hfyu403KYh2,GS96vifRccE/qH7ZAg60,B6J0LKiSESFGjB0iWB/7,unQcao3dvYZ49SmVvrIX,o9ZteWGVNOILvwbXkypR,zY4Vh4++cYh4o3WTiT0B,8/q4q0SupxldItzsIRcJ,WRu44Ro6lG+ZuUPZEqpr,+XGWK4kgLUvd8OpRd6MJ,suOgNXpHoBd4qsoB0d8v,TbTcPj33kZimNGVjkY+P,hYEMrY9Tqayp29O3IgIE,1kle+oSO451mhI71Yuc8,QdUrmCm3wH9ZEni5kwNH,yO2I+QIWdezyi1uVJXA0,9iIsG0O02l3GPbXaJpeQ,PcFYljdapiKLr11f/Jn3,kW7KFKH+Zh/S6PpY4wBX,i2W3hs8PowAZiRecRXW9,BIE/kkIRWDGEapBJL6Ti,vDo4IkAzhqQsPkoeDmSL,crticTytaBJI8beru85T,ZpfFx8HNgYDogoUBmD05,OBIxGY7/lV8n08kZyg3M,WS8R8Gpzz1GL4JGc0Nfb,kzQks/VPQlJdCOVGBizg,/+fHtFELpUU/ncad5Hi+,iRriPFcPb9BZ38uzwWma,+SH8/vnENB74H5H0+1Xc,KfLA2+BGR3/MluTI7DSH,GIzR+EC6CqsRuAB/TgYS,gpfRCPd4APaoDKHN61xo,/urOh8/AeoKNUct41TWb,ZVJeC3ZBzp5jB7iu7bKK,Y6bvuOyQFZiy7/tPPlAI,G07YAd1iWQu7uLxGZE2j,jSeiNYSJRXRhsTXeNn3U,U3e1tKCycO4vxCefxIo4,xU+4/bpxwmyQOiGIWb5R,TMa6uwlgQ4f1dz2CWlVN,utZG+D9byGK4aY/XLDW6,4tLIv/V8Fbq4sWBD0t+X,sOpfwJaeXCB+j/w8+3QU,WN9tI2kcq1q0lTrAOlSk,EwhuUOh9tXXKRXXooS/l,zdD0gbHpk1CqeKK4DOyi,wIcnGTaIBpJ4z/oUB8lG,UG5UgV0yWNkU9NmJ6FIO,Jra3OJUgbKEy/mISAMkB,ngphxrgm8NH/rV8qsWU5,tTH6l8ClrnKDPBK/v4sp,IvfbyWnUqvWsxBRPUifZ,wluc9z8vb/2SrUaRRwlH,jFFNXPAq+wFJmbMJxHYT,2G4akPD6oQITqGN2tJ8Y,ydEg1HhAupwkWkRn/hbo,kA+A2tKHNaixApZxPpJ1,Z3pFya8TzzGe6Dge8d6K}	{}
VErp5+HZdn3Yz2G88TZh	apple	\N	2018-03-23 15:50:50	{840mIztM451G1VZ+TikH,1COGGnoAjwtmfe/NlS4h,TyXFUeR9v58IuTDDKi79,uqSHqeB2J92ekmuTDAVl,4RaJoZED55VSKvUgGuzl,6AakWmgM56h/MmelB4Gs,6IYKBRlsSQ5ZvpwmcTn1,OG/RjzLcy5m5jLWANt04,+i66BNYYWmzf1Z07DNE0,gW6v8ZaBDHgoQdkerA7t,TNHeu1I4nqem6d3Wssnd,DIP2moW02JP6UZtJRuEx,gmu8DGlcy2AVidGt5L7b,lR4MUTUqPmTtPAb7ujDd,ELQLYfTX6bY1dMRRkAYD,0SF0C09OCIcZw0wTPjfh,6moDcX71qN3G2wukU8NT,SOS1Pe9/xmh3hDfX1KGL,+pVmoSjL++c0WZpk0VGY,qHqev84zbvJF+4XDFfBz,E/s+Bjdrk3GF6EHasSFv,oLyRz7E28m57J1/MowT/,rIzYAwb+gIgHozzTU+ET,7P9xxhH9owEKU1bRygqK,hr5g2ViF6SXuP+9MRIZM,zSrBtK/osmMR36FatPRL,uIu2W+B5EGDVvlnfcEH3,q6f99pQIPsJzbbJqKxd2,GzPmWoQZwLIYEgTiDo4+,FmVJpZgfKgyXAQC+pOLp,ob0OQXnmSfWo2jX+hxM6,249fUSyIu9oxY+tbgaGN,QwMDhV6D7ymbd/oF43Xc,TrisRZQxAnBUTf4GSg2s,279WgqCMsv6+cBHMeQJX,BPXAbrA/2ICVcjfXT+Lj,qCRJlqKI5SXjI27qermT,IkGwj0MMnVsmMdIlAqes,pKKqBFjaZiTvuEd1pkvn,mqkwLmj0/D7veSchx47h,+LKm7BPmYV/HXhyLkmS3,d0+LN3yHteyUdMy9jm3m,P0Nr4FjS/JcWcTpB27EG,UCFraL7oo0gjuJSjQFnX,ZoE8WgmmG6FY7epdsVMG,RRk+YdEjTrMCgNYswT/I,2PZQvAldC12Q+XwGruKo,mh5HHQuR+umlyBWTQeNW,1g5I4ZjhAg/4sncqkLrh,st08o+92Yxo8b1FKApEq,Rc4BHoat9+DM6GpVylwi,48Ixhzzx+xPpjHn2FanP,jy/DJYx5d67N/bcLYIYp,L6v1ujgMfvs24pTCpza4,QGOdU0hhAbQm8RV2gzvo,syDBx6kHzcfcp2Mbi5C7,ffJ5BYMp326zeMPHy9KQ,IMSUIkDxSlXXj6uSsMjA,mZq7/hviUw/GuwDTlayD,4zCNOcV+63YyZaueLtd5,phq69E4pj6/BiA7E3I3Z,RS8mQ54WpgON4hnmh3cy,AtbfswLYhz/Bjblok6wx,bHEtV5DdeV02Ftzestc/,M1Ol8JeLqexQ8aAO4blp,NFuA2dG5Qm4oipbScKw8,ahIf6wQYPPI06NJIZhGU,WuM2FBDK4jiu1weJEHwI,lPQc1bT8sCRKotXEISWJ,92Twq62mVi5qa+19qjid,7xutB0SvpA2JQgz7/7wI,Di7ztgGEqYhSYvlSLVgK,13IstolT0oGrMaZ0MexX,MbU+FIWxwd5ui6bUjjp+,7eA/SNVPkzifbReZKXiQ,OFDtLQzpxxhotQz9UXKq,5EdKEjae1PA0wJtRZ0z5,tYekKPk9fN7bnOyPgaSb,xB9azM5I5F3ygUvRVc96,ETAIiQBqNTmYlWs360Jr,xabBPJpgGvfcZwcFAGhD,Xl70F8x9m97Fqf4NS+cQ,TyX7L9AFPEsXVpgebpjO,rkMrIGThO1N2s/eCGuFQ,hA1jeHIMolY4+fhSMAkW,Kbz8KamDJ3XdJk1+6y8a,sy9gxemBv0a4fEiLx4KY,1pr4eXQTKvkcYYaXg14F,DTCQsmqXC1EFBmJN0rdi,iOxp5U2ZU3PnOPx7ECFl,QeyxFN3KUyZjLsqJLWMQ,lxOfY27+2tsWYCrCZAg5,Gv4ksRNhX+pi3RIiM0V6,S0VHZmm3hTSk0VFu0T8C,ohOnb/sunpKMgUjLAcRv,52j2J2Xgh5/WNXVusNV0,2bHmVwtAWap/F5Biuq0U,VP6wx+JId8YZagI+sNlo,oeVHIbsI4ulQE3X7Xldb,STTcxWewAXZtqohBvMhU,NP2RZNuVG6EszHwlfOlq,qwUZvxmPy2xkR1gMJqR1,U1M4i7Pso6AgvDolr4tQ,afuIG147ottGoBLZZINR,pJvb7Ymr9F6Uor8e2U5o,AeFJ/Bf6ShAoDPwztkbj,ShaoHdKyBb8pkormKhpo,BEQ9sgJQc1nuSBsi0b7p,pnE5C4pQvY2UJJ2hhw5K,lEYB1CE6Lu44i650sS6w,AOeseksHEfKAChFcOwmn,R+wbLnAwalJWtqYWt/YS,S7xzCvI1dAChQne+HzGg,Mv0fnug11gVestI0lnkI,Ee7uLDfG3IKf7WX7cZJh,leHQSRXCRt7gyu0XJsTa,ASvFoEXVJ7OcM4aXi6D+,VWZYOywfq/pSc6DyTzxD,o8CnMYhs+S/31eHy3axr,fpxe/sicAlUAng6JMYUH,0MxFaKl8b7GgfNiRCNCE,ycBVjD6VWo6L4rhhkwXR,oIG2oGAYd033p6UnohHj,qRx1lBu05CnHQOL8W7VK,CLgfuLRviiXXcLcqs14m,BAECOeO/4gx2oQLoKTeP,NWZzXHCk8ELSk0BWUzLv,vTyQYAZcHFn3Cf+WaQBz,MFvIvGnsBvItXRiRrS2w,MAdqwgAoFdDQNZXKIqVx,OGeb/zJbpUKKr1W66xdE,2GnS1tmdDlp1yDfLw0go,3DGgOFAT2yRyFQPbk5QF,2fyqJi6qkRMuKW9FZ2Km,IW+OB9RPpBPdulkmM0Y3,p/xyuZh2p6RlOsfN5C4U,7y3isOwvS28JradlRbX7,Luq3enRHLfiMVXr+CeCA,OK7r3hahE7sb7XUYEbiV,56q8bL0fVVfnePL+Ujxv,2m9shy4L5vkg+/NJNIZk,F5+PGJYRAGFi4E9tk52b,UdQOCV11nj2RIIxBODhn}	{}
SBdioRVUMTzSJjoTQ8iG	news	\N	2017-04-23 15:50:50	{DnuD2oqLfhpgiUrchdX5,vXKj9KAprbEJ26vcaQhe,RCGLZcO4J7g+YWshDjpA,kAgmJ7iEkHOT/10qQ6G/,kIJnZusp7WA0B0PctWDn,l5YDuzG0ejtrdw255j49,/DvEwGVHmfOjWU5MyPbj,JQbBa/1djJo0dSHnHr1c,FinL/Uw/iWP0q14eHcpq,5d/V5F1GWDzcI8Cn9Df/,pj9Gd6O6LGl6kXF52CeF,5hjEuy7zWypaEJZgqXsO,jF4pKbh4uItDsGWk+zIb,w0CPSq/1W8UWIA9a4DBb,C59rso2+cIdGaDohkkzO,Eaos16NG0ghQVmvaohgA,q75ooO0Rde11iLa7wgs3,4/tlEjQfBC6+16BRBUWA,t6leReFPKsWVanGQNukr,no6YfyM8r4wjwVzGgT53,qoLPda1pJA9xrGLdfaVH,7YEtWg66n+SmrV36jNy7,RqrICVxU3DkKWITebaRd,5sSfalNW7K3p1Aikdtqh,EO/mmVFesomDRWsM6B8j,yPyifYJXkkibia/+B4Tz,Izlk/ztyclWz8BxqCEhd,mDBhOi7LuCysduR7ZOYi,PvPg44DJQdRcqH4TQ8ma,1K85gdfthXXQqdg+e0Jv,U2FaFips6fXqxzclp/oM,xdTKXBv2ahe2gH5NWItD,LDUdUowllvjnEsiVRKL9,e7UBspuOcPNpJPRaFheI,M9WjCxgWBhIk9WEyFxiy,hFYqPcZ3yAbqmYHjHXEv,qRes89lVHcK9ST/d18vX,MBC2N+2rmsGGhvLWsijQ,8yULJzBC5tcjnc2/mi/s,R0TfaUA8AfwC0kBsCMoT,xb2cjB1wOrg6k7Btrs7B,xhjyliEfKCsOy6J1ga3I,GeANBrWa91kEvwL/DpFl,47QCnl6M5xcfx/7JQPLW,WkjJDPy7j/IjJoubY43s,tQYoPKQfP99NoAWsY2JG,aiTADzHgORxggiSyYrqo,c87a6wxV2Y8FK2hKRjM4,UrlZgNjgeaXJfP7Eaz0I,6ge29s4ibHFeD3RtPG4K,VDhuzir/Sr+Bn1qYnPYg,MgPZCIlmfJbnDHl52DIt,WpCObqxyifIVEsaIg8uP,w40pX5j4/6Jwdqcu1BVj,iciBKY6Zd23oO7Fj9uPu,kXPUs3aLSca80EQ8xBST,XWJMgfw2eQd59x8gr5ha,W3noUcmQ2Xp5x58OzBmZ,mrWolIKPdpp2ISU8RFQH,Y6koAAYc2gsoRJIOElTL,BuLVVzxfTndZnTW50oMM,Hxdi0TpcAgUczKmbkUJp,sXxiLhRgJNRx1PwbaoTO,cXiHw3UmH0ubaPA2EvZO,RyJguKhCVjwRY20z8Cex,6S0SSo5gPu/SWHfHQctQ,+9nMCmQ+fJ1ctkrWZ3IU,h6EAdSTgn805GEvGE7/p,WEj9fOREUS7PcEg/hXSq,DLbdn9XZHAKf9IyQg056,cJHibq/XatV/fWOXn6+b,IZByK5NJvHyl+YsuoVDx,yx2WnItnKTmlrSJkOn+W,V4Xz3fSFweEQhEDNL4ZN,rJiThynoNC4mUj0tVM5D,5Gl2S93GywRjwYFDUTyM,3xplDBKPuNkPwfCshuK/,U39PBuAUIoDWNJ5p28VL,S63WwGMd4oflktVUPhNG,rPp2JRdnVWJPKHkr8+4F,0ncXfFNXidNjI7Sek7zW,m6WlfZo2cGF5GvqkGm+w,8Toe4omRUqyQDaQLFZ1i,BWzIp9eesq4cWcXhM8fL,Hl8OzarA8KxZ99op7OPo,k3IARvb0QYsTSuJGjhYE,4rU02hsewte6DzcDj5ee,ydHHkAlQR52bz8uF8G9R,TMtBoSlaV5uNsIvj+iX5,nLi5kD2skOARd4IHfjDe,Wxhw1M8XWmTJ4QYmGF6w,ise5Yx7G9mN4JMFcYe8a,yYlEgwaoZFS294yjNogs,RM9E5QHf1K5Qqu/A2r5m,WmhJOeXRkWZhKyLIpWEq,JW31X0alQFUsprGjNspF,wc5LXzdtGlPlxxPychp/,JvvioL+962Om/I/cESVZ,YaLPlSQVFlgxAO/AWFCy,xV2XnSOYaKYtSEn8B/Uf,uYtNCni1s6deG0SbRHhc,q1XX6KqjY/A3qb7dvTLe,HJMm8eJnCZNbIEzhG9in,u9CMl6soRBLt18ddq8vo,bRAY1H9hpZak4V6F3iQE,7XNDIuPcHb8/IIgxVo+l,PA6AU50NqKZTV/2Fy0e0,ITWJEfRk02MAiFYwLCrv,IxfTyjFcPjdIYg7A6AIj,42wDRSwkyX+r6ALCYoHD,SFGC5R4gKP0SxC0y1qdr,Ir2Rd+2GiCF7mNt+OTm4,IWUOXgPP4fcXGW6KIyxD,ZHKV5vk2gxuXIdyCvL42,QOHlia/KqNNxPWgriv+o,ET6boKxJ1+KlCbCEr/2U,fgupWkLNq8KHtzgaQQ4r,bT4JCcUTFviCTfAIGRFH,wHhYbFHxP6uklR0ueZmi,8sjodg1cLSnvW7aJ7c62,Aq8IWqIDZHLq01DwaTvW,YAc9x0tHU7PagwDPMYV6,k7ygMcXR6z/3/RM3NN/B,3yZuDdZzXIyRkbuHU+Nr,EK0to4DMcCHIHNC2GYKo,qLkGO3usrIay9CwIU3Kl,C4o+nqtYZeYZ9RxH7FKb,EP8Oj+gVzT7SmqLJAWiu,lPT/qnqbxGp51Y55rQFd,RZgfv369S3QbKnDnBnaa,zCyJNnhFL97HpqtPyZkD,JlUtRi2LN8ii82Z9U9vw,kliArY8X+ba0UGinJAvU,FsHvr9BJdgw3aXBxOXhv,j29+fHZo8SS/Y8meeUcj,aKQJLhpIpgh4UlQ4j/77,M0SWk+Eyha3qbWP47d9Y,ijdwndMHhnVh7784Sizu,7i/mQkPjTwL4IsfjJMoi,P6X/na4VhdqLR5DdPqD0,eXQq9hxnFpK05Atl+47I,a1WPDZORLz81X6TYGdUL,dr5SzWAyZiWRNyQfjfxT,hTePoGbfKvhjlusQztdp,oNziVebdx6gHVzs+mYbz,NzZOxTW+Yrb64eyT/w6D,mr7+5lITcXy1HkuClblZ,MVFNhpY3N/zLYNRAnhX8,ScT2iQPMLXCVKvSTtaH+,Rmx+IuEa9mskOzL8/Xi+,KM9RTKdlNzMDI31cMGHl,0Y4f3TO+WWTw8ad0fSoe,/4LTAWtFSDbyCYxRmp4w,VkQwxTF2z6FqmTZMfKuV}	{}
CBp22Vfd78M4NgkRafEo	worldnews	\N	2018-02-23 15:50:50	{c/N/srNX4KsoAP3Qd1Vi,b4tciEw0P9pLN+xo6ADI,XaUTfQWCJcBhU7Piv61F,UdVm1MGiumWxVIBj8Ydx,2X9UMoZFvUlPeoaUqLjI,SpPx4EuF4SnZPguPQkGq,veaYYudcbl6todN1USuw,4tQPv2UMtkaPxd5icXW7,FhOhc9FJiHXRzkozTaYB,FNt/5fIQMsm+4TlDnjKl,Ejt0oig9z1YZJxZqYkKx,xHrCik+w8f7hwTKngyKN,Pt2gTMUkuhsFJQUrEaII,EMjxsnsVkgkQ38b4Sr1W,7GoazaSf1Un3xuAjr9eJ,wRtS1a0t1fz/JfROdQf0,tib9CVwb7qb6NM3+BSmQ,njYEBuqPlmaTvOFEqRca,5mzLg65fgyO7peIPpbB+,p/9g2oq9NDnkViKuOlcS,3XsuGVt6DIjrztyJRgS7,CCzAg5BvvImLorrqEBAa,eJkXwX+NG3gzPI4JIuIP,gnNZ1GqFPDB77f/rYl1Z,jUaOeO7jRIZx4lt0JfgH,EN3Dqatollaxz1UVxdf7,NLn4Q6ygW0JXdPNanhW5,pX3bNHHd+xbzuWS/p3JZ,Bu7NDpJsuDbe60h2FxmA,mz3NbHyyhsW0w0xee+ZF,HT3ZvfziZDLxH76qE49L,mCXOMv6RdHrmraAiwQLv,4hD4766USdvko7JyOi1Q,qlJ/KTfSVF0EG4sJmDUb,GRTiS9d1z2Gz+iQgiz3h,gLShda+o+pHSzK6WyGTL,6YvDtA0iEO8KmZzOzM7k,j8fDqedlOj42lEGRXt1d,VHMhTJTIO+PO0zqDe5h0,HDSyR/s3AlrwMRWHkw5i,23sSFdGBCKzPZ1oJ9ueD,4MYnE772QHhlNl1SySyQ,OWacP1mcp9OVfnKIygxs,jqscksc935GNAR+6yD27,heysp+H7cjD8MZjqaqes,pVc7FnQJxR0sgE24yXXR,97dCQ5JaSLgN7rht+w20,40aGpsf1L2t15ZxfSxH0,fEXcJY3LTpK7U3OOxmoG,dthREtcRGo/jV4VTiMyP,mbXxfKFipwEpLZbhEkoA,236UlqOB5o4+6cd2TXXl,jKpvPijSXftRFMqa4cR6,OsDDIp/KEpgMNxhiBxAV,KTSWcUA0tg7rOwXmT7j4,pM6MgOAQuUglnj0MWm4v,UTnTZxm62tRKl/008mbp,yxySx4481lDgOhQzNOvr,Pc73HDTy1JzreyMBHNGm,Mc49/RTwPkUyAvD8xEE3,FS3oPfTYYTcMZG3SjzDu,+VGswIN5YjvriB7txgKN,jxJnR2ytY9JIwuv4aMBM,d4GS3e94yUBaHBUT0G5I,nyQ5a9sr71HtTuaYveEx,q6z89dfrh2yHxuc7HZ0j,55XbUP0mMejPNbS51AJk,MyRb9AUamQvV5oOB3s1A,wx57xHzY/co7lLl73zRo,C0d/ZQK20RAo+R6AA8k5,DkjYTnIXLHw523WsbC7T,60BBf+ND4CSq9F6KQhFu,I2MM789EMTgAklPf0Th8,5I4pPAfrWogUk/8I7POZ,N8Dl2pBIHBl3ijU5PP4r,YxfyRUk64g0gCxj6Bcsi,fIVtJbgizoqJ28UYyTcx,BVMCR2Pt/peXCSfG3a29,jCvjv7V8yIg5hPYoafwk,RcaIlxgmfTylWdbBqEtn,adxRJisiG+jn7xbk2giI,Qqkv4upBeaJpTWuye2Kr,tGLB/CUNF+DxUu/p9c+L,GxfI7t5kgAXf9ohTodj7,At940wg0BcYk3f5tJh2K,oHlTk3YH3cTYesaBfANP,PQCsarcNUupnJKn1h9vk,O0L3pEiS0dAlgnw76sPs,P7Ovu19TVJLliABdABfQ,hmbxE3ROb31ZjoacjyQ1,rcgLhBhDQF5B7bSdIDl5,R9UpisROG+iB1zlEWypS,6eAysucKzkCY6BSPhUP0,2c039bstyNfpFcn3Q5j2,9q9vUStzjkWIBskx8rFr,ZlApAduUbZaqIEZ5Opzd,fk8ILWr38Ql8zDx+MfqZ,wYwRqnNbEkdodRcg3CdD,MrvYaLKQOlwrIMxkJPOY,z2059fSKJAovxNJV/guG,94AFH7vh1shuAeiL4OqG,z7CMt3ZtXdAFIU9cY2wo,i6JEUXaQYRmdmly43kqs,xO0aGp+rfUbcCEwnVbCT,NH7j0lr7labfux7NmPa6,/41CibGubpKnw357n2IF,aUxdtFfuzCRT45qXXNe4,s7psg3ZRieTeMBNwlpAq,3/XF5GTCWXXiTOvzon2E,L7TzGJGVeyQlbeTReCLY,Xd4UJ8B/zaUNUysH3a4Z,WOnbY30S3oIkvYERZFyN,MAgxYHI1qGJmfpqnRxfp,QHYinua4Ap7xBigR8zKF,UpfSJ27ZAIV0UVT6QIBC,eDy8Wm4/5SdkWIIY+W4A,CgODMBpaV3/U8tt1B7Qw,QX2dadDnHp/pEcM0OpyL,veeLXy5XFdYdWqtjGhQY,Fj0vHiY4I+AAnJ8C/JFd,XkFSxAhtCijLJZ09YUiB,Qf0N87/F8JMH1trahV+Q,oHF2MKHHun5+Js/s1cAg,m7/kaaQAte9GB4h9xkEg,iQ511GpHOccFVeQkBAYA,kcV9R1m2RNZt/z//U8md,+pl+7aDFnMUhjwihZ4mG,ilGvR3xKuzWl8OXDPf10,5jWOcRYnjsBEigMQVBrU,MtnayRGl5G77OlpVFdSi,kakZsAp6XvjpVN1ky7Wd,sM7X2FtBbf2s2VMOk+tv,H0U1vCbld9ysaBet+Ryj,R2mZ3M+XFZ971JfHh4bl,BBlEvHbtYAjWpE9Fa0FK,ZRSRyV1sJdHD2gyrqVuP,OP4o59V372C6WacsovEU,0LwzhgQInqgtX/VtqhpH,syzHXk1TPBjY5XwCec9W}	{}
0/Dg4ohpw1BIoLvDgRkh	wtf	\N	2018-04-23 15:50:50	{ra0DJXyhCeu1HqHPEk/c,Jy2dk1fH7PzplBOSTjTc,pR1bn5Joov++YJqVDEpB,DhSBLdV9oqSPaD4mAZR5,tvVuNQVVTnNYUDF7i6kr,LOLt7/KmUPWq66P0vEYw,4170uzElE0lBIIWgU40A,yi2FOQFiP6RQtxlirCEo,pgb7WGytEL1t1uq1OVtA,IReW7fIyzlzkZ5vFYt8Z,Me8nVRzTKOC0khHIIdGt,W934Y9RzaPipKGHMu4Yv,a8PflIWtV3n7PO6mgmQ5,W0GYJrhov/hdDAPMagoZ,cjPMvAtcQUYSsykC2BXx,rcK1w3qi/CSEOidBMRLn,LyGw1jcvB8M0eF2Fy7Yv,e3iyP5E4OGJ8EzSYXdpv,RUZhzaBenGf8a91qOcXT,4uunkzBh0+AvlX8wOB8M,kUV8d10omNNo9ZAIez4g,1je8t9zjbcX2zkRuJI4l,i3hMPG4Er1bhOwLKAM2D,C/aIK4+j5A7aY0k1wWD/,6gZRdgkSLQ22CP8bnoGJ,zp7R+pmwbKZFfr64C/pI,M53XBHQqLRd+HB/CKV+w,eZu4QTWFFUcZVyXDgTyJ,jBljRod8UgtJ+IKl6cQo,NKOUG5zLSZb8i+QZMng3,VbPY64XP98RkhjY7G0lM,gl6wi0iKppAWsgfqPN7X,8TO/gP6ewNo6zhfoaZnz,G8GJLhz+Fhrgd4lDFB2E,SbfJqPVEfC6KQRXXUECk,z2fsu85/xcpH8UwFhSoX,IR/NzV0xsoPKU4aI7A5f,Zn1QuytZmX/RtYb8JBH+,JAIMNzXMTfbhNlDTYCEv,RSFOF9cf4LmrQTMkbgkI,XBqdtsPdPTNWtb02yaEP,M8/pBW2il/hx69jbrR6b,oXl/48dZHs7ba1BnfMmB,88hZuGQ4oITYYXyMxwWr,iN3IEeo3JTB0NJbR/2rd,N+LmC0JidPJcaPkMRKPF,DVyb0TlsUSuCOq+N26YS,Df/rxZx7xnZITTryLQlz,q6j4cp0862/87bdYriEJ,nt/64cVRyVqibvTXLueE,2VAN/uVoQDwAIMR9nI4p,yoKTLjD/4kNlZ/7wtTPo,b7fmmFi4+HdFl2Qm7RAE,J+lVv/GddCXlMoIyo0/r,LSQjMJnEo/dttvvPaYNd,EW+XOq20+ZmTZHebcox6,MJvBg+2uqvpcP7Ptvv8b,pQ0YwzU2e/bqBOcweH1X,BQ+TDMqgD90VE3R2cXZg,XDCzJ/jhQ6qyDxryBDka,phJ37zi38Bz7obecUxfi,NKafaOZ0YyVGmFLWNdVo,mROu5y62xfObHyy/PEP7,IROQyuB+00DSKRunSmGf,UFp7MikhNcRs/SFv4FBv,mP1j2fNRu6zVZf6jrI49,qY2LMOCJACdOVNv8T8xC,+TV7PWuOtg7pZUJQu6NU,M2it0QzxsfRPEZ7ePoPO,Dia08xcAhdLc2LhDhquY,7RZz/1kZzf8JGNx+xzGr,qfFS78Xvv/eA/USycNRc,VCsyob9lsAGHxZn3qAQh,fYUb6hvscdnr+sVOSopj,rml+DbJjfz7lhB65lail,BsCV80ffoCqSsevqsh9E,hwMkSivmBgjDaEZrF4Fw,/9iGILcGgXVihi0E+S/E,9Me4yWquWcaOf9z+s106,iRwRWRPtcSvLFJ5Okvwf,K55d3wyBVVZwUEXnbImw,0XgHrsi928Eiu9Oj7Y/G,nkP5Sua+3p/SJhZpU1Lm,6u/VT2Xjym8rxgJteyCD,ptqmFfor+A+wGxENI78E,29Yo4PytXv3Nqb4WYhoW,NLNJp6SpMw3woAIawknI,bydAGjBi3+/mijSefBT6,LiZS4YxcZ+aEzxdoRoA7,Aee5Rsl+I3DX1VU9/SJT,Pu8AbxMGTAMqn2pL6uYV,b3DPyfU4KHYoe+a/Kawe,FpG4q4TBwd5V8NEd3+hV,I+FfR92Ug3IcbXMyufRM,rSz87Cy2fANvAKlgsm3k,cZy89KDf0ixulmgYmEuR,u9At5P1PaxLIPsZoQSRX,AThB3cdlcYXjAr089i2b,rhXzZVxBUayDBOXs2Y5h,9tqTNWyCXzNZikChLCf+,/loe993pYaRltD6G7iUy,dtJY6H6cs/2Yjo1/eIQU,d52jO6huRGs06jxsT3V/,Xc8yRq1cQa7oTf6YpXW9,4Tf/1oaEOjwotdmlbLjz,JqVR6LfYiexHsWJKbaZW,ZMpu/hSly33cO8mo4rZT,wTbuPzBu6JxHNEmYIAwI,UEZuMAO6W0rclb4ZVR+0,u1vHLslXCx28hWi+s/bv,F9Z7reXqceioXC3DHt+k,Q5+n1D+1pl8Ynj0OQjbI,ExSlGdcCn6+M/sge5U0m,AoXCg+n6EttOZ2RrtA/4,TA2JijxB1j9xfCzHnwPX,0rxUvalwrPkaMjkaKrIE,UJebzfMtXAZIT1aQiSL1,iWDxhd0cRLaeYC9sR+9f,MMcrRztBzmhmx/PDEWLh,Os3oABqDlUIEljeGNOy8,LxzLiX5pYomOatIsZ2E6,xd4VMtd55HRD2/Adgbev,1jDdQZYgEk8j8OsrWo6+,vfiNcjWh3HCnAdD1yOpB,yvCaZw1MdHf7huBrSZ7S}	{}
y90eN2IFt6lwJmUaK9TF	iCantBelieveItsNotButter	\N	2018-04-23 15:50:50	{8lQyC4uT6pnqhqKdCrtD,+ViWtMlzvUHPi0atJ4Y8,Otl2/XTxSMxeufocaMDS,HxU8PlO7ZAnVSBzjJpsO,/W3QM0DoHxUwMnhwTpFE,nbEjuwYkeHChsaNUXEDx,lAeruyr9NJU1SJkrWlZ4,0dMG4eESodUlhrLP/gA9,LjIRyCowENtTeaAHAk34,w/jNy0SoOSccJgIdXbJE,PJo2y3HKA48ruygyzsqK,wbzTyg7bDGy/erS/zGQT,ob9G21RmpcfuQDzqU0Hg,EP2aOMhaK8xqumko+j19,icXFybfNPgYPjscLh2Lj,icbxCxwjaS6WY3dYw1u/,h2zaeCiLBxYeCBXIS129,B8N9de639ZzEymzDy/vT,aXEDuYsrUurDknVTFfsY,YFltMHTQGb9FUOC7ROWj,kDCAF77FNznu4ksSPycY,rFVPUYlOIvQXQAMFnPXF,tyrLnjlvyiAn3l+RdttN,2/ILlcMgEMCQmOHN60s/,Az+seI8o1SuSSQQRRyot,UBKZNCzRAJl/I8tcNr71,ksz49huJOglsvvkCeF/R,tJK4sg5f4iRAkYjywPv7,OX3D+KfDO6DSKEeiJNsI,wYdnHvMfXeySj+MuuAfw,jvqK14lXztC918YkVSxy,lmwRuBurWm+2DtAo7Fsw,wYoxZAqA1qFBlWHM2b73,UEjQiw9WvGmC7w7K7zsf,AxHuYzflGzeWV74MeZlq,xjRDACsg8B01l9tYieyr,99ro3dX6s0WRFC9HkjgD,ENSSRxpMRBK8gYrM7+to,MIkxjGMTNq77Ob+CisP8,LWT8as8uyjvanJzKS4xd,K9n9Q6DsF5msiA/kHQQr,IaJNM6D0WWC1/xPHO+kP,hOh2lniKWzwe93VI5ZDo,n1IVa8fzp/4Az+zAncHK,zU5nq1Rg+w8Eq6zmdYyU,UnW9Qsg9kICdC46En3sh,LpyHEdZ/rxfuHw2Hucmu,m6zB7ElOcgzaGOP7bd3a,qg5B1xuurbs0p9+0gU6A,QBMI+Yi5GKFNNg9mOb9s,38c+48co5p9WyckQ3HUc,9oKJ8Q9jHPz1+p5KfoFx,898lcihaYCE/NNzAPwGJ,277t4lkD3bdaoIjhGzaY,yR9KYRDm8DVRh7EVHXUm,8H63DhGEXlREZZU2sG2h,tp+ptio4x1+SvnzMaJKh,kLKRC6rhJ4nuCPkFqV+j,nW/VHjRbvxfPzXv4vGtR,TYu602UJHt806wBHTH8x,VuIZb6GB9Qsn+T4ZLIha,0WZZZj2FS0grN15wLx4v,zpw+kOfvGVc7Tk5Ajhvs,djB68y//1Hiv2+QLyRJE,qkIV47ZzEeBTuAZqRTqR,kNqLGAKdBrzBxMJCQs5a,r9Ouhd940Dchdmq31xxj,kj4h3XszW6oFzgxuCOIl,v1wJSHFMa6mYflfbCSxG,p3O9OJmZ30nAmzjGkHGS,kAqjTl9XZqwz/0o0gCui,zfaHT5+dEgRCNchTvA5/,gIQR5aiI6euhbdFFLEqG,f/en/12CbWa6dr53ReU0,QyfYLS/ZaeMTG8TNvpbE,EDtrEOpsBRzipf70CV6S,oDFDa32AP2N/Hr+m5In8,J+QHqpLNfESXSJEQw1f0,Nbrg7p593iVRMuT5jtni,PYy3cNl6qRI0wWtXCU+x,+ZlgF4H88KazUlL7MBuK,l4MT8svpZYMrqlgb4vnO,JBDLxHDbyUqlbQvRB8UV,jPb6rhAIUkVlkEuXljsa,U1BdDNIrBXnbG1tYoR9O,418aRkkDbESRmkC+ij8a,Aa7jfSvtqEyJktvKJ7yY,h0D3gsCM60zC6A+VXo9p,kA3mStSA8Qv6qihlMjjM,bsiZPRBuglMUihS3eLHF,ZS9rRtw37pjpgCeIicHQ,CFTpt/6r4oON8DGjg/1s,bVVaSX2uZd/amR9zTOdo,Gi8Mpd8bn8DCdfLawr+O,5kXBUGLC4sNBMyo9Ju91,fRKs7NTe2ha6qilNS3D9,YLfMPf3tJc4nLdkz0wfX,5eH136Q69TcyBicWlrRc,Xnz9sTgLH7WGLUhkgAcS,twFxjuZELM8tCGmnVkLJ,aPAQp+a7TBaU6bdIFCY+,rTlbB6fIjdj40SrOjjfR,Fwi66eticG9BU/cX7dys,sv/xFZWgXZfcZXECxXSn,42uNVpdRkAxxEms6lLh+,KrS819o8JkLNg6Ate0Io,WDh0W/FdfoNpfhExM8Ub,Vp+XYKpb6P2GbOXpLRQr,/2oMztuDMST4lSJW39it,sbDFCyTx3BInQ0QVE3b5,xJqYpWo1n3c3ry+Sm51Y,yPgVK2vV9k9RoHSz1A93,9/oQ1QuPoJwDVbBBkJuM,zjP/xQIdzDIkDrKCJM1w,c7j4KhGxc5pBELCpBRG3,qscFRwPfPfkOgwO/nza/,FtOCeWe137txqmaU17zf,i8Ppagu7WeRIQsXekthv,Ws93gnSkYiwXffRy7MJ8,o4P18ZI2BfA0zGOJuhg6,EGfaanmRvL5q0NBTQw7Y,EOpzZWxfLLFcomkRJD3H,A2J99yxtCFM1cFEmfBQK,X//SiOsCtLE1GwKi1fl9,s71ojqvE/yzCLD5cdUnd,NIUpV+H2JEkjspu3VZpp,jzAuKJYtJOZMC6cbwLNK,/FsXbaza/m9wflAVw2+E,KdeChjAY/7GEDo+dmVgu,3bXcAb8rEb2cpK2b4ZBz,q+7tZGvSbNHBj9W40wrE,yllelzRILRNEnAnYePyU}	{}
Mooca+XNOJQaJb6IILB6	oskdrp	\N	2018-04-23 15:50:50	{te6i2m4egwcdZBV4PTb7,VvzeQiP++vYCJfo0Mf99,5ryvuX132U4xLz+sFnYG,dBCVGa6YNvzlbtmn3HQ/,oTuTlNKm8lHOD57ThYra,v2fOIwSsah8k0dM4WtIM,lb3ZcPYj+BkWCKuR4mKH,dIcR2kNwKlIwHR/dQm3P,G7z53Wb4jSSJOWH2FBZT,0jRhjm3rLwHaARFWR7v5,tbLYjP/qwSKGfiL0OViC,rBHjcjB/Q9GJcKYZzU6P,FoZhZoGMS+B3zCK4jdOm,Yc4G/5qWynDG3fkz3PU8,/tUuB3k42jdVpOUmZq4E,LNkutEm7HHDmkfzEzI3X,nsTkOZT9ZLCvoX0L8+qr,ugfsG6r3YHoxZO0PYXEu,RSbOGpAoSP5R2SMXOPNw,XzNZ0qPh5zTX7axZL3bv,u+cbb7AZdCqYEmn28has,17obbz68293J6Fs4y9Zq,pNwJATFryRCgmJEkw19+,KM9wGntchiV1TEdjYx8q,UhmZsjJZVv4WlzQrufXb,bsqnjlXUIu9/IcSV/QxF,H2MTz95t3nq9SyGQleHe,7ETzTYmF8cQzJRPkjrC6,pd/tHqgK/UQIGmtHjD3C,blDtIkqhPxTveQk7CJFy,xuhz9re4boGnnbeukj8Q,/7+Hdtdx138U72PWNt6x,Xf2agETEswlbgvToI/ID,hxYgdWQPENXg6MxITfOR,V0iIZGG+BPGggX9F+Q2g,dPT1Gg4UhNnWj92nUG1k,9TeG4fUMvH9koxbuKEJc,+uZwk16H8/GSc674KCnx,DsWn/RZBJyYng+TJAHst,SI9ZNKglfYq/IA+z2bBP,CTttz4BEtRh7XHi3VJ7S,192vv44AG+VsMZayWhHF,GV9HiZq0ofqW87OiJ4/n,yyZV3q6+6NFwws2P0KXv,5CMwKuQGlh6Y/TeTfy4D,V3eA7i8kclaYvqxJbuo8,2FKlmXzuVInhbl3mKIp3,WwodjkrAK1vi8dqAgcjy,sP8g+cJ9WFZ74jLWO6nY,2glVj5msWv97Tk/KhBVq,wWtC/eu5iJNWejzL/GBT,tZRZOYWgkXaMuFEpcO4S,kwJpmv1tag0MP8nEm75H,041kF0kwSdH8jH/M8Czr,XF0NDg/bDsAv3R2878kc,jZ6zXWLk3fizgwLliH2Z,1dQgmWJGX8EyXvzJv1pn,uuJ8qZsKq/V+ROUVtUJw,OywY9Nh4+ldwX4PfdJCy,KqV4vc/RUZlPe/4ej+jK,olhqDYe+9Ww3y7HWASmg,u90YConWgc3EIk5MUyqY,wvq+Xm8vi2dAro/E6jMH,S4HVsNUmlO+Ftx+MKkz8,xYVnkwsuwXIjCEebZOKS,4j1Pjq7gmnotLbDd0GFa,kl46q3oSJMn6e5FYqmF+,otHMVM4QxbDKdCL4Zd/w,43MhkZTgc87GA1v/tswM,ZoDcNiy5PHQfuPUCxeim,+sEHDNof7aWWC8EoBxv4,QmR1wsaqI2k+9du5BcyA,47I76vt1zTE85cNT075B,qROgdsgxenD0zN0X0IEj,vt6qvvadmqHGdvtCngiJ,8Jk05XMgfu9Z5KyxNbrK,04lYKlyfVLngflVpPBAJ,FWRYeMs1pM2LvarbP8R2,mlYTKOfXrbFWwrPYak8d,8158AtLmg33UiAVLt8U7,maK7XmSJzf+ClBLuuATn,/3UiGa1aPzTyKu5eUO4c,AqdYCUEoikAyOUo9DZnl,9UsnGLuIRzDzgcD9XdIS,8/G+GLyk60yd3NxmPLiY,SeRlAwAycwrXtjlOCBJ5,r4vr7VJULuXSkuo31pY6,dglQj5iTKeHbxVBZmcwZ,GaHV461K0yzy6fKSRi3h,c/0hlUi+M774p59qUNDV,DOCTiMMLNhhoeCIhTtIW,PbjXLBa6os1ixHYl7JFz,JIlsKq7J/N46zGVrYiji,ucA586R9+4hmaUaa/4KJ,ONnYpRl+V/zWd1bhEpIk,2DsgSyjWigZ5zpd6i0We,FEHUX8qEV28tB+OXjU3u,2r03VyZotGqD0Fd2PJvV,2oiWLh/TFV3fGaiOxUmI,10RH8v0vjg1b4PGv93lM,rYNczoJG7bwz00ApcFe1,hFZiEsEmK3lhyHs1pINK,AcKPHlK7QFBDbyPzRFPX,M6sPTbukVlrqDW7uUw41,10CBlCwuyMwFRQ2d/UdD,nTd2PUpwJ1KhdyiZGcoD,Nygt/1g3cbQk1V0YKnJ2,nVnVpI3bdBSJZMs5MHLS,x06Jn5PZ9VHMiG+ltWtI,cXrwIoBhpSSVpp7j02Hk,tU3OXYCqE5DG+IEMDk/k,VZSSh8EMf5mxQG+UdO70,qAr/nVZM4ntmvQ5Vei6Q,iKyalZi9lc565m193Y/e,wiZF7Bz1A4emvvUhH/nF,cSHiw8064nGhCpEZ8zgf,vXbSr5qrDoeTc+WnCenI,wGFsbHbmGeGN+QbYzrSe,AUjLNIdP5MfvWHxG9Qsa,QGefePdBkIFQnb4K9N76,l2jqHaU0ks0ywMo6rpa9,MSEP2cgyHZxiacufP3Yd,QhsVioNTSV9tWf9NVmGh,VfUJ3XErAXCLYBtC3VnV,BSGIgRIXT0ear9lfSBXd,Ny6g4r8Qwy5kvFEISqrw,tpW/ZcsP0ncIKLuydYqk,90GNNQwUyWuwr2fl/mKy,p/P4IxhyzdjrWDFdRw31,53qxWJqog6tLGXe/zf3X,qLHY7lniPOYIW+GPwLCq,drX10EfWpkay/NEu/1bX,7YA325B8dqEe6aOlEeJF,n39953MMCR4OmbnBS8iF,cFw5L8XDW9pHw7tb0cwf,AD3ZAVao9HJF6iYZvxEf,ws/lJ4RdtVLEX95mhoYe}	{}
nbFMJA7w8Ms8VOsgI8Uj	music	\N	2018-04-23 15:50:50	{rtQ7Zcxs301QEuS6TdcR,lw48LAPjeGAlSVTiGmBY,FXihow3gbBrp1OunJ64g,lKI5yhU7dqsSv/yvnc9T,5jXxDPihIp2KgDUiA5xh,g8pvlLOOCp/jG1jywyxo,D8VckbOfrj8gtIpJe5dF,LWKXZshtHYoiWgzSjlf0,W4KYV09HSfmy5FMA5jCI,pvg+xMjSjeZWJI0GCEU9,GyY9+bJECEv5cz3bB9Q9,SHZbcCNtLPF0hHaICoMe,3zhU22Ni8nB0f95Cw4eB,Z/JNYb5Kk7oKrXPFBKsk,0ZBHJiBUNy3vLISw+UKz,LT2qUVBdrntTTHJQCpAN,jNEh/Y9KOdti4AtwmVi8,UZSLyr2BaTkBi1DxT0b7,sCUl8MhmC6hnQ8MYlBfQ,gw/+cjZc2bAummVo7Ns2,c4K7apCSDVDzsZFxAS2Y,mukYiitPbKfEcSAUlmpR,6cQrh7je63Ui7LBSorBm,Owyv6l8ySIlE6d2dDSqu,j/umdhMUM8rmGDbBo2ru,+XMn08wfyOslB3vjCIHj,RdrunCf0QSwkdI2WtL7+,EG9C8CwpyZU9VP5sMOns,E+EIg1N483sZeIcsV7GM,+r/20GCkhl9qnDEvb7ci,JO3NSV7jxaW+nIDFxMZa,d9eKWswu7sLwYcbYD2ki,hFHa1Cmb06/+f+9Zix4j,kBReC1QU4mX4V63WHYaW,sx8TRCQUz9DMNaaMzPER,AzRNC+tdskzCcZJo2u5F,3GNm5ZsFFDUNYIU0TZ/D,A1MrB47vhCaL+Q12tnEk,45CB0Jo05nZrqZIKKUWA,TpsAT2JnQqPZvnXiGZT/,XF1ogCDk+3cqLk06UX31,rD/LxL8J3mRp7M70iXBE,Lfnmx/ZrEAciZziTuqVC,IRnmfoqK8GUxHuM13TAB,ZYyurWhVnBCbSNQ7f6Tc,gcmgpkjaM6wMZZsbimJE,9fiIjD8vVHbddD6DNa7y,Mr4AYiMYVVOjxZpq/IxL,YPTlNJrppp5sRnInz5NK,DGtyci6pz7Fa8YuF+LqI,R0uB/0LBnOGCQCvCFnw6,LV5yMKvQWcjnODkXkKRV,Tc0+oopUhj4dtIJbSmyq,jFsRAWKzrsnpERxpBA73,AGDYZObtLnp3LbQXcYZ3,q3HgRPE7bTPM2ffQBur0,3/hrdy89h89qEojK2/7R,uywXHGbXHNk7pWUA49rX,ZL/yX1BsdYmInZ+cKQWo,WIWzRdknbTkVLciNJ456,EUgKaHh2u+uVQzGu6NqJ,kWyPL3skTdbkLtGC50nx,P7HDttWgobPjqBekn7uj,QpLja7nJSTraBpX1AOBI,+UEaj7XHyWe2uXRXlXtt,r7nQS9Ze5umvz6Q1esVl,lwwEsYAwSRn+J1aH9THY,1VgNV1r7HoTlMmQCVRcu,/aWjvBXcABtWsvE9Xs4F,KZ2afDsB5Gs9PWVXV09C,cxSNHolsLpuZd37MXttH,v5QyYXuqSqCGAQnHmGXn,Kmy5Mv4Np3GALVdvKK1W,Qi2yZulkrDUJGlbbMCUp,V851Us+79ZDRMuMGG38F,p8Ssr1cSzKjIDZXuGlva,l4QhM/RK3AahbvjIe4Iu,8DkaLaBqQI3hrU0kcWEQ,U4nImHbH6x6VtFekvYeo,uhsrlgp3tNhVSUmmMx5i,TSs4McmKRxJ98JddUQac,w6dEXgNHwZtu2+eg/JXO,KZxoUBoCsg/7/3Hcblmh,hWsdMgOgGV2pKYm0yINL,I3ckAna1ePkGW0D+4rE1,enmBa+AqqzcLUmcM1ece,KIPSOUzO3h2Su4eygYaa,evF11mDeZFqcRhYC575j,mBAAFxp4nA5QTL3zYMNs,rzjsN5dlCaPzX1lcF/MC,5CZ7I0Jh3Lm080/NJXXG,a0uHOx20qj4o64zmviiU,cqH3og0dx1VALAjDckp4,NbVeB2yxHw2Mz66j51ol,V50OejEa+ioY0WXHLTPI,VHKHhG0VnzDYCMNbLOlx,paDxo1Q9mSLyH1ejb/Dg,rIgF/YdFztQKpfQT2WPo,jj5nBtv/CrzrNHW4t+Kl,GZPSI+qHMm2gO4T7AHUf,jUcAeBvRtriegyvz5oCB,qxiq6QbKAzWN/2Cxu2i8,Cymr12U2xvVWskfpDUqx,tLa+iCcUF16EEb8r/EYE,S5cFP5q/YbOR/fFvoPfa,ceZupAITXmrvEBUGC8Ss,ZLranVjeteYQMEbenyiz,VuH1PEh3aCmjQJEH0iTP,s9uAudTRNYlCZoU+fsyw,Jf3EP4svq0QJe0JcWLuY,8be0azatNvHV6H4Ax0K+,JrVGN/HF/U+uG3/DskAP,Eps1+ed16nJjN8Skobuv,a0jLxDKONxbeK9AYbaz/,dZehBvkFgzzCce9bRBVo,ZGrCjaX36ktFj6X0h/mM,DDpNnkwmLCpyaSgnx0s2,HbELcGUrwpTyyAVgZe3G,9O6WYk2J2vLJ7knXdnBr,fXnW3G4khTIOXDNhIajT,T/sdFJzKNCWU+00Vq5+B,3Dk54ZQF/w5L5sAiOWXq,Ogq1npLtNTJNxNRY0do9,B2OR9yPtKUCJ73PcAsjD,A4C/Tlc0ptrCLnM3rOwm,wxuf24/jKXhQucL0YL0D,b6McgMJCAPjg/A7L1x8d,e2NBHErS8/QlMhUpprUh,Jkur25+ufreKAoqmvZ4D,nK0nNNY7bJkYZwEqEa8j,faCPoT5Dq0DQGq/SWMx1,q7Z3O2wDR7xli00Ui7S/,EZThuK+LhCSPccKDFdvb,dw2F1CVov3zyisOpHBZc,ErJoYWgBPwEso5ytAw07,i67XN37IMevo0lM3h/bX,Mz09C8YBlrqkb3c6Y+vG}	{}
/cFEfNMpFxRDc1+1PpSb	wtf	\N	2018-04-23 15:50:50	{qGYgATDEtWkchma+UZyn,7TVXHr4lh/SmyWSnA1nm,AgLlv/VGsgMiyLTFM1j6,S5wtUCBrYCjJnayXFf7h,+9dwiUvgiFr9NjCRSzy8,ykPfasOIdNzXpnrIbI4i,81UJJrp5UK2zJmHT17wk,27KMu8iDPoEU/nCHxRAw,M3IxykSXKomFjgeGJBJP,0SGDKjj+aBCWe8S+v49f,2yYkeoEKjrPU3UvdY55j,e5ncY2in0xuaufewOwiY,xUOvEfnv27VHOu1YhWL2,FOm/XDD5cF5QNqCsjOho,FTyT3YN5z8Lt0vhGYRQK,re+edqJ/MRhQj2hZWnED,imPyKMa4t0EN4BSIgVl/,huxYEQk2OkVCKCme0zHu,p5ZGnHBI+6VJiH3VAkiX,qAUuU7NjGqU1+RHK17Rn,2UYySi/ozWo3KMnaqlb7,rLjFCflZLsKB+bUUoHbf,V43r/V+RXn+PRWJHS8YN,JmEK7OD25+CNlD3PFxaD,1RKocMk+b8ScOGTd5ISy,JMqtn8Qr7l3Np1qzxMu1,6q55t7qS/KnUex5g56g6,0ep9SG9koUmouS9Wttxs,J0tqEesrWnfEydTv2fsQ,vyaAM14LNPM6KCLLKc2g,/Mdavxj5tvY2KeD5UjDS,1zZFol5Rb6fNBc9sSZ0N,haxNQBWORGXVbpd8ppcR,Tv381WFzzm1QTgV6SUXw,Lrtz+XPKQozsxxWEgTYn,Bs3vELuPBCoQjCGd1JDR,iEjVUSFgV1GlaVk5g5L3,ogi2cJ3pYHWPiKdumow2,BCgoxJfOiWKGuK/q+Yah,E2+/x8RvXyZs/AIA462C,v8PFe4/bN/+zQMupaOC3,AnxyN8aYyTEYtsOtF0W+,ldxyxlAMxepH0Udq0Q4r,HFAIa70pbF/bAl92ScI2,pRNb56gbzHSUE8piJTjP,+4oOL2m/o0Ws4snzGB6F,7dmxLBimzR6MBf9EReBi,NqgCOzYRAWMBXxVsBgIR,3emgC4Favms5hxxEp0to,WJyeV9AgiV0T2jpGGCbm,QBL5kK/gfdWzB02Msxo8,XbMhom2QqP2W8T4GJnrb,mCSNu6zJHsiPUbxqYHWJ,DIw2SkSkvskeurenVmJL,0JHAFjZlAhs3p+KBAgWr,DiHcNtStgSuV/8SnhpCi,wu3seuF5ybnm9fQxD8Zw,/fSGp/gUmmX7KnQVAFXL,yi1h21gdDP3gKnMFuLKH,hCeVxGK75oR8Az9R5BV1,FO5qiWd7YjpYLTxPHEqm,lHDbJufsZ+JyKjYiPbOk,3yszyvj9/ATEGo2JxmZm,7UKfrNlVwC3/ezIFVZse,4ob87P9YAZrOQSzxpAEc,SETIBUc9CJjV/t0EcD9r,AYZ4iR7MRNnu2lef1KBI,N68EP7xLF9zX6x//WHpt,Jb9VDQJ4InkFkqx6djZc,hB5bLz6t3j8z+J7KeImm,PsNhPDC6U/U3Hqk2PK7j,ORJZnelYsmxmG6smZWhD,SvklrR/69h1NEcxeJBPg,4/G13aeC21kGV3HSCtsP,xjGBb3eM5RCizi4ZMRZa,TrTXlugj6Ih7a4lyVsRs,WAa04hLTHGW3Suc1mter,e+etIBr3hA4qzOTH1wBT,jUGOQ1ewZKFlNf9A6Fzm,/nBscHVIxVRfSR7uTpdb,wkR9tJYNMWAdfGM5uEjC,6NhtISJgAz9HexsaTKuv,rWdb822KVZ33mYg6mUN+,I+CStIKzhYtUCmsbMoei,nejsKKxBT7i+iHNSCLTx,EBG9o3m2yt203qB/8jEI,2kS+jDra/pXo2PQIBNCZ,rsO4kQSYUpj3xfOcgIHM,M3t6xiiS6rbgfSWej+IS,4WMecNd5FNEEbFAGCwRr,Wq03R4y/G5iM7PJzuUVW,tISq781VUkW2bBHFI4wi,GYsdkdOgETKQRcvyogOw,+WF9ECLgTW/bKmRY9jno,BLGGJdroK3J+Y5/ohgtV,9esaFuHTWg/hL3IpEvjP,VYLK89J8kSkZo/deoeDy,wYyj3IpXV+rfTYPidLA8,r4qLVK99mBoncMj99qzu,ylSzMv45DAey+CDZqAaH,jBqK5MuLEjOPfAgKnnCv,cXtLZZdxXo0QR5WYlcox,tyvBXCEUqQJTonkAZeRu,eCRDjMGAUzGDKA7BmfpI,U0uxvOm8UJnEnGg8BBZq,iZWc8csTVgyNgaiwjU8O,qjnAZ6ec9qOV0XEjeij9,uPcz6XfSXnkC4irVBn+7,oT7UKVlNQjB9XUEx/Q9J,SOQZWETNqoI5gAYelrFl,IYuCg5+QXLzLcjJfvFaA,WjqlXOLr2S0UVdAGCyOC,xIF2T++ryRsw+W9F6+Lp,OKvePzOLim0EO1928lOC,ibSSdjVETov0sY5/hCJh,zPyRh0LiePfZJK9I/q1L,9iaqGOP1o6M1Zfaz3W3K,ahnSP3aNesA8eu2fE5qR,zBghaeQVmXC2kv+3mW5Y,TSGMDEv3miKBSmVYWX+f}	{}
+2fxb2EecC80U2DcxPMF	technology	\N	2018-04-23 15:50:50	{ybAJuudCH44aL4jb0+8J,8cs354JSIp80dSWLm+iR,W59E11+90sKpgftOxYFm,mpupbOPWbJgyhKB3i7sE,a8N00cWYU5dF2AMSLKkl,EmL2xU6bINKMIxGyvtU6,Oll3jsYTeDK91hugPL4t,XeU+FI9WOX5mj8rPAZLF,OH+cxmlQ1mwofID/nLUa,brGhrePxenrQp1ij6omB,rAojTvzh0pvzETqnim/E,9rnLLuPNpqXqE10v3Fxg,EbxdkbiND+Ssz/Wc1rgP,K9rMKSeclgZcEY2Z+4ES,jDHmx6Zoef8dkHcu3ms4,LHlAZQz8j1QeVrWBXe7f,HRCf/JgQjzBLgMeWSmBr,HmnCV9SgaoH6eUfStpfH,fEYfhO5OJblZXMjwwiK9,IZZnsKXIJW6zMVEjc5NZ,MPPx8pzgKUSheNIQ3E7W,aNO+eHKJ3SZ8TLpw6227,YpEKyGnqFQYPuZy1QXC5,wKkCTmUTHSz/6jfCuGxb,0qvg5nHjv+SVhd/hQ9hp,J3q1wcJ/fqeFwrlYtg0y,k2/6cEYhNHKDM7JDWsjb,5TlcjLnWHbcH04sHeuo3,ctY7MCoXFLDkT/2PvYnV,aJBugS05d+xaNQsLTCzA,na6I7Rq9SF487elP7CIa,D3gtzmW0Lr0ozS5R2bkA,j2xuvBN8/AaBy5aVF403,68k9HXV8xZddYQwAI9LL,4HhLt/VgJgmv9J9eCTUk,Oq3NL/YYWmiRrk+kysQA,MhXMfkotgy4W7aRiRqHS,T+ZwcUIxtXZm0gLqEG7+,qXmLlO0dyiKdSjA/za1u,rLcCBg1O/n385RB+9AAT,8VVU6UoVpom4xl41scIK,YEpgpghJzhCwuhHEhQzY,RyRp3gxxAAEjTcvWYmLR,JiNYR0ma0bGOTJs/+PwC,TQnywFBe3+MfpmF6cBzJ,JLWjwy/Usr4stYHaDk3n,17ZLqKiwOnVCsshw8o6O,gm1snO8cd+GfbBrjzWyb,yyGspMFGOWiyx37e/0jN,MswTDPaIW0ykYeDnvcry,LPli8IFdN8ojM7I9RC1g,gBmxvQAMCLqL8o3ZbkbV,OuD9kBoYFBORm4Bf6evw,3tzLAiy+AyewIXha7xlx,GmZgixM5KdQIOJED034k,5GSSUTf+ZsUd8XER6U+W,9boOwh9HvxsAVxJG4IWo,oesU9wrt0Bzj/IfQFcvU,zOQCMwsdpYWxny5wPUWe,0zQWzrvMdpdznKzsHTmQ,wV8wDQtEWGuhHQztlRS5,hwj7NfyW5hGaoXqTJR9u,tS/HXrLqZXX1q9pN0Au7,k4HJrFGUjP4sNJPsRnie,sjKt/5+CGDxPKXVMgK7W,Wkjnm3nJ4smZXO7xkGz0,bxhTbO0j2WgH9r1/U2J5,074ur2ZBH7VydKiuG3Y9,TLDmHlIChd2Te4vTzXQC,gpsbHsmV173rUMPpG+Hw,f1W1D5RTNUTxq/tH53MW,d0zx1RNd9nGXqrOcExyt,z9g293HjzewpDOY1QlYN,AuhlVrVgf6HOBTurNcIB,XTz5dWWbHW57W+BJV9ir,PANTzdQFpbL4/Se8l8h/,6OmEXMyVsXP53iE4zSOE,d81d0nrT3HV5DqmTY3JR,CbQvZp8+z+gubsMdb1Kg,QNXbkeax/Zfe8G0ob+6I,KdxoCbnNMwnWIPAy10JN,C0aNlJvYwtL2cbmpUyfe,Z2dqrTLoYt4e7UhuIuNK,Ggt3tzlTUCy2Es4gOoEJ,Kz8LbkykR9g4zMlp/xZa,F9uLYH6kgI5p1nz6UYBg,3xno3nslr0UOn13Ad4bK,4AUwxwG3bRJKpY9Y/GP/,E4WHAfR9IkjvaTpbvJJY,L3hjg9jwNPUgERXbZcBn,CgZOVEgXS+CefMhgVRLb,j1ivnSvj6m8nwQqkCEcY,JBElZGvHYpaBWSEuhshS,2v4yEbMSA2Lz7UtFR0e7,HZ05Z65ukRYnTolbjN1g,yzXk0wSxu0lmgoM9DldH,8TZCL51OTGQ/X7OWbIRO,AWBTsow9Qd69Ei8hhAFH,gzKkMsc6LiHI973t56Ez,4yuI+8QUpJaVyUSpKVn7,4AuzzfA/M2MLkjbwfh3j,LqdaJW644jpNMwBmFn87,JAtGSHX4zyEtdqeNfPaz,58Puj6eSCOmCKNnLn8fq,m9549uqaYrHKaLVfTrTy,BtQNBEkxkVpy9MKxBv33,k9d3HO9BsU7rovdf3Rjw,+XkoCGEtx6Y3eXLPOLxD,H9KC4f8u5U5dgvfkm5QD,nefv5KsI1ig01I9FMIWp,t+Ez3TsoCA1wmBmpQIMM,AGGRWuJGnTvhOObQAj0F}	{}
YPGpbTqv9aeZHXxBNgIC	makesyouthink	\N	2018-04-23 15:50:50	{l4FmJVzWBUEnQWcP9fpv,VAR74kblRb6aGtRN03C4,1gD/0CcplpYHnQOrvdOB,nYparSdXxCQCu09J8HdB,78HAdTWU4wmiYoVNE/l1,MAaAao/wcohzOoAQJ3zK,zS79Z2zIILIvTwZgHkdw,2gCEjcsX0DEi9bNwQY3G,G6Ia+gjDZFPJTUBcdc2Z,TYtRJ660Y1EtluLzieP8,hyrt6IOKgY42V7jSDFLL,W9CexfJcXuuRoxa8NyqJ,z/kuTIx/QSfqNAPOgAgO,nwnAzuc1A8lCtUNSZcxy,fYUNC0pE6neICagi1KuG,VMnD8HAZt5q3xYaOMrUq,5q6OxfSsS9e+L3OgWF22,A8XEwKy3Mj+HmPwuRvYx,L5hA7fES2fdRMHfOY620,PyO4c3HPMPGZQLL8THWV,jPPbCGLKJrcTu2oZerx9,1ci8w4Tcer+nPvMetu3n,amdVb/GqbElptq2fd6Jr,SNEHUVdrVbjj1/+Sc6vI,G18ix6vkuQecwntKq0id,9lOO7JWbVa3inl8muySU,n3T3Ss/c/yFzyi3EnwQw,E2f/Xnxib2+/L9gmbYft,hl8R4O8RtfUzPuKS8/TN,CNle5m9hK+Z959eQn7da,TOfq81ZnKmESa1/9ONVC,leBxvTqBFJerSiO0nbt6,9uhEiyS6GLGii4Me5hb8,WQkuZctyhNenUu6LTb7C,c/tgZiwLnU96NAhJpiMX,BvH8pobQbEsuuZUZVzFi,lgJO0RIAGoxVIx6uDbwf,MFQI0d4j30x3IrF0grol,aaOv7Xic8a6+V/sLrP3C,3aWjWGj08aL3f/2T62gp,3uETbZz9bkE5qiKQkhf6,eWtx4QYoaYWDzW8MD6sm,7srZTVYFxWKvFnYKGXZ6,uvAr4SO7niV0tNS1YhX1,/A/T4/xtsfacQ5m0S+SY,wlaQNrjROSefesyto/NK,pWqyhICSetD33B7MuwGH,TWblrxIDqreBtYIps/S5,1lozoPFtzYBCeDl1MvyR,9qGfGblhfROmSJFvW1hN,mXMHixq0o7MkC3YlhnTb,Rg0A2K35VF+cGUy2f/BZ,pgEyl/2BiTNoXipZq2nX,Z5Y9Ircgs6RQA76ZCG7b,WnIBBdvQkU32mqxmkj72,QUisy0ixR/qlHwDOrPb3,erQJUQoTTTzhljbkDuz5,vgAFPz8C/M6CLpE6tWVe,tqiy/b5DBv9QFOXZsa8B,CAIYnfUZ2LWaJqQ7VWF7,xexUnP4CNmzWsOwU1ynJ,6Mf0n9t9gx1/KyD5hSqy,rS9M2APRyUpoDrJkE2sJ,dqiP5HbY+epQaFpoNLQz,yZNODBpoIrkg98BHx1GR,zs4dxfE8Xk59vlSLLI2E,Yu51cjATfDXzSV4VRsHg,MMCszdOlYGrQU1kHJuG4,W13eQ3GxgDBUqqDkHRCI,hKpzmS8Uv5fOl9TB1XYP,qXSWLRkRdn09jui0QxRB,gK2SL/0ILt//zhmeUi17,r0+NIWHHYsnALDORI2vH,G1mMDHDvs+B/cCc5CzQi,PC/+Mshf2rMu74+QB9qD,bRgi95vHV0il85C7Wr4P,T8R83GcRmnJY54bNMUsv,vKyY4X+AefGh7mK/bp1b,a/wi5IC/HeWBIc8pQPCL,9ZlxsojwjKSlR+oUCooT,f8TEvXCtfXjksaiFNk4h,f+QS6um1Ro9J2AK7dB7I,rAatndV83x5qVqHExxD2,7yybWpe8HguFrv6BiNDZ,kn1Wc+X7d6dxGPZTSupo,3dOTfJMRJrK319LfRAQo,pN5BLWwgzgNupAWFbC9N,Ljib1LGaiyCOo+Mz5TlH,GsDk06FGtKsARVW1TSsp,z1FTY3c8gQ0fhznNb7aV,Nutt25VaSFpuyfx2aNsu,lwGV/m3fe5RcBuEhzVwm,gAGxzZP3zzqV8MarV5Hp,E0n4B/1+u53pEzdqaxy1,lYHuj/WWK+3D8jcUOZ0P,UvvETEmuNw4AzYi8y15S,J2ESdIGUsgOBiwYOK4Uu,tVUkWy6XuWjr5gMekIP8,FPILux4VyZuCq8hc5qnM,7zkqZOvxvJqH0rMtywjc,O8GkZFk2Azd7XyJt9BWd,XrJwRp6BI8U1h6jmNlC8,oorR39mZY6khEOQ84Hms,zTAtmQfAy7/ovMZ6/jNh,LL//5bkQOv+vtKkrXwTS,tzRd/GsvuKJyZupOXUVO,USit2ISEUlrKZ8pm8jBY,RVl6658vWcWnrmXvlyVa,mmO8rSAggi0GqeUCynJS,pQs0mXmMGpPWpCuTn+C4,doAeKwJlRziIPz2oNc2G,FWhMSI8JO5wgT0Fa2yb3,S3wfReyOmfCSrByhEAXh,/gZ1KyT7NhKVlzpTwWuC,EHgAyIf7QsWTFEyp12c8,QLFdel8khMNjueE5Jc8H,ScLYQyaSFU3JDoPAUGc4,sHHZYK4nwkNYrq8P5cN/,m5JXI25hovbFa8q1BPif,b1r5JIvPNmcP0nllojvL,SaNSQ4tufR3/2X5oMNoo,y+wdS+MGjmYR6FZj4X0V}	{}
Hjjd3Ns0lvG3cs9jj4N7	funny	\N	2018-04-23 15:50:50	{9qnnS+i5C5pPycRcKG9/,2PU9tgspxy0hwG8BRt8M,ivAHtUhHOpF8LJhUVKbD,KVGrKJpVkDyAH7g6bezw,D0iddSDHUZo3MTqdsYQ4,rW7XbI5Mr77lM/SirU1i,R02lxp5r8f+RtWPgbc7J,odg9sm6WtnTEncqjVQxQ,jCNBcX1jHar74g8Cdy1V,0hYyKbys8hjRmbYiLRBz,5tOAjPvR0sWQJ6iT11AA,Ch4O7kTWjjNGuVTIJjIs,H40SE+3LdR7EBdOBY1hZ,atdKNRYRv13L/Jv8V16R,qR3kBjQYnaYHk/8nmB+n,LmjpXox+nIENTlMbmRnR,bnmvWDs64GCwRqvJ4Nrm,2tH5YIw0R4EBVNZ1cBHS,JfCkmBvnGPGICR+wqXCD,XgDorlqqHgqLxkDUymaL,WyQfGPhJiQRDoyIQJOUj,38TbV7bJyTWn2JA0vIR4,pt52L+69xBYqKYTXZ2DD,VmmKOvHwoIZFDes/F+aO,c6WZa/oL4+R7peKqwZHo,lRv1xDG2HyaXYGEbD/2t,MpPbpvrDqpIJl1NeQ8NU,fuO+x9atMcIHHj4YyjqZ,k76PRSVXR81glTCTOf4N,mgcEOb2uefKmHm1GJVMK,bj5+YQgIr+CiybXKR4mv,h36KXivOhkDARB5rtq2k,Ge+m311k8vpSZsJMm3ON,Nh/U0yzJmRaBYo75qAxc,JjC/itpupsmOVSkp99g7,FieZYYNtRcYxBQkzwQDO,iv66p0Csb0fI1th/39rL,9CxzIewZNyF+5IWct7yX,bKi5O3uf7CJWAW5/H3hK,60Ufp4zRFMS586RCNDjd,nxEo+kYxDdt84G2U8H60,eDw+eNuJrpV4goHTmJKc,4k5SBpeWliKHhknEVT52,oHE6QrpB2JWsPfVK7p2R,2TYt3qFT+srVtWSlseFa,bP98ak1INfYsjho5am9j,90uPnOKKl0IohIQ89xu4,QFiogeInFAVAFs7zwXAW,ezQs6Kid3mQzMTtxY4bP,+WX59z5S9pjpcVzGUbix,1Rb4kn64WDRWcQ6rZYuj,Kwu1oifsrwRZtRe+QhDJ,BMOjN2JIyU57+IgW/1Fz,r+5inHu+XDTYPO3NkfQs,w/xkPN7oVVxfFqflHuge,P9+xTKZD3O0CI3DIAqKE,99GmrXpY8JIKLu2lfse2,41RUGvRA0vEP+ery2Bde,CDhVeDzZH2S2FFP0AeAu,AdzOfHtBpYaPybmvrayQ,L43LBDL2D5C7duuLMmiG,KMHRoVnN3AQXDAVzytC4,8xpBxUMm3iJeodP6zrRX,hLUYisr1jLFBn2abqW/u,+Jeh6DTRkyy+75Ny8uY3,7vDmvtdwqkc1Tzgy2QAx,6rqF2hw1FZCEGxYpVLRC,Ef0TVjqubhfmzJcA44Fc,VEXXttMHlw3nFNp3tVa3,2w+lnLHrSPd47Xiixd9i,WdMRWo1kvOw78DOK0kc4,orUaG0j9dmM9gP6VPwts,ahL3ahwtzka50muOcJQE,ipMmePeYpxeJQvgHFkpo,X0Zt6iRymSPf+qfRXIKg,JSkd4wBZou7u3vd/E5/q,hM8O3To0jeiJhlTV+xqM,zACBUIVv5MacJpYfV/ab,0Wmy9mrJRpLnUwpxPgaD,eOuR3ggHUjA4nVi+7Uzd,UZPUQRjOEevwjBCaJ0ga,cPezoEfJFcEkSBUJBHze,lGyl+JEVd9bcHGm93o6P,AKng5V6nDH3wN48xHA74,W5vzJOZwUtJmXcJOnX/z,YZJoGx38JoyFvf06u7i5,g6V8dhyh7pdLZyGj0gFU,08YNFlvrxQlP/AQ7HKSB,XfRqCvAIy2ZYGOK86+AH,6n7UM3Zt61JMHdg0NkhR,GT7JFugVZsYv/JLD7zhU,O3Qaxo0Pa05CmPEaN1AN,nJiAcXTSVhf771yk6t76,9UYFAg9MUBq2SAHL8eC5,rccdBBAlO+FsdQO6MK1A,Kmam+R6yS68txJvD/1Rc,qkrhB2/YvaEsvpmbDW0I,L4jbaQv52lEqb2uXAUIm,5AGFPA/raKOUcg5w1CyG,vIg9uGR65h8RQy/x6guJ,DLk3YJMfthA1U5lYPsoW,EBjMajRK9BaJHO1MV0+3,V3zkZW+wKELziyXDLHzb,vL8H3zUg1T7X7yR2BroH,6Yl5rKwc2APM6rq1M+ey,xu0DRQKAfRV9uHhywsI3,yNyd38wl1E1o/T2tscYn,k4aMhN6A1MYOkJihSaNL,ikOGP8a3oNafww6/c615,cAcjhPavmK9k3eVLx2bz,5GjU0i8invEnKMr6f/HF,d+LhIJhImbpbbRnOm4xf,58HDNiwNMNoMnTvqov6+,xA6O7DZxW+gzQb9lBdLa,Kyo34Kdjzfgl42Oy66sL,k1IYAId/W0oAbyI45qvF,M04qEmoCis6+SXcwHypn,+FKuBrFVGhP01Thq337s,FrzdsBHQdqamuuqQNbb6,CQncjL8kIUS7jUofa/Cn,0BSHIcHXT2AmFZA3+Sfl,N5pxkc5Sf0+KIpO6MnJe,BtobJac4f3oH98EtUW9H,MFSyVYTrrk3fy7BCfv2b,7cV9r79H4dGUMBRIBCAY,0/KsgecX4qeerusov1ox,uUfQl6BS2QnmzL9cvNKj,WIL5S+QGXX9cahY6V5Oa,mbXH8DTrSQstbSC/2NT0,GjpM2JH1lPCrAX2jMHrd,Kysa2WbUXyNT7o5KMCT/,TL6syJjShG/hL1cn9jBI,dD05j6bbkpZ0+rIQZDin,0zORxIPQbQGjxy39LJvT,k0DjHFgtSVGcDal7dcjD,m2CIb3vJw2HOtvLSUONE,jqC8gTBNz3CRN/yuMR/d,Repmak1AQd/7HBUqLxmN,rxskj3lJUTLbSIDNrZpW}	{}
sAxdggjzUR7+K6sSxnyU	smash	\N	2018-04-23 15:50:50	{x0FsrcHBTwjDiw22O8p4,DgPPV/MJrDnBpe0QMcoU,e3SHICDe7TDzQzURNPiQ,Lkf1UrbxpXTNzi9bnnah,9vodf2AtYjTibg7COroK,fjfkG4/yYYsSJHiXP/N1,XHaAvyRuw75gKiM6K1ij,WaiQELicPhTvbflzewMs,0yJOH5Nus2kocgyL9YnN,a6VuZA5WgH4sShur281y,OUQyemEpIRIuy4KC/g4N,XNJqXHTFjxfB/5HKaa4Y,5tbw9jI5act9yqyRwUye,SCGDGS79CO301PIGsHzn,+QunQOJIIutnBZmWxfYm,NhAoJz+NoVHWmXmjMzKh,/yGPfuwhZGTRgW5c+Eap,3wk5RolzLDEyuA2dn2Lp,cO+4Al22Z4oMjpk0p7Lv,yUCpI5O40AIkk+mGp6JI,+19rMElqncH6cynpKRK2,SuZYprFulCHyPJeRNXZl,m3bd7sQW7+L4kvnenwW/,eYLcbcEJ0O2JkJr/Xddu,TzdYaGWI+iyBobo9nnw0,lywM0t49YsLQYAh3K0pb,GSC2bTOiURjDG6QRIf/C,LtLiSIH2xV4teJGaMqMo,8kHwXKzmUKEEuoM+ocvF,9I/O1W4sxc2naKIEPE0K,ok4ts1vE0bVPMsaDQcbw,RpEge1TXuSfVLymPq8BR,fjHYIy5I7WrwkDewm/5r,Q99n7s69verREMB1FRjr,RESvqQnefhAkKpY3nBs6,UfOY4Em/+WN1JRsKQCB4,CuqopwBVujva8niVY2e4,gY3S0p0SdJz5pB39RGc+,xV8gi1v1aNt1nUuGGX5E,ygZHcPeys79WKAj8yAH8,mcXI3Zek593mkhoyqAu5,egnslTcmk8lCHOx0HYeX,qlRSTVJeAZKennOmnRIE,ohlVCLGOsb0UTLlQB8D6,egjvugGSd2FQ6G98KZRx,yhUe7vkwD3ToTa9JDjFd,cDSw4FwwL254QukEOeRz,6MlertoPApBryPOpAO10,f2e6tDbswQdJGA/f61Mn,/eQAWK2DPbFzv2ogtkA2,DnGcg4/GO8yE9MVy41j3,DfMZbqkV5Od8JzjaD4lT,BIFMP+7GlnHn9oSU/FtC,q6Pvbo764XUnAATyqcqp,rfGkjpcZtG2/TsruQ/PV,4qZuKxKn29XGlEtVKK8G,fKkmjqKepUa9gR3Eu7Fa,f9X3wDbHQXGYcv3GezKp,vrYP/lV1KOr6rkUHp05b,Fislm00k3IFHwhPwQmn0,wGvOwAJfzN7iqewHNQN1,anNdZYr3I3mDOVHJgjQH,roXW54IwUca8vtP0Xe3f,bwPJOHWc8SFh27JAKu0F,Ky/l7cVCSsik8WvaDk/L,LQbOu/abp8HBRy/uJQSo,mjmOYsEO80qztYQS8F78,RgehqDCDE+teH5uA8VoQ,tiIwNPn2qH9ucjbqqiD1,WD7Z7l7uf0qr34YFm+m9,NWvDOY0Ou0jKGxq01Lou,RX/Gzoe96IKoT+f+/Jf9,+JQkPiUjSnZFsY/l2pbJ,rkfR3k2TJRm7ykk9AKja,pVMHs3h/2MkmILyn8q7e,tBJfZvxcq4nSgeZq4z1B,rcPZhr4ZmnW6gZA9SK0V,6JWmIBPYt6SQR/0tGsUS,s0OCSeVeTAq+a99qeZbN,yc0QweJCsrQmWx0FVA0o,ruGqo1YvfMY0mCEtByqK,sO6Hri2OUyFWg6eQP4Nt,FdeQovOCBNsHYmspMRm0,XE6HNTivgPk9rmrOSeHE,86LPcNUa5jUYxnyY7d8Y,3DQ4lrsU4xVK166Exjqp,stuzYZrSttzzxdQ8nEkb,Gyc2SacZzsuSNZrkjNNs,wRBethSXkgpZDqSUDwam,2J622zIVp4Duf7zQTVlA,y0LpflTMt+RJ2Z0eZFOD,fViKGIb500qNwPJx8MTV,bJCw8kSWDsS9YBU+bSE8,wPXbAbSisHpGkT94gvz/,8sV9ODdwjqOFRkC9E12c,rMZsfcUXAZxvYTJQM0dn,mqeEhHPz5EtZvtCc4Kfn,ezbTcyb44/DQS1ppDUuT,sUyrp6rh99I556UvNHLp,+QXDStr/JAfS4n5iHKgy,yRKbDnEu45WsIVseZT/n,Z5o48F7P85BbTevnaKTK,NdKmUoYFLLyRV0D1fWWX,NFisB3UoCj36iMVjGEbQ,7FgJQqqrEPHyBxUk3UZa,Svk0+WCWBpIsDNIrx2Sx,Nkg5twLp1pVhtlhglX/f,LhJgVwT7TVYCD/hI7YWD,0gIFJ5o25Xl5MMIHs57A,HbV24DsEaJVj5uOg6Esb,S7yYKIaqqQwTBGNl9BZi,mj6K3o9mxS4srCAuITSe,gskVN9rMOoJcv/Vu5Lnm,vzSeRfj+c4b/C1JVRviE,HS6p+FeDoX8Zqenhm9jj,HFjcrEHaeLJaMQKlC6Rf,BgjkR+09I6Xe48GxYVp7,CiIyB6c2Ev4VsFfPuMCg,RHBamBozYqPWL0fAXHNR,OwjKvnbFO6G+5GzKPrPA,xQbhjG6ehoYZl4X4oqZg,PWoHN/H40WADV1wGib9j,XqCi/K4f4RAm6zuaeqKd,0F0ihcNe6DOo0vWUBhxB,7kLxfgppSteCcnfscbkV}	{}
kMjFmLjttJpQS3rzutBf	funny	\N	2018-04-23 15:50:50	{gVZdHPaBRJi73arX1b9P,cvr2IdbMl0phLUObT63j,ukcP4LK/hXMVsO/Zbe0c,tTcc9ePko5wRpBlpLMSa,VOxHnUgY3XNAgWgpqMLk,FotVOb/61xdCaDkdsmLk,KBQwpt7NHIpMGYKUd9ip,4JOFMRy9xrJrYn+1Tx5/,YcAEjNT9a/J7CvzH8kSa,1ljZniOqsLSYnSKmiZBP,qlmPIGJQZ1F6xVqkEpqd,XWYotYa9W1/Jzzq3h0MJ,DSGsXUfbnYR0i51pfW0M,5scpCNOru3HOcKnLxuyo,mYnZlng2ByJSw7PtMRgA,mX9YeQNaAPwTicSFtkjj,XRYZNzoMRPyAULjomykQ,fEa+e2pIqkh8eGslDK5p,8rKoUYVwEdQXnZHIC6Bm,TmoVOpzhHKBFK2nBjTts,AftL4RsJXfFJu7xgL76j,eNZIxvo4iQrW+ffm9gDh,Aqr9yN2LvoYQUCv5KUbV,TdUeOvctE6l+NTeqa+R1,hiMupUT6P4eQFI0JEJ/O,DjC6oXH8UiidBIZhtIFO,EQSsTKgGGWAdzTJxmV5l,tFlAQxOwubnt5UrQTvOK,RWMSEKGeUuXTJefsyWWj,i5u1Yei68/sYmiRZ+68V,rZcfZO7SJjxytMQ9Hadz,OM8k/ngM5gBYRdYLWTZZ,LWR1x0QH0KCCRByiqdTv,6985YbcH/TdV67rR7l6C,isWy+Eb6sI9FpT2LfxJm,zrlOkV9GaNoCoSM2vrt3,ZucfFYSkLUclJfdIf3/0,tv8bGkBRxCj8kOaoBQvZ,RxJKG5QQ+lmmPVDZCVeI,n1iooO80V3cpXY3GdP6B,nVzj97kx3EWbZo0yxSHK,ehUiOH7VeCohMgRxkEhU,BzGn0rDTddjRXs/S7eo3,EAZnNtKDjVentYd8pF5N,lsZlUyLQe8CsSJ2TMqlg,am39DRZpaBph8jvxAdKa,QvFvHjTfGv02PX5xyHeX,AQDxpjW0VzP3E/q2V9fX,nV44NCz3m+yZSz31qJEc,HtKH0vpWGetGwONjW267,P6Bjjd5PM2p5DiM93YL2,1ZSH/hVMjkjcBLdGnEfL,8bSqKVPbfl/H3z6TTdEW,D7TmbpFH2lvkeOl85bT3,TBFmC4p+6ix8r8GKMdeT,prZfgCN1dbQsT7kyEKHi,3Dc6tfG++oL2yzB59LQK,ixIL9Mjkg5pXMoJKWxv0,q4TZx3iGQVjwQXOZwlyS,MLC4hy5mlemw/LoQkOmS,7SL/APVlsuQ494dvrPPf,uStGrI+zh7bym1XGvdqk,9SsdYWwUGS21HmQ/n/gB,CNOJVDQssAPx0AVF2jzE,Qd4C22kLl8GTyZ+9phpr,21h+cjPpXcXc1v6HOGjw,RFu3M1MR0kacskgGt+Qr,89YbmDH/4aF5tjrDBoOJ,+MS/Z8XsV8zZY5T0tvzt,J03dMvZuxzoNaHurJTGq,GyVCSnHbEUcXONqTqVUu,+uRun32Oa5K6lm86WRnC,CaVQI50oxBu3ruOEUjZ+,zY2W8cT4YcK6gKr5XZVs,VY8YBPEW7iPFoPKTXAlU,XzEgzA9XSDHEFPXeQP5S,DKhKqoQRCnXgC81kVl7U,+DCzKLhlkV5tryKQeNso,VwAtT7MapWZzqGj2kXum,q89s8KJtdlVY1WmqSVuh,QmFhxXyLVjplLcqjLf1a,TD6JB4FibYzRwVpxJ6t7,iMrlku9LPSHTiyFsaPsL,U9i6DnAyJKxtPWXtcpk8,58w/wDxp+DFB6vKIGE6h,q+QmXZu9AZpJc7ohIAH/,90zUckMJe+YTw3fGz5kx,ibGN/GezgXhusXQyTTXa,P/1eOG8HVgnh7AeMmcnz,W+dlNnaUdIgwERfmyFhc,ha4YK+quXGYJ90HAgTQ3,T5q73CPMEjI4DcybkfNs,QrkbOzE0t1UpvQLjRH86,YCQqMssekcuTP/ncKgFm,iSEkICHj8DCiiAODXwnB,HUHLiv07UIDyliZjJHLQ,wEMEMwwvWVUZCJEzJtrj,Jl5Gym7IJs/tKHEOE6GZ,uBIVh2G2keoyr9iNCb+2,9M0e72YdxuxS/CcGa3pZ,TwExszu8ov5jGZKz4a9c,GNTogNbb7UrbhdOHeWwl,aG2t3HVCwHi8zymfl0gQ,AWKND0GmWq4ngcklpVxL,U7d+21awLvjgCKjh5VHN,f9DBB0PMbPfwd8zeDl73,yY2I+05rTjC9R/mAq0J4,SpCKX/0pN87QvkupBy5C,Q4UQ+K91TM6c1bvYOsMR,ACMZkkP+aBuAPhxyZ+87,QQZlI/VKzeVrrM5luDnl,wXfOlnP6BhdlRY6HCF07,e0BZg9y+kU06slKIdF6D,adeI4odOY2eWcYf3eAa5,Cgl4MYSK3zKLiX0cJBw5,quxiXHb8wiXdKDpfue9W,4J+f/pGx7ubWqymQelNP,AIwxwY12JYl4q0jQmGP7,UcsDRx5raaCQ0JKUzTNC,PiFRNGrOz0Acf3kLOxlZ,lO+4UpywKjS9Rs5HsXiZ,P0V8/8x56njx3ZPDFRjN,YRCbxMF+YTNi+UCcxbQq,HZfDxlqBEM7MVbos5p9B,SBr4jUAMxwayu85nUf/L,cJPX+sh1T1Y/E8ZtYCyT,hWPF7M6aG2J0zYJj7OvM,V47zfWdVqdPjOckBhWif,IgRYfpHgESQwOm3W54Nq}	{}
rc+ccdAK8F4ROpIC299B	cosplay	\N	2018-04-23 15:50:50	{bi9VHdP6KMs8+RFozTQY,Sl42mZLa4n4EMk7+L3f9,qQbSXQmkkICOzwVuhpW4,AaBlc3dX4RAbRBgUyB7m,yJ7fFW8d6yut1oeXl65b,xYhzsxreiBnhRxOvV7Gc,gejXPQq1U1vAIJ9NPQtT,RDzYY6ByTjw3Ng1YY60Q,EWt49IKaaO4xHAkHzUvz,6EWsfe9/o4HhEvk4Y2I1,qleGd3e/wx3dV1KGgVTc,CZzAONes1q7YvYR3kWDg,MGSYx5BTU2tIoH6hVNc6,BrqaJVLtgb6oE3M3JSTV,2d/RkRUsh0LMqscwgzT3,QiHLTiquMTYBT1DcPFEi,J6pSmbhrlhDD1rv1t3qz,Usvqw82pW+0dL3V38Tva,eHbx8bOy9uzxG/UfQU+9,v+CRtJICl6JFXtyWB9w8,Ew2h3I5JsuC+OINUiaL0,nw6Qs2znM1lqAmY4VUcL,mvGA82o2go3rEQxYpy+2,cujmqjUPMjOeGqM4o1NW,Ca5sC0s6brgrZw5+af81,8lpqKYpcai2pxFa85MQb,00gPgchm6nml6J+KznmT,u3saLpvfE6mS7xNhQrGb,D/pmz0t41p0DhxAO7Eg+,BxPggWTjxabGzttrQFYv,03R+/W7jJSW1f55koRze,A4xoScnSCsJi6F1Y/tUi,BTLz0B2MDfq+WydSu4Cz,yrvT5VjRPa+RRSKxnVIO,cBsS9l4VTFg6wzCHtb7/,5KaQpjVRv1oRog3YSreY,xSJqyBy1KrABS2/qPoso,eRxtoWKJOEx8ZAVTekp9,PoVnWrTqybzWV/1B3DeK,CD1Xp9ZBx+mOTouhn/Mj,H+2748Ephz79l/6oTa/7,S5vbiZf3/NJ3QFwXVNnR,Ba8V08FD68LGex1iBNLf,UxY9WO6tn0Q9RgMAiTNX,bJt/BVh27m3n1BrENtPB,OQqNzwinZXyVwsr3k1NP,KJeOY43n2JFVf7cEejvt,CwFv6/IZokqgesb0Pil8,/detet5MSuuEB0IHb/8j,Bkpx/Xpu1daTnt4JH0hL,1KSh8cZ3T7YyaecOCReo,IObPK/qdIwGRj/YF8OGm,64eRZ8su7iehh3RrkiRU,zdVfcjtTdqgGm6KiHtrI,F8B14s7ULzXMeNJen3c8,z4WT4Uk/RgV258cxv3jT,zVbG96Rw4t1HLMB2dw6R,ZmiU0YhSYfq6+ieQqZYv,xhqbOsuqApatQfr2ELdq,DsiyuoUHfo/g9eGd5WpG,GL+cIWJjkmNDCIDUgy+K,z49NwOEjbsGiyGtZWnM7,TUzDNqpfERuxkWngZJ/d,o21Ct3f44Pq+zOjU86yM,4uONNdA/6CCejwE727LL,tGC+fb0USYpbQx9jl2HX,gwxnV9hL9yhY2IJH77RY,SFYNLMoNQfd4GSH4hyXQ,Prqg2eWZQ65VjIIk3yje,0mFZi/pWRWxHYZhfvuj3,cj0sWgzk0N/jVQ5UyN2L,ctXcZ04xwdEVyb7vTQey,eZE9wVxCuoP8OaNtVkRt,8FDdXcBg2To7YwBrvmV0,x4oEGoj03tPFD4jc69MS,uyxcTPyJRLPSd32bOnzT,u8PIl9K2Ga0pCydIihpj,KT4WSvddbY6w0dbYkIJT,cepjIsMLZ/Y+Z6UsvntO,B18YDi8yiZsrcE2frUBo,VNAeQecyIRUMqcKEn56G,Bxh5QzhCa9xQ7XKTwU2E,E/0pxpc+e/cwB1PDkA39,TXvB/pWCXkK81HmPn4G+,psGp2K5JhBhpmYhVwQzb,xSRfNSU1vHNtf+N5H7ZB,hnWUbZxs7KhQ1OmpDInQ,yacv8qgL0twqPXR6VH1q,A7/HzTquDsX4cDOocr7+,H40NzlV8382l8a/TaNsT,7hnVyv+hLvjtSRCotDM3,g6H1P9uygZnlQwD2qYrM,Ftvl3NDMqDeiw6s/RoX5,01XltaJzB4MF8cy93QR+,b87tFkpI6Vz0VSQ33qWN,IqjwysjY8xccH5SBjblc,qIQaqNQHpToc0o48er8D,EzqiCcueyg1BcaNALEna,OCXrjWxV4nDpLUN8vJk+,CO/U5Ojyyu/nK/o+E6so,PWL3hLl+65Lw3BMWwKeC,jtxsyY+vGePR7oF2ucmP,lwd9HURmG8BPwENt9yCf,iuQg+aR3J8mH+siYAAkt,mjEpoe76b6YC0fXeVF7H,QhVeeaIDEPOziCFAFQ2r,yWZEvZB84LnSsmuIZkYd,w+SbvS8doYAtCizEiVJJ,KWifaIt4MkRt1CZUl8rI,MOAlQ/MV/H0mgBkKZD8W,WHoKhDzb/cbpRZEwLp9g,g4iK9X3hOgEx25hH9XQn,d5eTxc7A9tkMCy0vBjkz,RqeJ0/ijfiIxbCNnGeor,sCn92PaSNKk34mvgANkB,EtLNok/UoVKeX3acRRAF,frHBGMExVfQm7h2bflpL,zzEcF6RXoOfbdMLFVkBN,9W5pPgbs89cbF8+6ToMd,O+Wm1tLwjFMEPDbEtbPy}	{}
3KOaA2+6IjmFPfm4ChIJ	microsoft	\N	2018-04-23 15:50:50	{QEetYFM9OKMVoHzyTXwF,hQGCJLr179LGjix0Np1L,IIykoRvNZMzH+hSLY+5p,tSu/nwFElVH3RfLG+j/7,NwiIO8rbnHchDtB9lMkL,JFGjR+Vw2xJfbweU2tmX,JLtR13lwv3V4ye12v5pe,VIYcBJNRp4TXD+hBWXkg,PjGnCx5tBPe4wKbX8T8H,UmrqVxNpyrJu7BqMF/W8,rezHMfDVslYaAD6iD5sI,PJKFZznkqaC/Ubj5nZos,1xeB7XgJ158mIbQltCmR,GJoElRheya/bw+IViX3S,uGgbNCa18MXYT3423jys,kLZZcaSLdnKLHCwMNG0s,77Md7NZt9FRF0Sh7TSOd,MK/1T/RT5wsoLRdRlxzr,/Brj0rFMMESlF76B6GKU,cleyhoS6cYhMc6Ndi7Dc,cxIO90arIyOo5CVh5N4p,qtNhYr2LuCTV5z572iW7,H0m0Yg2+nPcBGZ5W3bRY,BhZWv5QjhiDIlEqz90eH,+3Lor3ceoicDnKWBJHks,meCOLulbg/wImdp33SVK,hiErLS5sRYCodTCnvFKp,1Qa8CWhmeuNVYRp5irOQ,vdyOXkydoJi0/y+pp7yT,i1HibY0XbOcnhqrt6O0K,KSue/RLhmxSXKkTREl04,A3JCZifpYKa7dRCieU0w,OdOe2DgNQPLUYvQ4vSjW,/BXTTD93A+Sjen9UUJxl,uBVWtQ+s/qIycn+Z6/lv,PGbsKOqfuUnpTBz20m5/,nLunMCqu09b/uuvLsitv,NXTo5VQzJmmD4ki01sZM,92IL6c2vEZU0ah9bbHlK,mYIdqV3PMI7Fg93T4cVU,FaLsWSqlBkGO4TFIWsPO,KMUY+ewH8hrlztY7xvAA,bKz0rToxb32upWpnMT/F,K8aNtz2i9EWJ7295IaCl,F+M3ckBq81eY3LO1TDQN,OPPLZncxPm4hqP6amUJS,FfugyRtQlBIjTEcDXesI,VlFuXhApRDF9Glr0SgV+,i5d7pPW1LS7sdZ74DkUN,M+K0G7oZ8vr7opo1DKr2,BVQ7k3AlMbtl0T2G0AKZ,LJzpNxmFToD98u6Z6xU7,YcR7KuKznRYVzoUSlf9j,VoocU7K4IIGdjwHX1GBb,y+u3kxvACeuZpXxaGykQ,sB3xz25huMUHvVkxJfFr,JEgL2imSqX22d9C4XYZS,6CGZi/F7QX4TnhHl0x8z,dswnDRHd9p8Lw+/FxGeu,n8SltPgyMiQS5zSp7FyN,xSewgsPTXMTfWxHqEUgG,EOOZRLS4tWi/uWkGy0FH,fLLo2Xhjm59mUFZChWxr,NL/bjsm7XRmapQMK3X+4,CX8/aTYNlL08n06iQ2q8,Z3HsHnW8omnA8I3oFCqr,UGOa01kN6fL7PwZ+w8MA,1coUQpZ2u+lX5PgciqYB,pK+WXtDtjsCZvHLcDfDU,JWrUbIHsjHv6hFGTinEb,mTXrswnWZVweyQVwYs1F,K18Le7hA7MWnJgj1julw,cu0bEE4XZ2/Opx6Zz0WY,LbD3G0HogysW4FFKvcpK,KKPWa26cQzqp2ayUSsBk,A/py4Ru8PaDR0MzuRzor,93I1/qnKAFqO8oSp65sn,3zd5GrvQ2zJ1zD+pg3Qc,uSSBP23Ni14w9q3wZhGk,XAPwAJSOqjK1ep6EE3Z9,Y0WOaAWJtkYDeD+4B44S,gpHLhe42rm3DwPN7IpEN,yFNfHZ9cnJnu2BZxKyLe,M47lr6TKu2bJWc/G82tN,apU/nSewBT/zqVVM1slU,z3VyZeOwzKB1cNHHlinA,P9ISNBkaGHExlhNJ73fK,14Zf77gVmGCZLLw402E7,X+BvZol0rqVPnLtjWrM9,5VMsPbiv2uEoEzduNzwS,HD/z96APNCD9Un30x5f8,XozNQA9BxeXbYFEYuXDe,DDt2Wax1i+e8LI6J6qG+,5VHL9HiPVhTEMfxipqDK,ULiFoNm7y1uyxy1S+hrh,tkHnPX7O16E4dm4WSK7g,UhcM7SSBaKPmTZiUzFOq,H5e0oyA5Ko2s4BlulXhJ,KY5MDjPG2LZRJR5TBf3d,ql++m4ohcmvgMMNAe24q,q6VtxCvxpo1GUBSYuymC,dK/tGRJQmY6QUAMlojxW,bpgfWBgVNn5klCVON9pA,l0hY2CLAv5Tb6iQO5ax5,F1DHRj5EY+5cc7bj5plN,+e9kDZhv1u0vAxgQLJ8n,36bN33YRXfCZvum9Ag0l,GG6vPp9gRmI5a5b/knfn,29g5wD7QAOv87TUZZb+a,a7fkCIgBHaVQQ0Y466cX,GcujcKmVZvmdPXAshCx2,z41NHYjA3vD3W9VZS60+,A6OLRYP9i5iy+Z9+VCl/,cNvO5qkcO0aSFBx5BHb2,9Px9MWo+DdyOxuULGHwj}	{}
XklfmXtmNz7WRzaFwJPY	video	\N	2018-04-23 15:50:50	{yA6QiAuO3otZBvREuOHt,I8qUBargTAHQGCVh6E3F,xpU9G0wF8V1LUctwGFom,HNyASO/PxL5NUVx/+Ath,oowtKU4Qpr4XWHZGhv6g,punG8/7liCkzoh0fli66,LQ2etiLN+WvuUIPMwsLX,bB4+/puWJyYHmbr0yppL,2vYpG4JSNjTLlxBcgf0C,hfHJLUeXYXNLzIu1JdQ5,rL0uaR5tBHLihk1SMfFc,lFfX31u1Alx9fNYYCspA,jgmu2AQXqR1vI2jkeTBT,NGhn0TAgkZTLvM07bAJV,95xJJqqnEzNt0vXen2ab,MiQXG1PcHvTEoKVoLKQd,lOLYo/vj0ogFXGmlwvQr,quX+7G28sIYb96O+vdwr,lBhWlK6pYMfzc0qOSlp0,k+YrbMoeLkUsVhOqO/qw,cNJ7RVNIrwbt8ebpSufj,GQZWn/vE/3NZyufgUhJc,W3afwZu376Sp0o/+D2VG,xgd3TcOfcytnmZesLssg,gdeyz/KXufnXgQyBgLr0,hQiim9SZXf3A53sKVV7s,0vEJ0UT14/Y5IY60zjtd,FrowV8nRkYZ7zBA/n+jq,Whm5Oj0OprzyNwRODvE7,4nAJBvGpkP1rmuiBxSh2,G20bWvM2iy8dOTvVkkBa,aCJe2Ri2pr3pdSR/uydf,a5HoudDrpJiLCF+ge0iu,AENbpHdWlJdqZWzqo0uB,FiI/xF8+5Bpiehjm3bh8,jOdNZiyhJ5wW3tM87mkh,vmZY2GwRH61C3kHtz/sF,xvBK9kXO2v/3+ft9Hl3J,7OtMcnjAQK2p8eWsREjv,a4I8N5jxumrCG/YEdhb8,qERF+iMWc4Zni/DvlgHs,ZuQi7bSYATjjgP/wNzi0,G3RUuIn+TJ6W3svo4gYo,DB93bWP1qLAsrzCHcotd,xjuQ+e1FHtsLYSHA9SFM,CsY/Mmf/0JLD/pYTgPHe,HwVSYJBkAfZdVsmD/SQb,872n/H8xMSNaIPM/X4dc,Yft+1nBpSySIc73d2p2C,XOzKy+VvtdU3gL5KAjEk,OHNdWHWMvFIFSLqf2yAr,q5WwNC6CLdIgdW8QD3P7,Y8ZRRstSseJATFuX+5zP,GvvMIAfZ9PqudNPHxfFk,VXKTIF4ew/XhYBYAzkAb,OxGArYprJJ+u1/bDunAS,D64gLC70S2tN/7X2IRUi,0pKLcMQVT6iuR3dyo9Hm,mVOKwyWAxy4Ujo4VIIAO,Ia7oTqulU/m60K+1G2RY,9TS5+K9XxkL4oxsWgAqb,pyh2UyZ0x5oOvgu776E6,vfbsdY1OUeqXVHbZJ24X,0mcQvI68kQOiF/Vhc0u7,jU5DPmWxJ9iznTUHrPQo,IH0kgWaOL9LhS9JZVgW7,T0HtlGN8SeYp946lLuTi,rolcgyePTZ9U1hiSWlF3,ySWO9TfnTy5tVY7AMyt6,Sse4zHb3gSTHECVWmntg,H5OQb6d+4Yb5lW7hvSEh,UskYsA2kR0Zt6MOwSYvP,l1Y0FFgw9bncPUFupO9s,pNnpiWcYBIKl2cnKq7lV,Rd+lZtrFkL+bh+8m8pEw,1PENH0H+njMk211TSvYI,bt4P1uJJplA5I3cIU6OO,IHm5pY8mDJ91m2AE/rGa,GORsiJMeKdwGUPkThqXC,hns3N+LwqXCT9DssGuHO,bx0GzyxvT7WdE0wBhvLT,QjwPhrpfhxzHF21aHCSU,oFjT7NBUxsCoWGd6uAvA,+EEQR0tXSKuhneb/PkKh,7dL4QpILy6/cSzZlDSG+,5LJ1c/v13h9M46OtH6i2,beXtkC9fjfnzv6xQXVp6,0jQAobUMLEk4tf/OilZQ,bvQ9u1+AweLtB6ODd/nT,a5TwSAlS5RIAX7z5UsYj,s++RbWknl4HbUu5i32ds,Qejv4KvPxeo1U88CPhNl,KwAMWtT3I3x9w9dSCxPC,5Tu7qqDzpWuiWujwxBac,KRzy5SbcLagHmXKE8lT1,H/1idzGK7Lzs29/ARkcF,YpLMxctTzhq3V0afc9fg,g2Ujh/m9l7++cDmns+eZ,7Dv0HZ9ZMakLQgoiS3X+,xbDXhTWOkp9gTpj93Fdc,NSY4GtB3XY68GNrfT9q/,6cmmRYfiRseNMQ3vHEvV,WZkalwao6lsC6czoGFt5,ZfKuumpajTqDQT2WCdIN,g6RuHRQYgh10DOXLKdmo,oCqFxpiVvQOIDhs4ShcW,A9/cuZ9/YldLoFshtkOo,o19Gs5fmaymXgt4wB/cB,OwTUlNAABTpX2zouZEh3,b33dsWnYQn9TLXQB1WBm,ZvLB0mJNVsVIeeU0ZcRs,fZkC24gjAXhqRB7ksJxc,vnLyKTwaqNs7pXBEl1uP,SMGMkoeJgqG5PmfEm5uK,BpXLBwQ5sNXSdjj0LMAG,dfupYyye/Cp4QvIvkNoC,/KrwvhgupA4SRUPEHRDe,RzC4VLZ/fm0JG1QWrJXj,EpRk6ed8yUyc/T2MRQ1E,S8SG8EEN/ozSamiMSH+p,zPXCjJgVZitg87Y/tYxr,ybctBVHA3JnHlm28jgHl,6jWvmkVsIFJgMpzGxefM,fdeOJGuI7GqOJSrvJzND,vskFxi+tpEyK2bXyTkiB,kw3U1qMff2QVufKtHCKn,Jq83nv6BQWaQLwTYr6cf,Y87pWU+dufRwYmBk/TDk}	{}
ljr+mdhFYpVziaRs0plq	tech	\N	2018-04-23 15:50:50	{V5PONSP9Ljf5MaEz3PH8,5hv+TgghWCjy/NFEHrnE,OQoFerCp/TW8gUsLvLbz,3dfIEUunilA6f32Wl/tT,ketZXCkucf11zNgY6IqR,5rsMAKEdf/SJfDw9nd1Y,6tjTvcrJw1zhTra4LeUP,1MTro/Ta64P/yfQ38rLU,2o1zgQ0BPz1n8gj64gLc,wonsMyS0Pu8YYag69NkT,pnwpXFmhviqQWiarnV7V,K9lkv+Q46PJ8KYgKpfYZ,SiQn9UPd7DhB0YsQBUrF,uwvLAE1foAPnX8SJHw2+,DnIhF21FWxx6dEqN19Ow,WQgCMfupy66WMQ2GaFmS,AP92xxfVYtt3G5vpb2km,66n80Nypxd4ZDF7W1OjJ,3qNCLs0R/PQaIKTPlegI,M+VlKOukNuwdv+/Rw7qP,8XHCX7KYar68LkfQA422,VLWzLNNP+X9xQXIBtHMm,5f9r5WCeq+cW3fnGbJdc,FjWnB6a4Jna/stRrNUVS,4UYVOySufCw31Q03IY9l,iE/EW/A49HBWo2dz9QhA,hEhXN49n8Murw1GvFRrr,uLizRMfKJ5wk0vzRLyHk,4HNPHIX8hOep08putKE+,ksMSd3BKZer1/VVJSpPs,7NgM4BUNIqbrVEGbj2Sv,CCTl4XjdeXkzZj140072,PoHee7it9+rxBeEws1wn,5oaD7bFUulXkrG8g+ODn,TU6ZyAuNOwHShLiTbqD6,Bio6LQQ52IZWUxPjv9dP,1KWPKYDzASCRdcreLhHg,9LrSbnaaTz1gvsnK1zeo,ohObNXawTzsrRYLaSbYP,dnS5C05I9bNU/yXLmNVG,s5QTR6GNm5MfLRljndBy,Rv/Nd6BJQbMjPi1GAt4R,E0w6M5ktSfh0I5F1/Ls3,xAhlg2t+c56VzC1P2eYy,CWVzjZC2Ab8JpfdmAx1Y,OhXElES/8PFvCUSdC/Zm,sLJ887kkeQ3mtsrbKwnW,S8/eH5TbrFXTqru6KkwH,mAHAvXmCfJXb0qFNFqPz,66xgF645AOrrW72URtvm,mcenfFQvfe6+HtlDi6nO,QfCoS5cti0k8EyXv5y2m,PXd+Ed78AFe16snxsEZu,Qb6DXprebPdRCDlLDNq7,wsBXfPlDtLW6V2QR2TX4,ZjpbWSfztAn05wX/NBg2,teq6kgdUE7+P8GEorHwJ,YxsVcpcjumQiZ9YjFG6C,iLK6rVguzv4OoQSaLlM/,6VvTJt2LNHJWETgXZpjw,F4fQpYmJmDbdCiPHp64p,p9LgWfYThlqZympx/Ga+,gYOS6PpJ06RobWXHGUS6,e07PU1VFZ7BTOJgBu2ON,DYPKg48U8plIFgB3Txyr,CLjHJKeQqoWzGE6xAG50,+jsBP+8tq55x8uCWFRfS,JOz9+pRfD5YFP8VAC+xD,k6XPpx1lnTOXRqMlofHI,niR4GDi52A3sewnNlUYr,B7Oz4ffXUK7TyZAqr9MO,ZJkNyyPAKKLlYzIgkSX8,HNA0NfkpUaddB7jM5wgb,hjEftvYaKpMYx/FzQtyH,yob82uQtzbfzeIp7VZEq,03PVts0FuuUKu5Jb7NJN,lrmpz17P4P4Xh63mtrxC,hsMf0v5XPdhiKRC2+hIn,nGtQTxYUsptjT7KRXa5v,BONd+wxQ7yfhIa2tlq0n,iko5UD5VD2r6Y+vJJUe0,nQZMH44xsmHnT2vrNK2N,irg8OzmlOzRvwWh0FowE,6BanJCYEcK+VNt+ziuik,BRjHCmzl6SjQguu6OJcx,JRACI+7yc+vMbktdgDNV,YnAJyFiQOTvo2lWg5UWq,RuJ9GFrkkpPK/G8+RQ+8,X6qUTsOM/V7+JWCTCJnX,HooGajsaO0ykx1bUbVBg,vmoEK1zlUdJvGbCLaPJ4,FTCt8w8rsKcLtPHRW2gF,8e/DyM8Hu+nwjqAA2m5B,0v5LIMuXt8Kg5C1niqpT,By8aFUynwEV0QiXV7ry9,koT10A2q0ZWxYQa3SBp/,Sz4zmSk/twLDkEEeR576,unnuTF2yO8mnASnVfTVy,KlTAQ5/NS+4NefLX8FNs,J5tWBgt91+QT9/j9eKgQ,VTruii24aaQ9PKXLcn6Q,cztO0HE5QMeEob9d/f9j,S+r9HODtlRfPRn82uAUH,8jlu+E8z0CtdvkkCY/E9,XT+G4X5Eex+AU9MjAzCF,svxofOkzPlJ7LrsK9DyX,1x8t9bRJqvAP9UeCULsB,MgAALnrMeX7QzfTuyHGs,T8xtrTnrisW31TskQnnR,CNiU0H+A1i98uprx1zoB,Kbmd4uxwaA7ZLcOp9OeN,A76iMBmKUTPQysFjrpO/,RxDBuSS/1nEXM6e1P1gB,VmqYVaNmOrC5BkO4pEQo,AOPHysHS4x8KWm2Nf5F0}	{}
budgvhf/oqc9FWtiR59c	nottheonion	\N	2018-04-26 18:50:50	{ay+pQlTwW/BkePjLZ4dS,8o7Z4vSJA8AwNZBE+k/e,NMK45mNTTsJnEnILrjqj,bFpnr9Dwp+1AiDjiZBOy,Orpe1P5tcfallIFjNAN9,4WSHD9Evn3RRjW/kbF6K,C2ONnNtqHTOWnTaFDPBM,lejJTxuTJWurimrbZ9ZQ,gRc41uA70ux0haqg0LbM,zK9CnDHoekpT0laF+Wah,oNIAMXlITBJDt+mC2lrY,G64LGfncjb+IKTtOMGH8,ntfnYIwipxqe9UxMMVKU,j0nDCaMkbUvdDEYEJCl0,IayO84+TqPg+3Dt0UrCR,yLU7SuWnJt/IRaHjvAjY,GzgyRMogFBGXF8kE3eMh,DeNWI4zzsTIc6Ey+iKw4,H2whJDBxgKTjkE6EPiyI,6yzcotjhKmXKgZ8Qf/Eq,L2y7uSre3q2tCockggkI,9UEDSbR6rXxdzMl+FTUS,hp4GB4pcGl8d9oEMUd79,gZPPaC1PVUBccVdXOCtw,0y5bywPtNtVHNZZHlB8S,Kg/boDy4oV2jNkmkDfRD,xUYkJKD6nCtOFKP+MJB2,uS7Xvx5BVRWpf1ZZ+XJE,sDIuWGSzW5IT9/eHO7nP,IM8wlu8rSyBWeMY7flsv,Zo29mRtai4R/+Yln3qH8,QDMt4eCRDqmzExbdUQAc,caHmQTtNdW7GenbEkUIO,cowfUk9jZGzxo38SE1EM,joTzJWjqHmRWVN9B02Hq,qRAtUZuPIn6Ze3qQwGUf,BszlR5bSQg+R4GwX+d1s,dOyI0aPtg470Q1lE7+Lo,LyVDTDNzJugvR5NS6TOP,ecVHhk/hV39wlXv5Gbh2,j9DhrpJO74JAzZSivUQv,BKx0N8v5yebPDx3nDyvV,sYsZKcAXy16bl4LdqFQP,P5SsubdBANKXcIUmQj+B,pxxpc4nbYAcoOR2+NfBx,L1S8PkMt7qpC4Sdp4zC+,VGLnpzZvVDRBWJUkkXJY,3qI7pyKcbgTpFih7fjZD,nKXBQBE1ggXosOCmZ2VN,5iVXwW1sOZdiTf2uVdpN,MmCcHVC6yusnlzLNWv1K,AM9n+9SEYjJ797OxqOpJ,2DwqP3sFLZva2/phOHS3,G3FhLIWDVxWoQybr/EAN,IQx2apFgh6LpXIVDmGmj,CZKqkj1+Oz+nF4bI7h9B,yn676hamd78RQQhXJxFI,YNL4I3qUuoAqiP3iH7ks,iXJiokRpVKCEaA79Nya6,uk/CkpybCPjLeHL/MGbe,2CE5gaxVGmGQd77YW06+,4QicQYlgqAG0N0m5YvU+,NpV4E0o5j1FMqY7p8Y0C,PrrmuqJN6ZT6XY8wuykQ,mIVwNMwXxW7aDgBPbDZA,EkN2w+MeLev8m35Jg2vD,SwjB0q/J+LI4nfmdTnbD,9gjCs7lLPsIHQ8t0DL8B,weTQ/fGFjo5xTN07nPjJ,bh/WihA0h0jLMbqGCUSQ,jKBRoww4qEftIUTQmzR8,yCZgn34mWs+XjW2b27cQ,VPL9Stw9HGu52mCgk+zm,bC+WTG1fjinP7Iihlgsf,XqQnJrYxxopnAGgGmQjo,BBu/prdpsEoH8k0xw1mn,r4u+7IZTgQXyFp7ztxBg,BwBnbiDnmQOvXgrYpLx4,eO84ZMpiBKZnoOUk/v62,SN1QzRhPCjbzxd4pxV9/,TlcaeT/HdwLXVOwnBgSt,o1GEQq6DA/GM7BwBkTER,DQxh91JHBdcZEYGSKFQY,+dXpUEnt5cnoUiVX+yGX,07LJSZuW2K+nHH7xz7CM,H2A+vcjZPQG4fP0LFXIF,9o/hpnxsqFOleCbAm3tu,KWmj77WOWQ1Sdp3dJcYz,wsmyR1UzSdKDQCZaWuvl,RJqiWr189mBkTFW/JQ4y,hpj1m+5wszKBTa3MbfOt,7DiJwWlycW3/8fYRWtHq,PPz++9sO8TrxQEghug8/,UAUx6aFwD6hwrke9y40n,uht0dkm1DJfLXz2gwFwK,cVbGW5a2Todam35EHjeU,aOoTn7AJcQk5stYErAZA,3RuBApCvDZhMRkHpOzDM,I25Oimx9wGx2hnOD8/nV,Qe6fV2j6eGbxqkeLAkYK,oSxFAiuuJdm4lwcgyQup,tAeulETDjzWigBlkzCfT,wrSEz1zXb9ejTo/EUwuJ,USFBedQ2H61GoQR8h25T,wwl1N4fJ3iyEo8iG02nU,xVqZ0cF1qKRaF4W1pck9,gy/XzXc2JfpQ08Fzb+Oz,l/sdIiZeTYAcda+Smf1o,ud4eCMQtbN/Um0HbAO2Y,Oy+6/GIIdKUfGNofOvUO,mZAGG2oB8FD3d13uVlE8,9TMNs6r2pzAMPZi8s7VH,xR7UfS4h8Q3Lk14/YE96,BXqaKD9/wBisfS0ymHzJ,TbXtfJ2e2ArtrAAVRliw,J0xPfz2Q5GIjwuO94SRg,J6LgrgQgKOFaP7HFHGHj,B0BguV6qOhSCKKNYsE1U,C/yMOrr/VUjpNIcyshw5,oIJR68h3RmCXR9PrPs9j,/DFHpebSdRkRttyeTNKi,D6nwCxtEaQIoe1iuHwCu,85UOJ82eQX4XJXPrz0QP,r/z1YfbXyxHDz+zlhszW,huFHDQ0m4jp9UMTHp3jX,vXRzM/mZw4tchRfTZCuK,ZPOkp/zPf+wKvypDw+9Y,18KwmgiNtSyueaCMg7k6,ohxfHSXW3SdNGKxQYDU3,QFFTv6kBmPULZnUKZhbp,MTx2eTpx3tBAMq/z6XTL,dSt53kL9b29cdVNQvVhv,iqdmXMsAN7lnuUc/kdv3,QlJTLqwjhP+qh2rg8uFZ,HI7+ftJKEZUUS+FXZPRh}	{}
TMTdMrgBYgxYoTLKWv35	deepthoughts	\N	2017-04-23 15:50:50	{kx1RAaakywaotFPKC7VX,M1B1TaQVONqmXyPYkT2h,zvzXgpVIcj9nEMiVbc/o,KgelwQjB2mRvT/25061R,A8KvLO6mCCOgzJezOP3k,/hY+d5gRu6uEm9RZs0NI,/oYRyusJGd2FOnBtpbZW,hhQPB//8ih8/Zm8gQEiG,ICLeKT3dO0yq8WnHNQ5t,cv31mFpgjUi4CrwDtkWn,gyJvzIqyBP5OGD9lxlGE,e/Z5BVRVpyY7MVrCcy7b,d0VkB8KHFwqndWL18/cP,TWCjyWg2MxYfFvacp6OT,gmoLH0lNmsp1zH06hJKV,bB9B0j0Xr7lb6OJztend,PAgWZ6Ukv+JXxhyi0fWm,TE/ozbzDM5RmK5RT4BW9,UlCnZVUzTXjBT3W1euom,A0PXkhpCE1MdMqIL69IW,P9xd3XK8HBHZSzICn4NR,cfVvue731ABWhfwwgvl0,WPxIMu+PVXezemm4Vw6I,SWjwVGA/5Me/jeigpzLN,anofc3fAkmfeSjbyKbZX,TIXbt6gVtWXYLFsTyD3A,qacq8eQIczCYUH4JMBa4,PO4/JGnlb4/DvpSAB7+s,RW6h7PN8yJyT9G3MJCln,oL/yQIx4sNq4YnIzP9Al,GAEsOkaNOfZ43VU+SYqi,b7SEH/8qti859Aihc2GK,zeQldJes1Iug17givdid,AhucGW36EU489E8uo9Sz,tuwMkQS2xbeMoShyrELJ,cSyhCAnIJbQA6mIGNNbc,2lwFgyNcPzgv912XQ82X,WjKFj5/5coCo0/rHy+uy,iT2gB+p3ukJFjLrXtj5g,GZ/6C6O0Nd2XLR0Af//q,3wR/EMeRZ1k4kdou6Nll,7/m2Zq7crJeQkUOS2djR,8ExwU9xCISNnan4FXeNt,1l7HJO8uU02CYc7lzCvO,hRX9yrsR2rDaw0l7Y0DF,VBefTCLRv2Pltr104uXo,5CfgzI4lngx4xllvdFgU,kJMi0W3ic8oweGoWH6R0,mxd7mcVXXUiImbMwWG5/,07KqS16PBElbotHRE+e7,sF0DvSNeBpuY2FzhsB2F,FOF8DtNuXngOfe3N6Uif,+OMe9eFauDYuSZMFaalH,xER08Vpbbjx0WMJrxjVL,9Dhi6hfOV1HDutDkTksr,/tP4xAf0uf4mv7PQUSTo,IwR7Uh/6RMRaQ4zWyWT3,czsjkvt7Xps4ZtwwajTj,sty0zVyq27pk97NcAXeV,G8/BDHM9GX3xuV4T7X51,sIKxp22SC/5lM0nWBq7O,I+bcA+jAE3j4m8MAbCUu,IbdnaSDplizLak7oKfbw,upOYRh+wgAQ+qO6C71/g,b7IFvLlhfkJs5OTpSoZR,iFjzJSs0uGkg7JfZiOL/,/L9c0L7fG4BqapheHPQa,7ik6MsLAt9RJEEsiOcw+,MaaBamBpEWFh740wiXv6,1PWC/ohDc2H5gWss99Ij,cguDnM20ek+wnKqeaFXu,jP0R+gng++Xq6/lNTIDs,ibT0YpS1zc03Ae17/526,Hh5ybQr+O6LhSDtamfMC,XWD8FfhQ6oOZ6ggGHxLN,HZRXEIRiXucnWskQzzKF,Lxt7IgJkaBrVcASvMIv/,J1biS3NASb3pFxhWK61v,kFKd0gIsMrIX6ONF5tm7,rXNaOAH87HTajDZ0h/FF,RfnTai5x5HPjbYBTasRH,imENEQ67XCsKmFCH1xHG,21yNlg73AVJd02LAZk4v,Vft5ewDclk5EtAmtpVYM,lcpm3USmoWQeObeT2CbS,EMDAfc+JmEzQnlSXTmr0,a7xwzs2EH0jTy3zn1F07,dhdYxCFuGLXD0e4UWoRv,djLX5z1Qm+lQLd3xI3Up,dYG2WwxzGmuqCUjITfwc,0uHtncVjEw913UuVaA7D,laxct35ejWTNFdRtspd7,WZ/Dp89842GDRlx4AcAI,VVSpSfQwaY8Ht46FAzq0,sIZQ0em4Ej21hn5iXIBr,u9bMXX2y1u+hKlMxEv6X,4tSHJbxBzp1QtHP/Gzvx,mcY4xVIIfWOg2JYJY9R6,0N6Ui6rCeFNOC/ZJQXsO,RiLtYxlB5yP/036zskCN,fJgyMp0geyoRPHMa+ke5,H/66ndqCuUYrSnD6dLw2,s86/A+XHULH6davlcsjp,EUJgrxb0iMYuWOTl6hfU,bnX3ZH5VEDFNBqbmMnUz,h5TBBx0v6NjBCGAHsbJb,T2rjxlGgeQrkIzsIymAk,lq+GxD4LzZ6fK/WXa9ui,fMRSbRYOCNJVn2ChOA6w,ItRcikw/HhtN7OjS5pQd,Snii6W6t+YErkaNKMBhi,NHkdmqqo7+3nVvQTuQPP,s+hfJJS7qseqvTzYFuSU,/18Y17ojj30/ZjiCEtft,fnAKr4wm3dSJm49QT/8E,0qedYV2/s/KXqg9tAkMn,M5VUw6AEPfjRFN3TcEaN,Tb95+HbofrmyHdXkLLtb,1cVsqCVHVr2NdJIzpVxz,3HJYcS+doKzg2ynfMUmr,yMSWTG5vYT/cz1EoxB5i,h0HyEKbMGNJmGvxSXQXa,ndz11dDDmiodLr838Fcn,n8S1NKjf0Hrd3Tcl0Qd5,8RIso1hKd6K/Uvue0p76,y2M89K7Hdf3mn1/zChQk,B6wULGEIGNyBqH7+JCk4,x8PLUviGFK9HpJtuQ/zN,4V0yvZN54bC2iNvQFFMp}	{}
\.




--
-- Data for Name: userVote; Type: TABLE DATA; Schema: public; Owner: ismailmellouli
--

COPY public."userVote" (id, post, tag, "user", date, positive) FROM stdin;
\.


--
-- Name: commentVote commentVote_pkey; Type: CONSTRAINT; Schema: public; Owner: ismailmellouli
--

ALTER TABLE ONLY public."commentVote"
    ADD CONSTRAINT "commentVote_pkey" PRIMARY KEY (id);


--
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: ismailmellouli
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: facebook facebook_pkey; Type: CONSTRAINT; Schema: public; Owner: ismailmellouli
--

ALTER TABLE ONLY public.facebook
    ADD CONSTRAINT facebook_pkey PRIMARY KEY (id);


--
-- Name: postReport postReport_pkey; Type: CONSTRAINT; Schema: public; Owner: ismailmellouli
--

ALTER TABLE ONLY public."postReport"
    ADD CONSTRAINT "postReport_pkey" PRIMARY KEY (id);


--
-- Name: postTag postTag_pkey; Type: CONSTRAINT; Schema: public; Owner: ismailmellouli
--

ALTER TABLE ONLY public."postTag"
    ADD CONSTRAINT "postTag_pkey" PRIMARY KEY (id);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: ismailmellouli
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: ismailmellouli
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: twitter twitter_pkey; Type: CONSTRAINT; Schema: public; Owner: ismailmellouli
--

ALTER TABLE ONLY public.twitter
    ADD CONSTRAINT twitter_pkey PRIMARY KEY (id);


--
-- Name: userVote userVote_pkey; Type: CONSTRAINT; Schema: public; Owner: ismailmellouli
--

ALTER TABLE ONLY public."userVote"
    ADD CONSTRAINT "userVote_pkey" PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: ismailmellouli
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

