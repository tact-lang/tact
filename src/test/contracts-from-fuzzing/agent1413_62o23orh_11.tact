struct Complex {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract MixedTypes {
    data: Complex;
    init() {
        self.data = Complex{
            intVal: 1,
            boolVal: true,
            strVal: "Hi",
            optInt: null,
            optBool: false,
            optStr: null
        };
    }
}