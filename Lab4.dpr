program Lab4;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  TIntegral = function(X: Real):Real;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
