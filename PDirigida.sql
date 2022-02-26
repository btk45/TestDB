--Pregunta 1
select e.first_name as "Nombre",
       e.last_name as "Apellido",
       e.hire_date as "Fecha de contratacion",
       e.salary as "Salario",
       d.department_name as "Departamento",
       j.job_title as "Rol"
from employees e , departments d , jobs j 
where e.salary >= 4500 and e.salary < 15000
      and e.department_id = d.department_id 
      and e.job_id = j.job_id ;

--Pregunta 2
select e.employee_id as "Codigo",
       e.first_name as "Nombre",
       e.last_name as "Apellido",
       c.country_name as "Pais"
from employees e , countries c , departments d , locations l 
where e.job_id = 'FI_ACCOUNT'
      and e.department_id = d.department_id 
      and d.location_id = l.location_id 
      and l.country_id = c.country_id ;

--Pregunta 3
select  *
from employees e , departments d , locations l , countries c 
where (e.department_id = d.department_id 
      and d.location_id = 3200)
      or (e.department_id = d.department_id 
          and d.location_id = l.location_id 
          and l.country_id = c.country_id
          and c.country_id = 'US') ;

--Pregunta 4
select *
from employees e , jobs j , departments d , locations l , countries c 
where e.job_id = j.job_id 
      and (j.job_id = 'SA_MAN' or j.job_id = 'SA_REP')
      and (e.department_id = d.department_id 
           and d.location_id = l.location_id 
           and l.country_id = c.country_id 
           and c.country_id = 'UK');

--Pregunta 5
select e.first_name as "Nombre" ,
       e.last_name as "Apellido"
from employees e , 
     departments d ,
     locations l ,
     countries c ,
     regions r , 
     jobs j 
where e.department_id = d.department_id 
      and d.location_id = l.location_id 
      and l.country_id = c.country_id 
      and c.region_id = r.region_id 
      and r.region_id = 2
      and e.job_id = j.job_id 
      and e.salary < (select avg(e2.salary)
                      from employees e2 
                      where e2.job_id = e.job_id) ;

--Pregunta 6
select r.region_name as "Region",
       c.country_name as "Pais" ,
       (select count(*)
        from employees e ,
             departments d ,
             locations l ,
             countries c2 
        where e.department_id = d.department_id
              and d.location_id = l.location_id
              and l.country_id = c2.country_id
              and c2.country_id = c.country_id)
        as "Cantidad de empleados"
from countries c ,
     regions r 

--Pregunta 7 (sin terminar)
select e.hire_date 
from employees e 
where e.hire_date = (select min (e2.hire_date)
                     from employees e2)

select e.hire_date 
from employees e 
where e.hire_date = (select max (e2.hire_date)
                     from employees e2)

--Pregunta 8
select *
from
(select e.employee_id as "Codigo",
        e.first_name as "Nombre",
        e.last_name as "Apellido",
        (select count(*)
         from employees e2
         where e.employee_id = e2.manager_id) cant_sub
from employees e ) sub
where sub.cant_sub < 8

--Pregunta 9
select 'El empleado ',
       e.first_name ,
       ' ',
       e.last_name ,
       ' ha trabajado por ',
       extract (year from age(current_timestamp, e.hire_date)),
       ' anios',
       extract (month from age(current_timestamp, e.hire_date)),
       ' meses y ',
       extract (day from age(current_timestamp, e.hire_date)),
       ' dias'
from employees e 

--Pregunta 10 (sin terminar)
select e.employee_id as "Codigo",
       e.first_name as "Nombre",
       e.last_name as "Apellido",
       j.job_title as "Rol",
       jh.start_date as "Fecha de inicio",
       jh.end_date as "Fecha de fin"
from employees e ,
     jobs j ,
     job_history jh 
where e.job_id = j.job_id 
      and e.employee_id = jh.employee_id 
      and jh.job_id = j.job_id 


     

--Comandos select de ayuda
select * from departments d 
select * from locations l 
select * from countries c 
select * from employees e 
select * from regions r 
select * from jobs j 
select * from job_history jh 

