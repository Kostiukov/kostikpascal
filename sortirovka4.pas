program sortirovka4;

uses SysUtils, Windows;

type mas=array [-999..1000000] of integer;

var a:mas; b:mas;
i,n:integer;
ras:longint;
commontime: Int64;
ProcessStartTime, ProcessEndTime, ProcessStartKernelTime,
ProcessStartUserTime,
ProcessEndKernelTime,
CommonUserTime,
ProcessEndUserTime : FileTime;

procedure sortviborom(var a: mas; n:integer);
var j,k,i,z:integer;
begin
for j:=1 to n do begin //сортировка выбором нач
k := j;
for i:=j+1 to n do begin
if a[k]>a[i] then begin
k :=i;
end;
end;
z:=a[k];
a[k]:=a[j];
a[j]:=z;
end;
end;

procedure sortprost(var a: mas; n:integer);
var i,z:integer;
begin
i:=1;
while i<>n do begin
if a[i]>a[i+1] then begin
z:=a[i];
a[i]:=a[i+1];
a[i+1]:=z;
i:=0;
end;
i:=i+1;

end;

end;

procedure sliv(var a:mas; p,q:integer);
var r,i,j,k:integer; b:mas;

begin
r:=(p+q) div 2;
i:=p;
j:=r+1;
for k:=p to q do begin
if (i<=r) and ((j>q) or (a[i]<a[j])) then begin
b[k]:=a[i];
i:=i+1;
end
else begin
b[k]:=a[j];
j:=j+1;
end; //slian
end;
for k:=p to q do begin
a[k]:=b[k];
end;
end;

procedure mergesort(var a:mas; p,q:integer);
begin
if p<q then
begin //slian
mergesort(a,p,(p+q) div 2);
mergesort(a,(p+q) div 2 + 1,q);
sliv(a,p,q);
end;
end;

procedure konech(var a:mas);

begin
writeln;
for i:=1 to n-1 do begin
if a[i]>a[i+1] then begin
write('error in answer');
break;
end;
end;
writeln;
end;

begin

read(n);

randomize;

for i:=1 to n do begin
b[i]:=random(1999)-999;
end;
for i:=1 to n do begin
write(b[i],' ');
end;

writeln; //end
writeln;
GetProcessTimes(GetCurrentProcess(), ProcessStartTime,
ProcessEndTime, ProcessStartKernelTime,
ProcessStartUserTime);       //!

for i:=1 to n do begin
a[i]:=b[i];
end;
sortviborom(a, n);
konech(a);
writeln;
GetProcessTimes(GetCurrentProcess(), ProcessStartTime,
ProcessEndTime, ProcessEndKernelTime,
ProcessEndUserTime);
CommonTime:=Int64(ProcessEndUserTime)-Int64(ProcessStartUserTime);
writeln(CommonTime / 1000000000:12:10);


for i:=1 to n do begin
a[i]:=b[i];
end;

writeln; //end
GetProcessTimes(GetCurrentProcess(), ProcessStartTime,
ProcessEndTime, ProcessStartKernelTime,
ProcessStartUserTime);      //!

sortprost(a, n);
konech(a);
writeln;
GetProcessTimes(GetCurrentProcess(), ProcessStartTime,
ProcessEndTime, ProcessEndKernelTime,
ProcessEndUserTime);
CommonTime:=Int64(ProcessEndUserTime)-Int64(ProcessStartUserTime);
writeln(CommonTime / 1000000000:12:10);


for i:=1 to n do begin
a[i]:=b[i];
end;

writeln; //end
GetProcessTimes(GetCurrentProcess(), ProcessStartTime,
ProcessEndTime, ProcessStartKernelTime,
ProcessStartUserTime);             //!

mergesort(a,1,n);
konech(a);

writeln;
GetProcessTimes(GetCurrentProcess(), ProcessStartTime,
ProcessEndTime, ProcessEndKernelTime,
ProcessEndUserTime);
CommonTime:=Int64(ProcessEndUserTime)-Int64(ProcessStartUserTime);
writeln(CommonTime / 1000000000:12:10);
writeln;

for i:=1 to n do begin //begin
write(a[i],' ');
end; //end


readln;
readln;

end.
