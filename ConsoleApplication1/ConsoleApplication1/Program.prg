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

    LOCAL TestVehicle2 AS Vehicle
    TestVehicle2 := Vehicle{"Red", "Ford", "Focus"}
    ? "Make: ", TestVehicle2:Make, "Vehicle number: ", TestVehicle2:VehicleNumber

    LOCAL Car AS Car
    TRY
        Car:= Car{"Red", "Ford", "Focus", 6}
        ? "Make: ", Car:Make, " Vehicle number: ", Car:VehicleNumber, " Seats: ", Car:Seats
    CATCH ex AS Exception
        System.Console.WriteLine(ex:ToString())
    END TRY

    LOCAL Car2 AS Car
    Car2 := Car{"Red", "Ford", "Focus", 4}
    ? "Make: ", Car2:Make, "Vehicle number: ", Car2:VehicleNumber

    LOCAL carList := CarListHandling() AS List<Car>

    Console.WriteLine(e"\n\n")

//     LOCAL carArray AS Car[]
//     carArray := <Car>{carList[0], carList[2]}
    LOCAL carArray AS Vehicle[]
    carArray := <Vehicle>{carList[0], carList[2], Vehicle{"White", "Vehicle", "XS"}}

    FOREACH VAR c IN carArray
//         Console.WriteLine(i"Make: {c:Make}, Color: {c:Colour}, Seats: {c:Seats}")
        Console.WriteLine(i"Make: {c:Make}, Color: {c:Colour}")
    NEXT
    
    FOREACH VAR c IN carArray:ToList<Vehicle>():WHere({c => c IS Car})
        Console.WriteLine(i"{c:Make} is a car")
    NEXT
    
    FOREACH VAR c IN carArray:ToList<Vehicle>():WHere({c => !(c IS Car)})
        Console.WriteLine(i"{c:Make} is not a car")
    NEXT

    WAIT
    RETURN
END FUNCTION

FUNCTION CarListHandling AS List<Car> STRICT
    LOCAL carList AS List<Car>
    carList := List<Car>{}
    //     carList := List<Car>{Car{"Green", "Ford", "Galaxy", 7}}

    carList:Add(Car{"Black", "Wolkswagen", "Golf", 5})
    carList:Add(Car{"Red", "Ford", "Mustang", 4})
    carList:Add(Car{"Blue", "Mazda", "MX 5", 2})
    carList:Add(Car{"Green", "Kia", "Sorrento", 7})
    Console.WriteLine(e"\n\n")


    FOREACH VAR c IN carList
        Console.WriteLine(i"Make: {c:Make}, Color: {c:Colour}, Seats: {c:Seats}")
    NEXT

    LOCAL newList := carList:OrderBy({c => c:Seats}):ToList<Car>() AS List<Car>
    Console.WriteLine(e"\n\nOrdered by seats list:\n")

    FOREACH VAR c IN newList
        Console.WriteLine(i"Make: {c:Make}, Color: {c:Colour}, Seats: {c:Seats}")
    NEXT


    RETURN carList
END FUNCTION


CLASS Vehicle
    PRIVATE STATIC VehicleNumberSeed := 1 AS INT
    PUBLIC VehicleNumber := 0 AS INT

    PUBLIC PROPERTY Colour AS STRING AUTO
    PUBLIC PROPERTY Make AS STRING AUTO
    PROTECTED PROPERTY Model AS STRING AUTO

    CONSTRUCTOR(_color AS STRING, _make AS STRING, _model AS STRING)
        VehicleNumber := VehicleNumberSeed++
        Colour := _color
        Make := _make
        Model := _model
    END CONSTRUCTOR
END CLASS

