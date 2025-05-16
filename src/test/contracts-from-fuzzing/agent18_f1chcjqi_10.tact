struct Complex {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract ManyOptionals {
    config: Complex;
    init() {
        self.config = Complex{
            intVal:123,
            boolVal:true,
            strVal:"hi",
            optInt:null,
            optBool:null,
            optStr:null
        };
    }
}