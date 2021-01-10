%male members of family

male(kamal).
male(vivek).
male(rahul).
male(harsh).
male(sanjay).
male(kamlesh).
male(manohar).
male(damodar).

%female members of family	
female(avi).
female(rama).
female(sapna).
female(richa).
female(anaya).
female(sakshi).
female(rohini).
female(laali).
female(mohini).
female(yamini).

%parents of family
parent(anaya,avi).
parent(harsh,avi).

parent(sanjay,kamal).
parent(sakshi,kamal).

parent(rohini,vivek).
parent(rohini,rama).
parent(rohini,sapna).
parent(kamlesh,vivek).
parent(kamlesh,rama).
parent(kamlesh,sapna).

parent(laali,rahul).
parent(laali,anaya).
parent(laali,sanjay).
parent(manohar,rahul).
parent(manohar,anaya).
parent(manohar,sanjay).

parent(yamini,kamlesh).
parent(yamini,manohar).
parent(yamini,mohini).
parent(damodar,kamlesh).
parent(damodar,manohar).
parent(damodar,mohini).

%couples in family
spouse(richa,rahul).
spouse(anaya,harsh).
spouse(sakshi,sanjay).
spouse(rohini,kamlesh).
spouse(laali,manohar).
spouse(yamini,damodar).

spouse(rahul,richa).
spouse(harsh,anaya).
spouse(sanjay,sakshi).
spouse(kamlesh,rohini).
spouse(manohar,laali).
spouse(damodar,yamini).


%childrens in the family
child(avi,harsh).
child(avi,anaya).

child(kamal,sanjay).
child(kamal,sakshi).

child(vivek,kamlesh).
child(rama,kamlesh).
child(sapna,kamlesh).
child(vivek,rohini).
child(rama,rohini).
child(sapna,rohini).

child(rahul,manohar).
child(anaya,manohar).
child(sanjay,manohar).
child(rahul,laali).
child(anaya,laali).
child(sanjay,laali).

child(kamlesh,damodar).
child(manohar,damodar).
child(mohini,damodar).
child(kamlesh,yamini).
child(manohar,yamini).
child(mohini,yamini).

%Relations starts from here

%mothers
mother(X,Y):-female(X),parent(X,Y).

%fathers
father(X,Y):-male(X),parent(X,Y).

%husbands
husband(X,Y):-male(X),female(Y),spouse(X,Y).

%wives
wife(X,Y):-female(X),male(Y),spouse(X,Y).

%grandfathers
grandpa(X,Y):-male(X),parent(X,Z),parent(Z,Y).

%grandmothers
grandma(X,Y):-female(X),parent(X,Z),parent(Z,Y).

%greatgrandfathers
greatgrandpa(X,Y):-male(X),parent(X,W),parent(W,Z),parent(Z,Y).

%greatgrandmothers
greatgrandma(X,Y):-female(X),parent(X,W),parent(W,Z),parent(Z,Y).

%brothers
brother(X,Y):-father(Z,X),father(Z,Y),mother(W,X),mother(W,Y),X\==Y,male(X).

%sisters
sister(X,Y):-mother(W,X),mother(W,Y),father(Z,X),father(Z,Y),X\==Y,female(X).

%daughters
daughter(X,Y):-female(X),child(X,Y).

%granddaughters
granddaughter(X,Y):-female(X),child(X,Z),child(Z,Y).

%greatgranddaughters
greatgranddaughter(X,Y):-female(X),child(X,W),child(W,Z),child(Z,Y).

%sons
son(X,Y):-male(X),child(X,Y).

%grandsons
grandson(X,Y):-male(X),child(X,Z),child(Z,Y).

%greatgrandsons
greatgrandson(X,Y):-male(X),child(X,W),child(W,Z),child(Z,Y).

%aunts
aunt(X,Y):-sister(X,Z),parent(Z,Y).

%uncles
uncle(X,Y):-brother(X,Z),parent(Z,Y).

%brotherinlaws
brotherinlaw(X,Y):-husband(H,Y),brother(H,X),male(X).

%sisterinlaws
sisterinlaw(X,Y):-wife(W,Y),sister(W,X),female(X).

%siblings
sibling(X,Y):-(uncle(P,Y);aunt(P,Y)),child(X,P).

