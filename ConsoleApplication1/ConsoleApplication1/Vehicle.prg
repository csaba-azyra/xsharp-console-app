// Vehicle.prg
// Created by    : Csaba.Benko
// Creation Date : 5/2/2024 12:24:40 PM
// Created for   : 
// WorkStation   : DevUser-20


USING System
USING System.Collections.Generic
USING System.Text

BEGIN NAMESPACE ConsoleApplication1
    
/// <summary>
/// The Vehicle class.
/// </summary>
CLASS Vehicle
    PRIVATE STATIC VehicleNumberSeed := 1 AS INT
    PUBLIC VehicleNumber := 0 AS INT
    
    PUBLIC PROPERTY Wheels AS INT AUTO
    PUBLIC PROPERTY Colour AS STRING AUTO
    PUBLIC PROPERTY Make AS STRING AUTO
    PROTECTED PROPERTY Model AS STRING AUTO
        
    CONSTRUCTOR(_color AS STRING, _make AS STRING, _model AS STRING)
        VehicleNumber := VehicleNumberSeed++
        Colour := _color
        Make := _make
        Model := _model
    END CONSTRUCTOR
    
    PUBLIC METHOD Display AS VOID
        Console.WriteLine("Vehicle display")
        RETURN
    END METHOD
    
    PUBLIC OVERRIDE METHOD ToString AS STRING STRICT
        RETURN "Vehicle display"
    END METHOD
    
END CLASS
END NAMESPACE // ConsoleApplication1