n=250;
tend=50;
k=tend/n;
t=(0:k:tend);

u=[5e-7;2e-7;0;0];  % initial condition

tol=1e-8; % tolerance for exiting Multi_Newton loop
iter=20; % number of iterations for Multi_Newton

K1=1e6;  % reaction coefficients
K2=1e-4;
K3=0.1;

time=t(1);
u1=zeros(size(time));
u4=zeros(size(time));
i=0

figure
hold on

while time<tend
    
    i=i+1
    
    [u,num]=newton_higham(k,u,tol,iter,K1,K2,K3)
    
    u1(i)=u(1); u4(i)=u(4);
    
    plot(time,u(1),'r',time,u(2),'b')
    pause(0.05)
    %{
    if num<4
        k=k*2;
    else if num>8
        k=k/2;
        end
    end
    %}    
    if time+k>tend
        time=tend;
    else time=time+k;
    end
    
end

t=t(1:length(u1));

plot(t(1:5:end),u1(1:5:end),'bo',t(1:5:end),u4(1:5:end),'rs')
lgn=legend('Substrate','Product');
lgn.Location='southeast';
plot(t,u1,'b',t,u4,'r')
axis([0 50 0 5e-7])
xlabel('Time')
ylabel('Concentration')

% Data from rre_mm_higham.m/mm_rre.m  Version 7.19.17 #1

highamTime=[0,...
   0.399974997786883,...
   0.799949995573766,...
   1.199924993360649,...
   2.169723964682468,...
   3.139522936004287,...
   4.109321907326106,...
   5.079120878647926,...
   7.188656719950345,...
   9.298192561252764,...
  11.407728402555183,...
  13.517264243857602,...
  18.517264243857603,...
  23.517264243857603,...
  28.517264243857603,...
  33.517264243857603,...
  38.517264243857603,...
  43.517264243857603,...
  48.517264243857603,...
  50.000000000000000];
  
higham1=1.0e-6*[0.500000000000000,...
   0.467214920321342,...
   0.440475445645787,...
   0.418444655588714,...
   0.376614040482595,...
   0.347146574915475,...
   0.324685852236231,...
   0.306498654124052,...
   0.272494323783113,...
   0.243405513652448,...
   0.216426390040114,...
   0.191028220585233,...
   0.137300019320100,...
   0.092347234447335,...
   0.057499063229656,...
   0.032656329123425,...
   0.017374012404631,...
   0.009215806257894,...
   0.005058760718326,...
   0.004153584846172];

higham2=1.0e-06*[0.200000000000000,...
   0.168285388805519,...
   0.143616166463838,...
   0.124458350069143,...
   0.091636891717021,...
   0.073478098800777,...
   0.063701713081403,...
   0.058934147328860,...
   0.054938811545692,...
   0.056227055985962,...
   0.059250524058935,...
   0.063138765736549,...
   0.073586452999715,...
   0.086530229114787,...
   0.102049912367074,...
   0.120462653380823,...
   0.139824068298978,...
   0.157432446522336,...
   0.171303323091889,...
   0.174421267211084];

higham3=1.0e-06*[0,...
   0.031714611194481,...
   0.056383833536162,...
   0.075541649930857,...
   0.108363108282979,...
   0.126521901199223,...
   0.136298286918597,...
   0.141065852671140,...
   0.145061188454308,...
   0.143772944014038,...
   0.140749475941065,...
   0.136861234263451,...
   0.126413547000285,...
   0.113469770885213,...
   0.097950087632926,...
   0.079537346619177,...
   0.060175931701022,...
   0.042567553477664,...
   0.028696676908111,...
   0.025578732788916];
    
higham4=1.0e-06*[0,...
   0.001070468484584,...
   0.003140720838198,...
   0.006013694519050,...
   0.015022851287736,...
   0.026331523937556,...
   0.039015860892393,...
   0.052435493233375,...
   0.082444487756002,...
   0.112821542297489,...
   0.142824133964502,...
   0.172110545081678,...
   0.236286433630995,...
   0.294182994664100,...
   0.344550849185271,...
   0.387806324328299,...
   0.422450055958002,...
   0.448216640301851,...
   0.466244562383238,...
   0.470267682370779];