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
  Result :=  (b - a) *  Func(a);
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
    Result := h * Result;
  until Abs(Result - Prev) <= E;
end;

function MetodTrap(Integral: TIntegral; a, b:Real; eps: Real; var N: Integer): Real;
var h: Real;
    prevI, xi: Real;
    i: Integer;
begin
  N := 0;
  Result :=  (b - a) *  Integral(a);
  repeat
    PrevI := Result;
    Inc(N,5);
    h := (b-a) / N;
    xi := a + h;
    Result := 0;
    for i := 1 to N-1 do
    begin
      Result := Result + Integral(xi);
      xi := xi + h;
    end;
    Result := (Result + (Integral(a) + Integral(xi)) / 2) * h;
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

procedure Header;
begin
  Writeln('|---|-----------------------------------------------------------------------------|');
  Writeln('|---|              1-� �����               |              2-� �����               |');
  Writeln('|---|-------------------|------------------|-------------------|------------------|');
  Writeln('|---|       10^-2       |      10^-3       |       10^-2       |       10^-3      |');
  Writeln('|---|-------------|-----|------------|-----|-------------|-----|------------|-----|');
  Writeln('|---|   ��������  |  N  |  ��������  |  N  |   ��������  |  N  |  ��������  |  N  |');
  Writeln('|---|-------------|-----|------------|-----|-------------|-----|------------|-----|');
end;

var
  Val, A, B : Real;
  func: TIntegral;
  N: Integer;
begin
  Header;

  func := func1;
  Write('| 1 | ');
  A := 1.0;
  B := 2.2;
  Val := MetodTrap(func, A, B, 0.01, N);
  Write(Val:11:6, ' | ', N:3, ' | ');
  Val := MetodTrap(func, A, B, 0.001, N);
  Write(Val:10:6, ' | ', N:3, ' | ');
  Val := RectangleMethod(func, A, B, 0.01, N);
  Write(Val:11:6, ' | ', N:3, ' | ');
  Val := RectangleMethod(func, A, B, 0.001, N);
  Writeln(Val:10:6, ' | ', N:3, ' | ');

  func := func2;
  Write('| 2 | ');
  A:= 0.6;
  B:= 1.0;
  Val := MetodTrap(func, A, B, 0.01, N);
  Write(Val:11:6, ' | ', N:3, ' | ');
  Val := MetodTrap(func, A, B, 0.001, N);
  Write(Val:10:6, ' | ', N:3, ' | ');
  Val := RectangleMethod(func, A, B, 0.01, N);
  Write(Val:11:6, ' | ', N:3, ' | ');
  Val := RectangleMethod(func, A, B, 0.001, N);
  Writeln(Val:10:6, ' | ', N:3, ' | ');

  func := func3;
  Write('| 3 | ');
  A:= 0.2;
  B:= 1.2;
  Val := MetodTrap(func, A, B, 0.01, N);
  Write(Val:11:6, ' | ', N:3, ' | ');
  Val := MetodTrap(func, A, B, 0.001, N);
  Write(Val:10:6, ' | ', N:3, ' | ');
  Val := RectangleMethod(func, A, B, 0.01, N);
  Write(Val:11:6, ' | ', N:3, ' | ');
  Val := RectangleMethod(func, A, B, 0.001, N);
  Writeln(Val:10:6, ' | ', N:3, ' | ');

  func := func4;
  Write('| 4 | ');
  A:= 0.6;
  B:= 1.4;
  Val := MetodTrap(func, A, B, 0.01, N);
  Write(Val:11:6, ' | ', N:3, ' | ');
  Val := MetodTrap(func, A, B, 0.001, N);
  Write(Val:10:6, ' | ', N:3, ' | ');
  Val := RectangleMethod(func, A, B, 0.01, N);
  Write(Val:11:6, ' | ', N:3, ' | ');
  Val := RectangleMethod(func, A, B, 0.001, N);
  Writeln(Val:10:6, ' | ', N:3, ' | ');

   Writeln('|---|-----------------------------------------------------------------------------|');
  readln;
end.
