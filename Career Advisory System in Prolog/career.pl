% Anubhav Ruhela
% MT20083


start :-
	nl,
	write('This is the "Expert Career Advisory System" specifically made for CS/IT people.'), nl,
	write('Some basic inputs will also be provided from our end regarding various available options.'), nl, nl,
	explain,
	selection.
	
% i have assumed that all the people using this system are grad/postgrad/phd CS/IT students.

explain :-		nl,
				ansi_format([bold,fg(black)], 'BASIC ~w', ['INPUTS := ']),
				nl,nl,
				ansi_format([bold,fg(red)], '1. FOR PSUs ~w', [' := ']),nl,
				write('a. Companies that are owned by the Union Government of India or one of the many state or territorial governments or both are '),
				write('known as PSUs.'),nl,
				write('b. You need to clear highly competitive exams to get yourself a seat at PSU.'),nl,
				write('c. So your grades and entrance exam results are considered in PSUs for selection.'),
				nl,nl,
				ansi_format([bold,fg(blue)], '2. FOR HIGHER ~w', ['STUDIES :=']),nl,
				write('a. You can try for GATE if you want to get admission in a nice Mtech college like IIIT-Delhi :) '),nl,
 				write('b. If you are interested in research you can go for M.S or Phd.'),nl,
				write('c. Grades and Entrance Exam results are considered for Higher Studies.'),nl,nl,
				ansi_format([bold,fg(green)], '3. FOR JOBS ~w', [':=']),nl,
				write('a. If you wish to go for Job then you must have excellent competitive programming skills.'),nl,
				write('b. You must know to work on the trending technologies.'),nl,
				write('c. Grades and Entrances are not considered here.'),nl,
				write('d. Your skills, interests and experience will matter the most when you go for a JOB.'),nl,nl.


selection:-	nl,
			ansi_format([bold,fg(black)], 'What you wish to opt for as your career path ~w', [' := ']),nl,
			write('Make sure to make the choices wisely and truly as advice will be given according to your decisions only !'),
			nl,nl,ansi_format([bold,fg(red)], ' PRESS 1  ~w', [' FOR PSUs ']),nl,
			ansi_format([bold,fg(blue)], ' PRESS 2 ~w', [' FOR HIGHER STUDIES ']),nl,
			ansi_format([bold,fg(green)], ' PRESS 3  ~w', [' FOR JOBS ']),nl,nl,
			read(Select),
			module(Select).

module(1):-	infopsu,
			askpsu(_X),!.

:- discontiguous module/1.

%psu fact base
psu(isro,65).
psu(cil,65).
psu(nielit,70).
psu(barc,65).
psu(ongc,70).
psu(iocl,70).
psu(drdo,70).

%here i have create a two ladder if else type of logic i have created to narrow the results

checkpsu(X):-	between(65,100,X),
				nl,write('You are eligible for all these PSUs : '),nl,
				is_greater(X)
				;is_smaller(X),fail.

checkpsu(X):-	between(0,64,X),nl,
				write('Sorry to say but you are not eligible for PSUs you may check for Higher Studies OR Job options !'),nl,nl.

is_greater(X):-	between(70,100,X),
				psu(Y,_),nl,
				write(Y),nl,fail.

is_smaller(X):-	between(65,69,X),
				Z=65,
				psu(Y,Z),nl,
				write(Y),nl,fail.

askpsu(_Grade):-nl,write(' What is your previous qualification\'\ss grade/percentage (enter out of 100) ? '),nl,
				read(Gradepsu),
				checkpsu(Gradepsu).

infopsu:- 	nl,nl,	
			write('If you wish to know about any PSU opportunities for CS/IT type out its name in lowercase !'),nl,
			read(PSU),nl,
			informationpsu(PSU),!.

informationpsu(isro):-nl,write('There will be a written MCQ exam followed by an interview with a selection ratio of 1:10 .'),nl,nl.

informationpsu(cil):-nl,write('There will be a written MCQ exam followed by an interview with a selection ratio of 1:3 .'),nl,nl.

informationpsu(barc):-nl,write('There will be a written MCQ exam followed by an interview with a selection ratio of 1:20 .'),nl,nl.

informationpsu(ongc):-nl,write('You will get an interview call directly if you have GATE AIR<150 so prepare hard for GATE exam .'),nl,nl.

informationpsu(iocl):-nl,write('You will get an interview call directly if you have GATE AIR<150 so prepare hard for GATE exam .'),nl,nl.

informationpsu(drdo):-nl,write('There will be a subjective written exam followed by an interview .'),nl,nl.

informationpsu(drdo):-nl,write('There will be a subjective written exam followed by an interview .'),nl,nl.

informationpsu(nielit):-nl,write('There will be a written MCQ exam followed by an interview with a selection ratio of 1:5 .'),nl,nl.

informationpsu(others):-nl,write('There are many other government and PSUs exams that sometimes takes CS/IT students and sometimes not'),nl,nl.

