struct Complex {
    intVal: Int;
    strVal: String;
    optInt: Int?;
    optStr: String?;
    flag: Bool;
}

contract Test {
    data: Complex;

    init() {
        self.data = Complex{
            intVal: 42,
            strVal: "hello",
            optInt: null,
            optStr: null,
            flag: false,
        };
    }
}