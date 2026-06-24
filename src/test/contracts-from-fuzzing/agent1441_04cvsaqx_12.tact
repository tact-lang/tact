struct Complex {
    intField: Int;
    boolField: Bool;
    strField: String;
    bigInt: Int as uint128;
    optBool: Bool?;
    optInt: Int?;
    optStr: String?;
}

contract SerialFormats {
    d: Complex;

    init() {
        self.d = Complex{
            intField: 42,
            boolField: true,
            strField: "hey",
            bigInt: 12345,
            optBool: null,
            optInt: null,
            optStr: null,
        };
    }
}