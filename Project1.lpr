program Project1;
var
  x,j,p,chislo,pros,count:integer;
begin
  read(chislo);
  for x:=2 to chislo do begin
    j:=2; p:=0;
    while(j<x) and (p=0) do begin
      if x mod j=0 then begin
        p:=1;
      end
      else begin
        j:=j+1;
      end;
    end;
    if p=0 then writeln(x);
  end;
  readln;
  readln;
end.