%we are ready with the relations now we will list them
	
	action(1):-write('Enter name of person whose mother is to be found'),nl,
	read(X),
	write('Mother is '),
	mother(Y,X),
	write(Y),
	fail.

	action(2):-write('Enter name of person whose father is to be found'),nl,
	read(X),
	write('Father is '),
	father(Y,X),
	write(Y),
	fail.

	action(3):-write('Enter name of person whose husband is to be found'),nl,
	read(X),
	write('Husband is '),
	husband(Y,X),
	write(Y),
	fail.

	action(4):-write('Enter name of person whose wife is to be found'),nl,
	read(X),
	write('Wife is '),
	wife(Y,X),
	write(Y),
	fail.

	action(5):-write('Enter name of person whose grandfather is to be found'),nl,
	read(X),
	write('Grandfather is '),
	grandpa(Y,X),
	write(Y),
	fail.

	action(6):-write('Enter name of person whose grandmother is to be found'),nl,
	read(X),
	write('GrandMother is '),
	grandma(Y,X),
	write(Y),
	fail.

	action(7):-write('Enter name of person whose greatgrandfather is to be found'),nl,
	read(X),
	write('GreatGrandFather is '),
	greatgrandpa(Y,X),
	write(Y),
	fail.

	action(8):-write('Enter name of person whose greatgrandmother is to be found'),nl,
	read(X),
	write('GreatGrandMother is '),
	greatgrandma(Y,X),
	write(Y),
	fail.

	action(9):-write('Enter name of person whose brothers are to be found'),nl,
	read(X),
	write('Brothers are : '),
	brother(Y,X),nl,
	write(Y),
	fail.

	action(10):-write('Enter name of person whose sisters are to be found'),nl,
	read(X),
	write('Sisters are : '),
	sister(Y,X),nl,
	write(Y),
	fail.

	action(11):-write('Enter name of person whose daughters are to be found'),nl,
	read(X),
	write('Daughters are : '),
	daughter(Y,X),nl,
	write(Y),
	fail.

	action(12):-write('Enter name of person whose granddaughters are to be found'),nl,
	read(X),
	write('GrandDaughters are : '),
	granddaughter(Y,X),nl,
	write(Y),
	fail.

	action(13):-write('Enter name of person whose greatgranddaughters are to be found'),nl,
	read(X),
	write('GreatGrandDaughter are : '),
	greatgranddaughter(Y,X),nl,
	write(Y),
	fail.

	action(14):-write('Enter name of person whose sons are to be found'),nl,
	read(X),
	write('Sons are : '),
	son(Y,X),nl,
	write(Y),
	fail.

	action(15):-write('Enter name of person whose grandsons are to be found'),nl,
	read(X),
	write('GrandSons are : '),
	grandson(Y,X),nl,
	write(Y),
	print,
	fail.

	action(16):-write('Enter name of person whose greatgrandson is to be found'),nl,
	read(X),
	write('GreatGrandSon is : '),
	greatgrandson(Y,X),nl,
	write(Y),
	fail.

	action(17):-write('Enter name of person whose aunts are to be found'),nl,
	read(X),
	write('Aunts are : '),
	aunt(Y,X),nl,
	write(Y),
	fail.

	action(18):-write('Enter name of person whose uncles are to be found'),nl,
	read(X),
	write('Uncles are : '),
	uncle(Y,X),nl,
	write(Y),
	fail.

	action(19):-write('Enter name of person whose brothersinlaw are to be found'),nl,
	read(X),
	write('BrothersInLaw are : '),
	brotherinlaw(Y,X),nl,
	write(Y),
	fail.

	action(20):-write('Enter name of person whose sistersinlaw are to be found'),nl,
	read(X),
	write('SistersInLaw are : '),
	sisterinlaw(Y,X),nl,
	write(Y),
	fail.

	action(21):-write('Enter name of person whose siblings are to be found'),nl,
	read(X),
	write('Siblings are : '),
	sibling(Y,X),nl,
	write(Y),
	fail.	

	action(22).


%all possible relations
print:-
	repeat,nl,
	write(" Enter your choice according to the serial number : "),nl,
	write(" 1. Display Mother of ?"),nl,
	write(" 2. Display Father of ?"),nl,
	write(" 3. Display Husband of ?"),nl,
	write(" 4. Display Wife of ?"),nl,
	write(" 5. Display GrandFather of ?"),nl,
	write(" 6. Display GrandMother of ?"),nl,
	write(" 7. Display GreatGrandFather of ?"),nl,
	write(" 8. Display GreatGrandMother of ?"),nl,
	write(" 9. Display Brothers of ?"),nl,
	write(" 10. Display Sisters of ?"),nl,
	write(" 11. Display Daughters of ?"),nl,
	write(" 12. Display GrandDaughters of ?"),nl,
	write(" 13. Display GreatGrandDaughter of ?"),nl,
	write(" 14. Display Sons of ?"),nl,
	write(" 15. Display GrandSons of ?"),nl,
	write(" 16. Display GreatGrandSons of ?"),nl,
	write(" 17. Display Aunts of ?"),nl,
	write(" 18. Display Uncles of ?"),nl,
	write(" 19. Display BrotherInLaw of ?"),nl,
	write(" 20. Display SisterInLaw of ?"),nl,
	write(" 21. Display Siblings of ?"),nl,
	write(" 22. To Exit."),nl,
	write("Enter your choice : "),nl,
	read(Choice),
	action(Choice),
	repeat.