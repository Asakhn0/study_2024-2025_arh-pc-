%include    'in_out.asm'

SECTION .data
msg_func db "Функция: f(x)=7(x+1)", 0
msg_result db "Результат: ", 0

SECTION .text
GLOBAL _start

_start:
  mov eax, msg_func
  call sprint

  pop ecx
  pop edx
  sub ecx, 1
  mov esi, 0

next:
  cmp ecx, 0h
  jz _end
  pop eax
  call atoi
 
  mov ebx, eax
  add ebx, 1
  mov eax, 7
  imul eax, ebx

  add esi, eax

  loop next

_end:
  mov eax, msg_result
  call sprint
  mov eax, esi
  call iprintLF
  call quit

