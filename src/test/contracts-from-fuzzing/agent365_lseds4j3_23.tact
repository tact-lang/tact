struct Complex {
    num: Int;
    text: String;
    optInt: Int?;
    optStr: String?;
    boolFlag: Bool;
}

contract MixedTypes {
    complex: Complex;

    init() {
        self.complex = Complex{
            num: 123,
            text: "str",
            optInt: null,
            optStr: null,
            boolFlag: true
        };
    }
}