informationpsu(_):-nl,write('EITHER this PSU dont take CS/IT students OR information is not available right now .'),nl,nl.


module(2):-	infohs,
			askhs(_P),!.

:- discontiguous module/2.

%higher studies fact base percentages taken keeping in mind recent trends
hs(mba,90).
hs(mtech,85).
hs(me,80).
hs(phd,80).
hs(ms,85).
hs(jrf,85).


infohs:- 	nl,nl,	
			write('If you wish to know about any Higher Studies opportunities for CS/IT type out its name in lowercase !'),nl,
			read(HS),nl,
			informationhs(HS),!.


askhs(_Grade):-	nl,write(' What is your previous qualification\'\ss grade/percentage (enter out of 100) ? '),nl,
				read(Gradehs),
				checkhs(Gradehs).

checkhs(P):-	between(80,100,P),
				nl,write('You are eligible for these Higher Study Opportunities : '),nl,
				is_good(P);
				is_better(P);
				is_best(P)
				,fail.

checkhs(P):-	between(0,79,P),nl,
				write('Sorry to say but you are not eligible for Higher Studies at any place, you may check for Job options ! '),nl,nl.


%here i have tried to make things more complex by switching to a triple ladder if else type to narrow the results

is_best(P):-	between(90,100,P),
				hs(Y,_),nl,
				write(Y),nl,nl,fail.

is_better(P):-	between(85,89,P),
				Q=85,
				hs(Y,Q),nl,
				write(Y),nl,nl,fail.

is_good(P):-	between(80,84,P),
				Q=80,
				hs(Y,Q),nl,
				write(Y),nl,nl,fail.




informationhs(mba):-nl,write('This is a change field opportunity. You have to appear for CAT and get atleast 95% percentile to grab a top MBA college .'),nl,nl.

informationhs(mtech):-nl,write('Students can apply for GATE to get better M.Tech opportunities .'),nl,nl.

informationhs(me):-nl,write('Students can appear in GATE to get better M.E opportunities.'),nl,nl.

informationhs(phd):-nl,write('Postgraduates can appear in UGC-NET to get better Phd opportunities .'),nl,nl.

informationhs(ms):-nl,write('1. For MS in India a good GATE score will land you in a nice college for MS .'),nl,
				 write('2. For MS abroad you can appear for GRE, GMAT, MCAT, LSAT,etc exams to get a nice college .'),nl,nl.

informationhs(jrf):-nl,write('You can appear for NET-JRF to get a research fellowship at some nice place .'),nl,nl.

informationhs(army):-nl,write('This is a change field opportunity. You can appear for NDA,CDS,NCC,AFCAT, and other defense exams .'),nl,nl.

informationhs(others):-nl,write('There are many Higher Study opportunities that you can apply for !'),nl,nl.

informationhs(_):-nl,write('EITHER mentioned Higher studies dont take CS/IT students OR information is not available right now .'),nl,nl.


module(3):-suggest(_X,_Y).


%fact base

%basic(career_name,language,top_skill,interest)

:- discontiguous basic/4.

basic(computer_scientist,all_languages,multitasking,research).
basic(data_scientist,python,problem_solving,data).
basic(data_analytics,python,critical_thinking,data).
basic(user_experience,markup,editing,design).
basic(nlp_engineer,r,problem_solving,textdata).
basic(app_developer,react,logical,mobile_computing).
basic(project_manager,english,multitasking,research).
basic(ai_engineer,prolog,problem_solving,ai).
basic(rnd_engineer,all_languages,multitasking,research).
basic(dba,sql,leadership,networking).
basic(full_stack_developer,frontend,creativity,design).
basic(mobile_expert,android,reasoning,mobile_computing).
basic(big_data_engineer,python,problem_solving,data).
basic(lecturer,all_languages,leadership,teaching).
basic(graphic_designer,visuals,creativity,design).
basic(ethical_hacker,sql,patience,networking).
basic(cs_analyst,english,multitasking,research).
basic(software_tester,java,analytical,testing).
basic(software_engineer,backend,analytical,software).
basic(ml_engineer,python,problem_solving,data).


:- discontiguous suggestl/2.

suggest(_X,_Y):-	informationjob,suggestl(_A,_B),suggests(_C,_D),suggesti(_E,_F).


% on basis of language
convert_to_list1([Language|Tail]):- retract(recommendedl(Language)), convert_to_list1(Tail).

convert_to_list1([]).


suggestl(Career,Language):- basic(Career,Language,_,_),nl,interestedl(Language),write('The recommended career is : '),
							write(Career),write(' based on your language knowledge in '),write(Language),
							nl,
							assert(recommendedl(Career)),fail.

suggestl(_,_) :- nl,nl,write('On the basis of your coding skills :'),nl,convert_to_list1(List1),nl,
				 write('The list of recommended careers for you is :'),nl,nl, write(List1),write(' '), nl.

