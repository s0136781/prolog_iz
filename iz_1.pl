pent(N,P):-P is N*(3*N-1)/2.

is_pent(P):-is_pent(0,P).
is_pent(N,Pent):-pent(N,Pent),!.
is_pent(N,P):-pent(N,Pent),Pent < P,N1 is N+1,is_pent(N1,P).

task:-task(D,Pj,Pk),(D=1000000-> write("Такой пары чисел нет"); write("Pj = "),write(Pj),write(" Pk = "),write(Pk),write(" D = "),write(D)).
% max number J and K is 817

task(D,Pj,Pk):-task(1,2,0,0,Pj,Pk,1000000,D).
task(J,_,Pj,Pk,Pj,Pk,D,D):-J = 100,!.
task(J,K,TempPj,TempPk,Pj,Pk,TempD,D):-K = 100,J_one is J+1, K_one is J+2,task(J_one,K_one,TempPj,TempPk,Pj,Pk,TempD,D),!.
task(J,K,TempPj,TempPk,PJ,PK,TempD,D):-pent(J,Pj),K1 is K+1,pent(K,Pk),Sum is Pj+Pk,
    (is_pent(Sum),Dif is Pk-Pj,is_pent(Dif)->
    (TempD > Dif -> task(J,K1,Pj,Pk,PJ,PK,Dif,D);
                    task(J,K1,TempPj,TempPk,PJ,PK,TempD,D));
    task(J,K1,TempPj,TempPk,PJ,PK,TempD,D)).


read_list(A,N):-r_1([],A,0,N).
r_1(A,A,N,N):-!.
r_1(B,A,I,N):-I1 is I+1,read(X),append(B,[X],B1),r_1(B1,A,I1,N).

insertion_sort:-read(N),read_list(A,N),insertion_sort(A,B),write(B).

insertion_sort(List,SortList):-insertion_sort(List,[],SortList).
insertion_sort([],SortList,SortList):-!.
insertion_sort([Head|Tail],SortSublist,SortList):-insert(Head,SortSublist,S),insertion_sort(Tail,S,SortList).

insert(P,List,Result):-insert(P,[],List,Result).
insert(P,Start,[],Result):-append(Start,[P],Result),!.
insert(P,Start,[Head|Tail],Result):-P > Head,append(Start,[Head],NewStart),insert(P,NewStart,Tail,Result),!.
insert(P,Start,Tail,Result):-append(Start,[P|Tail],Result).
