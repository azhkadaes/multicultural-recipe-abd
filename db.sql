-- Active: 1763450965107@@127.0.0.1@5432@multicultural_recipe

CREATE DATABASE multicultural_recipe
    
CREATE TABLE IF NOT EXISTS public.ingredient_table
(
    ingredient_id integer NOT NULL,
    ingredient_name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT ingredient_table_pkey PRIMARY KEY (ingredient_id)
)

CREATE TABLE IF NOT EXISTS public.recipe_ingredient_table
(
    recipe_ingredient_id integer NOT NULL DEFAULT nextval('recipe_ingredient_table_recipe_ingredient_id_seq'::regclass),
    ingredient_id integer,
    recipe_id integer,
    CONSTRAINT recipe_ingredient_table_pkey PRIMARY KEY (recipe_ingredient_id),
    CONSTRAINT recipe_ingredient_table_ingredient_id_fkey FOREIGN KEY (ingredient_id)
        REFERENCES public.ingredient_table (ingredient_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT recipe_ingredient_table_recipe_id_fkey FOREIGN KEY (recipe_id)
        REFERENCES public.recipe_table (recipe_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)


CREATE TABLE IF NOT EXISTS public.recipe_table
(
    recipe_id integer NOT NULL,
    recipe_name character varying(255) COLLATE pg_catalog."default",
    type_course_id integer,
    type_cuisine_id integer,
    type_diet_id integer,
    CONSTRAINT recipe_table_pkey PRIMARY KEY (recipe_id),
    CONSTRAINT recipe_table_type_course_id_fkey FOREIGN KEY (type_course_id)
        REFERENCES public.type_course_table (type_course_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT recipe_table_type_cuisine_id_fkey FOREIGN KEY (type_cuisine_id)
        REFERENCES public.type_cuisine_table (type_cuisine_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT recipe_table_type_diet_id_fkey FOREIGN KEY (type_diet_id)
        REFERENCES public.type_diet_name (type_diet_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

CREATE TABLE IF NOT EXISTS public.type_course_table
(
    type_course_id integer NOT NULL,
    type_course_name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT type_course_table_pkey PRIMARY KEY (type_course_id)
)

CREATE TABLE IF NOT EXISTS public.type_cuisine_table
(
    type_cuisine_id integer NOT NULL,
    type_cuisine_name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT type_cuisine_table_pkey PRIMARY KEY (type_cuisine_id)
)

CREATE TABLE IF NOT EXISTS public.type_diet_name
(
    type_diet_id integer NOT NULL,
    type_diet_name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT type_diet_name_pkey PRIMARY KEY (type_diet_id)
)

-- INSERT DML
-- 1. Insert into type_course_table
INSERT INTO public.type_course_table (type_course_id, type_course_name)
VALUES (1, 'Main Course');

-- 2. Insert into type_cuisine_table
INSERT INTO public.type_cuisine_table (type_cuisine_id, type_cuisine_name)
VALUES (1, 'Italian');

-- 3. Insert into type_diet_name
INSERT INTO public.type_diet_name (type_diet_id, type_diet_name)
VALUES (1, 'Vegetarian');

-- 4. Insert into ingredient_table
INSERT INTO public.ingredient_table (ingredient_id, ingredient_name)
VALUES (1, 'Tomato');

-- 5. Insert into recipe_table (depends on type_course, type_cuisine, type_diet)
INSERT INTO public.recipe_table (recipe_id, recipe_name, type_course_id, type_cuisine_id, type_diet_id)
VALUES (1, 'Pasta Marinara', 1, 1, 1);

-- 6. Insert into recipe_ingredient_table (depends on recipe and ingredient)
INSERT INTO public.recipe_ingredient_table (ingredient_id, recipe_id)
VALUES (1, 1);