interestedl(Language):-nl,write(' Are you having a strong command over '),write(Language),write(' ? '),read(R),nl,R=y.


informationjob:- 	nl,nl,	
					write('If you wish to know about any job description for CS/IT type out its name in lowercase !'),nl,
					read(JOB),nl,
					infojob(JOB),!.




infojob(data_analytics):-nl,write('Data analytics is the science of analyzing raw data in order to make conclusions about that information.'),nl,nl.
infojob(user_experience):-nl,write('A user experience designer is generally a jack of all trades in the design process centered on users.'),nl,nl.
infojob(nlp_engineer):-nl,write('NLP Engineer responsibilities include transforming natural language data into useful features using NLP techniques to feed classification algorithms.'),nl,nl.
infojob(ai_engineer):-nl,write('An AI engineer builds AI models using machine learning algorithms and deep learning neural networks to draw business insights'),nl,nl.
infojob(software_engineer):-nl,write('A software engineer applies mathematical analysis and the principles of computer science in order to design and develop computer software'),nl,nl.
infojob(software_tester):-nl,write('Software Testers are responsible for the quality of software development and deployment'),nl,nl.
infojob(dba):-nl,write('Your responsibility as a database administrator (DBA) will be the performance, integrity and security of a database. '),nl,nl.
infojob(full_stack_developer):-nl,write('A full stack developer is an engineer who can handle all the work of databases, servers, systems engineering, and clients.'),nl,nl.
infojob(mobile_expert):-nl,write('The goal of the Mobile Expert is to create an outstanding buying experience for the customer and a positive a team environment.'),nl,nl.
infojob(app_developer):-nl,write('Application Developer is responsible for developing and modifying source code for software applications.'),nl,nl.
infojob(rnd_engineer):-nl,write('A research and development job allows graduate engineers to use their skills to push the frontiers of science forward.'),nl,nl.
infojob(lecturer):-nl,write('Lecturer requires lot of research and hard work for a great academic profession.'),nl,nl.
infojob(graphic_designer):-nl,write('Graphic designers create visual concepts, using computer software or by hand, to communicate ideas that inspire, inform, and captivate consumers.'),nl,nl.
infojob(ethical_hacker):-nl,write('Ethical hackers know how to find and exploit vulnerabilities and weaknesses in various systems. They break into systems legally and ethically.'),nl,nl.
infojob(cs_analyst):-nl,write('System analyst is a good position for those with interest in computer science, information technology, and management.'),nl,nl.
infojob(project_manager):-nl,write('A project manager is responsible to handle the project from planning to completion.'),nl,nl.
infojob(ml_engineer):-nl,write('Machine learning engineers feed data into models defined by data scientists.'),nl,nl.
infojob(big_data_engineer):-nl,write('A Big Data Engineer is a person who creates and manages a companys Big Data infrastructure and tools, and is someone that knows how to get results from vast amounts of data quickly'),nl,nl.
infojob(data_scientist):-nl,write('Data scientists are a mix of mathematicians, trend-spotters, and computer scientists.'),nl,nl.
infojob(computer_scientist):-nl,write('Computer scientists work in the development of mathematical models for working with computer-based systems.'),nl,nl.
infojob(_):-nl,write('EITHER this Job profile is not for CS/IT students OR information is not available right now .'),nl,nl.







%on basis of topskills
convert_to_list2([Topskill|Tail]):- retract(recommendedl(Topskill)), convert_to_list2(Tail).

convert_to_list2([]).


suggests(Career,Topskill):- basic(Career,_,Topskill,_),nl,interesteds(Topskill),write('The recommended career is : '),
							write(Career),write(' based on your topskill : '),write(Topskill),nl,
							assert(recommendedl(Career)),fail.


suggests(_,_) :-	nl,nl,write('On the basis of your Topskills :'),nl, convert_to_list2(List2),nl,
					write('The list of recommended careers for you is :'),nl,nl, write(List2),write(' '), nl.


interesteds(Topskill):-nl,write(' Are you exceling in '),write(Topskill),write(' ? '),read(R),nl,R=y.


%on basis of Interests
convert_to_list3([Interest|Tail]):- retract(recommendedi(Interest)), convert_to_list3(Tail).

convert_to_list3([]).

suggesti(Career,Interest):- basic(Career,_,_,Interest),nl,interestedi(Interest),write('The recommended career is : '),
							write(Career),write(' based on your interest in '),write(Interest),nl,
							assert(recommendedi(Career)),fail.

suggesti(_,_) :- nl,nl,write('On the basis of your Interests :'),nl,convert_to_list3(List3),nl,
				 write('The list of recommended careers for you is :'),nl,nl, write(List3),write(' '), nl.


interestedi(Interest):-nl,write('Are you interested in '),write(Interest),write(' ? '),read(R),nl,R=y.