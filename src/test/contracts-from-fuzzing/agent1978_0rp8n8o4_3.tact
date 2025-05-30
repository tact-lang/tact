struct Complex {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract TestContract {
    data: Complex;
    
    init() {
        self.data = Complex{
            intVal: 1,
            boolVal: true,
            strVal: "hello",
            optInt: 42,
            optBool: false,
            optStr: "world"
        };
    }
}
