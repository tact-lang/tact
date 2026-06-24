struct Complex {
    intField: Int;
    boolField: Bool;
    strField: String;
    optInt: Int?;
    optBool: Bool?;
}

contract ComplexStructContract {
    data: Complex;

    init() {
        self.data = Complex{
            intField: 99,
            boolField: false,
            strField: "hello",
            optInt: null,
            optBool: true
        };
    }
}