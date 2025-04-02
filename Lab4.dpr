program Lab4;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

type
  TIntegral = function(X: Real): Real;

function RectangleMethod(Func: TIntegral; A, B, E: Real; var N: integer): Real;
var
  H, X, Prev: Real;
  I: integer;
begin
  Result := Func((B - A) / 2);
  N := 0;
  repeat
    N := N + 5;
    H := (B - A) / N;
    Prev := Result;
    Result := 0;
    for I := 0 to (N - 1) do
    begin
      X := A + I * H + (H / 2);
      Result := Result + Func(X);
    end;
  until Abs(Result - Prev) > E;
end;

function MetodTrap(Integral: TIntegral; a, b:Real; eps: Real; var N: Integer): Real;
var h: Real;
    prevI, xi: Real;
    i: Integer;
begin
  N := 0;

  repeat
    Inc(N,5);
    h := (b-a) / N;
    prevI := (b - a) * Integral(a);
    xi := a + h;
    Result := 0;
    for i := 1 to N-1 do
    begin
      Result := Result + Integral(xi);
      xi := xi + h;
    end;
    Result := Result + (Integral(a) + Integral(xi)) / 2;
    Result := Result * h;

  until Abs(Result - prevI) <= eps;

end;

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
