program Lab4;


type
  TIntegral = function(X: Real):Real;

function func1(x:real):real;
begin
  result:=sqrt(1.5*x+0.6)/(1.6+sqrt(0.8*x*x+2));
end;

function func2(x:real): real;
begin
  result:=cos(0.6*x*x+0.4)/(1.4+sqr(sin(x+0.7)));
end;

function func3(x:real): real;
begin
  result:=1/sqrt(x*x+1);
end;

function func4(x:real): real;
begin
  result:=cos(x)/(x+1);
end;

var
  f1, f2, f3, f4: Tintegral;
begin
  f1:=func1;
  f2:=func2;
  f3:=func3;
  f4:=func4;
  readln;
end.
