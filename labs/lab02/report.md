
---
## Front matter
title: "Шаблон отчёта по лабораторной работе №2"
subtitle: "Дисциплина: Архитектура компьютера"
author: "Сахно Алёна Юрьевна"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---
# Цель работы
Целью работы является изучить идеологию и применение средств контроля версий. Приобрести практические навыки по работе с системой git.
# Задание
1. Перемещение по файловой системе.
2. Создание пустых каталогов и файлах.
3. Перемещение и удаление файлов или каталогов.
4. Команда cat: вывод содержимого файлов.
5. Выполнение заданий для самостоятельной работы.

# Теоретическое введение

Системы контроля версий (Version Control System, VCS) применяются при работе нескольких человек над одним проектом. 

# Выполнение лабораторной работы

Сначала сделаем предварительную конфигурацию git. Откройте терминал и введите следующие команды, указав имя и email владельца репозитория:
 git config --global user.name "< Name Surname>"
 git config --global user.email "< work@mail>"
 Настроим utf-8 в выводе сообщений git:
 git config --global core.quotepath false



 Зададим имя начальной ветки (будем называть её master): 
git config --global init.defaultBranch master

 Параметр autocrlf: 
git config --global core.autocrlf input




 Параметр safecrlf: 
git config --global core.safecrlf warn 


3.1.3. Создание SSH ключа 
Для последующей идентификации пользователя на сервере репозиториев необходимо сгенерировать пару ключей (приватный и открытый):
 ssh-keygen -C "Имя Фамилия <work@mail>"














 Ключи сохраняться в каталоге ~/.ssh/. 
Далее необходимо загрузить сгенерённый открытый ключ. Для этого зайти на сайт http: //github.org/ под своей учётной записью и перейти в меню Setting . После этого выбрать в боковом меню SSH and GPG keys и нажать кнопку New SSH key . Скопировав из локальной консоли ключ в буфер обмена
 cat ~/.ssh/id_rsa.pub | xclip -sel clip 
вставляем ключ в появившееся на сайте поле и указываем для ключа имя (Title).


3.1.4. Сознание рабочего пространства и репозитория курса на основе шаблона 
При выполнении лабораторных работ следует придерживаться структуры рабочего пространства. Рабочее пространство по предмету располагается в следующей иерархии: 
~/work/study/
└── < учебный год>/ 
       └──<название предмета> /
              └── < код предмета>/
Например, для 2023–2024 учебного года и предмета «Архитектура компьютера» (код предмета arch-pc) структура каталогов примет следующий вид:
 ~/work/study/ 
└── 2023–2024/ 
      └── Архитектура компьютера/ 
          └── arch-pc/ 
               └── labs/ 
                       └── lab01/
                       └── lab02/
                       └── lab03/ ...
 • Каталог для лабораторных работ имеет вид labs.
 • Каталоги для лабораторных работ имеют вид lab, например: lab01, lab02 и т.д.
 
Название проекта на хостинге git имеет вид: study__ 
Например, для 2023–2024 учебного года и предмета «Архитектура компьютера» (код предмета arch-pc) название проекта примет следующий вид: study_2023–2024_arch-pc Откройте терминал и создайте каталог для предмета «Архитектура компьютера»: 
 
mkdir -p ~/work/study/2023-2024/"Архитектура компьютера" 



3.1.5. Сознание репозитория курса на основе шаблона 
 
Репозиторий на основе шаблона можно создать через web-интерфейс github. Перейдите на станицу репозитория с шаблоном курса https://github.com/yamadharma/cour se-directory-student-template. Далее выберите Use this template.




В открывшемся окне задайте имя репозитория (Repository name) study_2023–2024_arhpc и создайте репозиторий (кнопка Create repository from template). 
Откройте терминал и перейдите в каталог курса:
 
 cd ~/work/study/2023–2024/"Архитектура компьютера"
 клонируйте созданный репозиторий:
 git clone --recursive git@github.com:/study_2023–2024_arh-pc.git 
↪ arch-pc 


Ссылку для клонирования можно скопировать на странице созданного репозитория Code -> SSH: 





































3.1.6. Настройка каталога курса 
Перейдите в каталог курса:
 cd ~/work/study/2023-2024/"Архитектура компьютера"/arch-pc
 Удалите лишние файлы: 
rm package.json



Создайте необходимые каталоги: 
echo arch-pc > COURSE 
make 
Отправьте файлы на сервер: 
git add . git commit -am 'feat(main): make course structure' 
git push
 Проверьте правильность создания иерархии рабочего пространства в локальном репозитории и на странице github.

#Задание для самостоятельной работы

1.     Создайте отчет по выполнению лабораторной работы в соответствующем каталоге рабочего пространства (labs>lab02>report). 
 
Перехожу в директорию labs/lab01/report с помощью утилиты cd. Создаю
в каталоге файл для отчета по третьей лабораторной работе с помощью
утилиты touch

Оформить отчет я смогу в текстовом процессоре LibreOffice Writer, найдя его в
меню приложений. В нем я открыла файл и теперь могу в нем работать. 

2. Скопируйте отчеты по выполнению предыдущих лабораторных работ в соответствующие 
каталоги созданного рабочего пространства. 
 
Проверяю местонахождение файлов с отчетами по первой  лабораторным работам. Они должны быть в подкаталоге домашней директории «Загрузки»,
для проверки использую команду ls.




1.     Загрузите файлы на github.
 
Добавляю с помощью команды git add в коммит созданные файлы:
Л01_Сахно_ отчёт


Сохраняю изменения на сервере командой git commit -m “…”, поясняя, что добавила файлы.
Проверяю на сайте GitHub правильность выполнения заданий. Вижу, что пояснение к совершенным действиям отображается. При просмотре изменений так же вижу, что были добавлены файлы с отчетами по лабораторным работам. Вижу, что отчеты по лабораторным работам находятся в соответствующих каталогах репозитория: отчет по первой - в lab01/report


# Выводы

Я изучила  идеологию и применение средств контроля версий. Приобрести практические навыки по работе с системой git.

