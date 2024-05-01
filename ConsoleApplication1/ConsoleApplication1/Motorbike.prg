// Motorbike.prg
// Created by    : Csaba.Benko
// Creation Date : 5/1/2024 1:25:02 PM
// Created for   :
// WorkStation   : DevUser-20


USING System
USING System.Collections.Generic
USING System.Text

BEGIN NAMESPACE ConsoleApplication1

/// <summary>
/// The Motorbike class.
/// </summary>
CLASS Motorbike INHERIT Vehicle

    CONSTRUCTOR(_color AS STRING, _make AS STRING, _model AS STRING)
        SUPER(_color, _make, _model)
    END CONSTRUCTOR

END CLASS
END NAMESPACE // ConsoleApplication1