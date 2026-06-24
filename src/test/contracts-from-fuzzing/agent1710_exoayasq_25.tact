struct Complex {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract Test {
    complex: Complex;

    init() {
        self.complex = Complex{
            intVal: 42,
            boolVal: true,
            strVal: "test",
            optInt: null,
            optBool: null,
            optStr: null
        };
    }
}