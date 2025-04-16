struct Complex {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract MultipleTypes {
    val: Complex;

    init() {
        self.val = Complex{
            intVal: 1,
            boolVal: true,
            strVal: "s",
            optInt: null,
            optBool: false,
            optStr: null
        };
    }
}