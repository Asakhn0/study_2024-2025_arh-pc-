%include 'in_out.asm'

section .data
msg1 db 'Введите x: ', 0h
msg2 db 'Введите a: ', 0h
msg3 db 'Результат: ', 0h

section .bss
x resb 10
a resb 10
result resd 1

section .text
global _start
_start:
    ; ---------- Ввод значения x
    mov eax, msg1
    call sprint
    mov ecx, x
    mov edx, 10
    call sread
    
    ; ---------- Преобразование x из символа в число
    mov eax, x
    call atoi
    mov [x], eax ; запись преобразованного числа в x

    ; ---------- Ввод значения a
    mov eax, msg2
    call sprint
    mov ecx, a
    mov edx, 10
    call sread
    
    ; ---------- Преобразование a из символа в число
    mov eax, a
    call atoi
    mov [a], eax ; запись преобразованного числа в a

    ; ---------- Сравниваем x и a
    mov eax, [x] ; загружаем x в eax
    cmp eax, [a] ; сравниваем x с a
    jl less_than_a ; если x < a, переходим к less_than_a

    ; Если x >= a, вычисляем 3 * x + 1
    imul eax, 3   ; eax = 3 * x
    add eax, 1    ; eax = 3 * x + 1
    jmp store_result

less_than_a:
    ; Если x < a, вычисляем 3 * a + 1
    mov eax, [a]  ; загружаем a в eax
    imul eax, 3   ; eax = 3 * a
    add eax, 1    ; eax = 3 * a + 1

store_result:
    mov [result], eax ; сохраняем результат

    ; ---------- Вывод результата
    mov eax, msg3
    call sprint        ; вывод сообщения 'Результат: '
    mov eax, [result]
    call iprintLF      ; выводим результат на экран

    call quit          ; выход из программы
