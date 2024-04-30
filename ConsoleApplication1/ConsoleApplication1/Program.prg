// Program.prg
// Created by    : Csaba.Benko
// Creation Date : 4/30/2024 12:17:37 PM
// Created for   : 
// WorkStation   : DevUser-17

USING System
USING System.Collections.Generic
USING System.Linq
USING System.Text


FUNCTION Start() AS VOID STRICT
    ? "Hello World! Today is ",Today()
    
    LOCAL TestVehicle AS Vehicle
    TestVehicle := Vehicle{"Red", "Ford", "Focus"}
    ? "Make: ", TestVehicle:Make, "Vehicle number: ", TestVehicle:VehicleNumber
    WAIT
    RETURN
    
    
CLASS Vehicle
    PRIVATE STATIC VehicleNumberSeed := 1 AS INT
    PUBLIC VehicleNumber := 0 AS INT
    
    PRIVATE PROPERTY Colour AS STRING AUTO  
    PUBLIC PROPERTY Make AS STRING AUTO
    PRIVATE PROPERTY Model AS STRING AUTO
    
    CONSTRUCTOR(_color AS STRING, _make AS STRING, _model AS STRING)
        VehicleNumber := VehicleNumberSeed++
        Colour := _color
        Make := _make
        Model := _model
    END CONSTRUCTOR
END CLASS

CLASS Car INHERIT Vehicle
    CONSTRUCTOR(_color AS STRING, _make AS STRING, _model AS STRING)
        ::base(_color, _make, _model)
        
    END CONSTRUCTOR
END CLASS

S