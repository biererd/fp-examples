program inlineasm;

{$asmMode intel}

var 
  z: longint;
  
begin
  z:=1;
  writeln('z=',z);
  
  asm
    mov eax,z
    add eax,7
    mov z,eax
  end;
  
  writeln('z=',z);

end.
