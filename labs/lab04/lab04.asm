; hello.asm
SECTION .data                  ; Начало секций данных
    hello: DB 'Sakhno Alyona', 10 ; 'Hello word!' плюс
                               ; символ перевода строки
    helloLen EQU $-hello       ; Длина строки hello
    
SECTION .text         ; Начало секции кода
    GLOBAL _start
    
_start:               ; Точка входа в программу 
    mov eax, 4        ; Сиситемный вывоз для записи (sys_write)
    mov ebx, 1        ; Описатель файла '1' - строительный вывод
    mov ecx, hello    ; Адрес строки hello в ecx
    mov edx, helloLen ; Размер строки hello
    int 80h           ; Вывоз ядра
    
    mov eax, 1        ; Системный вывоз для выхода(sys_exit)
    mov ebx, 0        ; Выход с кодом возврата '0' (без ошибок)
    int 80h           ; Вызов ядра
