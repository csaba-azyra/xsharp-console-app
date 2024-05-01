// Car.prg
// Created by    : Csaba.Benko
// Creation Date : 4/30/2024 8:59:27 PM
// Created for   :
// WorkStation   : DevUser-20


USING System
USING System.Collections.Generic
USING System.Text

BEGIN NAMESPACE ConsoleApplication1

	/// <summary>
    /// The Car class.
    /// </summary>
CLASS Car INHERIT Vehicle
    
    PUBLIC PROPERTY Seats AS INT AUTO

        CONSTRUCTOR(_color AS STRING, _make AS STRING, _model AS STRING, _seats AS INT)
            SUPER(_color, _make, _model)
            
            IF _seats < 1 || _seats > 8 || _seats == 3 || _seats ==6 
                LOCAL ex AS ArgumentException
                ex := ArgumentException{"Not allowed seat number"}
                THROW ex
            ENDIF
            
            Seats := _seats
            
         RETURN

	END CLASS
END NAMESPACE // ConsoleApplication1