pent(N,P):-P is N*(3*N-1)/2.

is_pent(P):-is_pent(0,P).
is_pent(N,Pent):-pent(N,Pent),!.
is_pent(N,P):-pent(N,Pent),Pent < P,N1 is N+1,is_pent(N1,P).

task:-task(D,Pj,Pk),(D=1000000-> write(" takoi pary chisel net "); write("Pj = "),write(Pj),write(" Pk = "),write(Pk),write(" D = "),write(D)).
% max number J and K is 817

task(D,Pj,Pk):-task(1,2,0,0,Pj,Pk,1000000,D).
task(J,_,Pj,Pk,Pj,Pk,D,D):-J = 100,!.
task(J,K,TempPj,TempPk,Pj,Pk,TempD,D):-K = 100,J_one is J+1, K_one is J+2,task(J_one,K_one,TempPj,TempPk,Pj,Pk,TempD,D),!.
task(J,K,TempPj,TempPk,PJ,PK,TempD,D):-pent(J,Pj),K1 is K+1,pent(K,Pk),Sum is Pj+Pk,
    (is_pent(Sum),Dif is Pk-Pj,is_pent(Dif)->
    (TempD > Dif -> task(J,K1,Pj,Pk,PJ,PK,Dif,D);
                    task(J,K1,TempPj,TempPk,PJ,PK,TempD,D));
    task(J,K1,TempPj,TempPk,PJ,PK,TempD,D)).