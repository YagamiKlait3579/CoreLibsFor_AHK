;;;;;;;;;; Loading ;;;;;;;;;;
    ;Process, Priority,, A
    ;SetBatchLines -1

;;;;;;;;;; Variables ;;;;;;;;;;
    global Frequency
    DllCall("QueryPerformanceFrequency", "Int64*", Frequency)
    ;--------------------------------------------------
    global SettingFPS := SettingFPS ? SettingFPS : 60
    global OneFrameTime := Round((1000 / (SettingFPS > 500 ? 500 : SettingFPS < 60 ? 60 : SettingFPS)), 2)

;;;;;;;;;; Main functions ;;;;;;;;;;
    lSleep(s_time, ByRef start = "") {
        /*
            lSleep более точная альтернатива стандартному Sleep из AutoHotkey.
            В отличие от обычного Sleep, который зависит от системного таймера Windows и может иметь
            заметную погрешность, lSleep использует высокоточный таймер и позволяет выдерживать паузы
            значительно точнее.

            s_time = Время ожидания в миллисекундах.

            В качестве второго параметра start можно указать временную метку, ранее сохраненную через
            TimeStamp(). В этом случае отсчет времени будет вестись от указанной метки, а не от момента
            вызова lSleep(). Это удобно когда нужно гарантировать выполнение действия через строго
            определенное время после начала последовательности операций.
        */
        ;Critical
        DllCall("QueryPerformanceCounter", "Int64*", CounterBefore)
        CounterBefore := start != "" ? start : CounterBefore
        if (s_time > 40) {
            DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
            ;Critical Off
            Sleep % (s_time - (1000 * (CounterAfter - CounterBefore) / Frequency)) - 20
        }
        ;Critical
        End := (CounterBefore + ( Frequency * (s_time/1000))) - 1
        loop
            DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
        Until (End <= CounterAfter)
        ;Critical Off
    }

    fSleep(QuantityFPS, s_time = 0, ByRef start = "") {
        /*
            fSleep работает аналогично lSleep, но позволяет задавать паузу в кадрах вместо миллисекунд.
            
            Для работы функции необходимо указать средний FPS игры в переменной SettingFPS
            (обычно задается в Settings.ahk), иначе будет принято значение по умолчанию в 60 FPS.
            
            QuantityFPS = Количество кадров ожидания.
            s_time      = Дополнительное время ожидания в миллисекундах.
            start       = Временная метка из TimeStamp(). Работает аналогично параметру start в lSleep().
        */
        ;Critical
        DllCall("QueryPerformanceCounter", "Int64*", CounterBefore)
        CounterBefore := start != "" ? start : CounterBefore    
        f_time := (OneFrameTime * QuantityFPS) + s_time
        if (f_time > 40) {
            DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
            ;Critical Off
            Sleep % (f_time - (1000 * (CounterAfter - CounterBefore) / Frequency)) - 20
        }
        ;Critical
        End := (CounterBefore + ( Frequency * (f_time/1000))) - 1
        loop
            DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
        Until (End <= CounterAfter)
        ;Critical Off
    }

;;;;;;;;;; Other functions ;;;;;;;;;;
    TimeStamp(ByRef StampName = "") {
        /*
            TimeStamp создает и сохраняет временную метку текущего момента времени.

            Метка может быть сохранена в переменную через параметр StampName или получена через Return.
            Полученные метки можно использовать в функциях lSleep, fSleep и TimePassed для измерения
            времени между событиями или выполнения действий по точному таймеру.

            StampName = Переменная для сохранения временной метки.
        */
        DllCall("QueryPerformanceCounter", "Int64*", StampName)
        Return StampName					
    }

    TimePassed(Start, End = "", TimeType = "ms") {
        /*
            TimePassed возвращает время между двумя временными метками.

            Если указан только параметр Start, функция вернет время от этой метки до текущего момента.
            Если указаны Start и End, будет возвращено время между двумя метками.

            Start    = Начальная временная метка.
            End      = Конечная временная метка.
            TimeType = Формат возвращаемого значения:
                       "ms"  - миллисекунды (по умолчанию).
                       "sec" - секунды.

            Если Start новее End, будет возвращено отрицательное значение.
        */
        DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
        CounterAfter := End != "" ? End : CounterAfter
        if (TimeType = "ms")
            Return Round(((CounterAfter - Start) / Frequency) * 1000, 3)
        if (TimeType = "sec")
            Return Round((CounterAfter - Start) / Frequency, 3)
    }

    WorldTimeStamp(ByRef StampName = "") {
        /*
            WorldTimeStamp создает временную метку на основе мирового времени (UTC).
            В отличие от TimeStamp, данная функция не зависит от времени запуска скрипта и может
            использоваться для сравнения времени между разными скриптами или даже разными компьютерами.

            Метка представляет собой количество времени, прошедшее с 1 января 1970 года (UTC).

            StampName = Переменная для сохранения временной метки.
        */
        DllCall("GetSystemTimeAsFileTime", "Int64P", A_Stamp)
        Return StampName := A_Stamp - 116444736000000000
    }

    WorldTimePassed(Start, End = "", TimeType = "ms") {
        /*
            WorldTimePassed работает аналогично TimePassed, но использует временные метки,
            полученные через WorldTimeStamp().

            Если указан только параметр Start, функция вернет время от этой метки до текущего момента.
            Если указаны Start и End, будет возвращено время между двумя метками.

            Start    = Начальная временная метка.
            End      = Конечная временная метка.
            TimeType = Формат возвращаемого значения:
                       "ms"  - миллисекунды (по умолчанию).
                       "sec" - секунды.

            Если Start новее End, будет возвращено отрицательное значение.
        */
        DllCall("GetSystemTimeAsFileTime", "Int64P", CounterAfter)
        CounterAfter := End != "" ? End : (CounterAfter - 116444736000000000)
        if (TimeType = "ms")
            Return Round(((CounterAfter - Start) / Frequency) * 1000, 3)
        if (TimeType = "sec")
            Return Round((CounterAfter - Start) / Frequency, 3)
    }