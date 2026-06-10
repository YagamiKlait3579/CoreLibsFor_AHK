# CoreLibsFor_AHK

Personal AutoHotkey v1 development framework and reusable core libraries.

Персональный набор базовых библиотек, функций и инструментов для AutoHotkey v1.

> ⚠️ **Project Status**
>
> This repository is primarily maintained for use in my own projects.
> Public access is provided for reference, learning, and reuse.
> While others are welcome to use it, the architecture and API are optimized for my personal workflow and may change without notice.
>
> ---
>
> ⚠️ **Статус проекта**
>
> Этот репозиторий в первую очередь поддерживается для использования в моих собственных проектах.
> Публичный доступ предоставлен для ознакомления, изучения и повторного использования кода.
> Несмотря на то, что библиотека доступна всем желающим, её архитектура и API ориентированы на мой личный рабочий процесс и могут изменяться без предварительного уведомления.

🌐 **Language / Язык**

* 🇷🇺 [Русский](#русский)
* 🇺🇸 [English](#english)

---

# Русский

## О проекте

`CoreLibsFor_AHK` — это набор базовых библиотек, классов, функций и вспомогательных инструментов, которые я использую в большинстве своих проектов на AutoHotkey.

По сути данный репозиторий представляет собой внутренний фреймворк для разработки, позволяющий переиспользовать код и ускорять создание новых проектов.

Большая часть функций и библиотек была написана мной специально под собственные задачи и рабочий процесс.

## Это не самостоятельная программа

Данный репозиторий не является полноценным приложением.

Если скачать только `CoreLibsFor_AHK`, то запускать здесь практически нечего. Библиотека предназначена для подключения к другим проектам и не имеет собственной точки входа для выполнения.

## Поддерживаемая версия AutoHotkey

Библиотека разработана для:

**AutoHotkey v1**

Совместимость с AutoHotkey v2 не гарантируется.

## Установка

Для корректной работы библиотека должна располагаться в папке `libs`, находящейся рядом с основным скриптом проекта.

Пример структуры проекта:

```text
Project
│
├─ Main.ahk
└─ libs
   └─ CoreLibsFor_AHK
```

После этого необходимо подключить основной заголовочный файл библиотеки:

```ahk
#include %A_ScriptDir%\libs\CoreLibsFor_AHK\BaseLibs\Header.ahk
```

Файл `Header.ahk` является основной точкой подключения библиотеки и автоматически подключает необходимые компоненты.

## Быстрый старт

Если вы не хотите самостоятельно настраивать структуру проекта и подключение библиотеки, можете воспользоваться готовым шаблоном:

https://github.com/YagamiKlait3579/Demo_AHK

В этом репозитории библиотека уже подключена и структура проекта полностью готова к использованию.

## Документация

Почти все функции, классы и модули содержат встроенные комментарии с описанием:

* назначения функции;
* параметров;
* возвращаемых значений;
* примеров использования.

Во многих случаях исходный код сам является основной документацией.

## Сторонние библиотеки

Хотя большая часть кода в этом репозитории написана мной, некоторые библиотеки являются сторонними проектами и принадлежат их авторам.

### FindText

Оригинальная тема автора:

https://www.autohotkey.com/boards/viewtopic.php?f=6&t=17834

Подробная инструкция по использованию от сообщества:

https://www.autohotkey.com/boards/viewtopic.php?f=7&p=456845#p456845

### Gdip

Официальный репозиторий:

https://github.com/tariqporter/Gdip

## Примечания

Данный репозиторий в первую очередь является моей личной базой для разработки. По мере развития проектов функции, классы и внутренние интерфейсы могут изменяться, дополняться или перерабатываться.

Если вы используете библиотеку в собственных проектах, рекомендуется фиксировать конкретную версию, а не всегда использовать последнюю ревизию.

---

# English

## About

`CoreLibsFor_AHK` is a collection of core libraries, classes, helper functions, and utilities that I use as the foundation for most of my AutoHotkey projects.

This repository essentially serves as my personal development framework, allowing code reuse and faster project creation.

Most of the functionality included here was written specifically for my own workflow and development needs.

## This Is Not a Standalone Application

This repository is not a complete application.

If you download `CoreLibsFor_AHK` by itself, there is usually nothing to launch or execute directly. The library is intended to be integrated into other AutoHotkey projects.

## Supported AutoHotkey Version

This library is designed for:

**AutoHotkey v1**

Compatibility with AutoHotkey v2 is not guaranteed.

## Installation

For proper integration, the library should be placed inside a `libs` directory located next to your main script.

Example project structure:

```text
Project
│
├─ Main.ahk
└─ libs
   └─ CoreLibsFor_AHK
```

Then include the main header file:

```ahk
#include %A_ScriptDir%\libs\CoreLibsFor_AHK\BaseLibs\Header.ahk
```

`Header.ahk` serves as the main entry point and automatically loads the required library components.

## Quick Start

If you do not want to manually configure the folder structure and library integration, you can use the ready-to-use template repository:

https://github.com/YagamiKlait3579/Demo_AHK

The library is already integrated there and the project structure is ready to use.

## Documentation

Most functions, classes, and modules contain built-in comments describing:

* their purpose;
* parameters;
* return values;
* usage examples.

In many cases, the source code itself serves as the primary documentation.

## Third-Party Libraries

Although most of the code in this repository was written by me, some included libraries are third-party projects and remain the property of their respective authors.

### FindText

Original forum thread:

https://www.autohotkey.com/boards/viewtopic.php?f=6&t=17834

Community guide and usage examples:

https://www.autohotkey.com/boards/viewtopic.php?f=7&p=456845#p456845

### Gdip

Official repository:

https://github.com/tariqporter/Gdip

## Notes

This repository is primarily maintained as a personal development framework. Functions, classes, and internal APIs may change as projects evolve and new functionality is added.

If you use this library in your own projects, consider pinning a specific version instead of always tracking the latest revision.
