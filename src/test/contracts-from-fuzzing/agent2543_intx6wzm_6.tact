struct Complex {
    i1: Int;
    s1: String;
    b1: Bool;
    optInt: Int?;
    optStr: String?;
    s2: String;
    b2: Bool;
    i2: Int;
    optBool: Bool?;
}

contract Mixed {
    d: Complex;
    init() {
        self.d = Complex{
            i1: 5,
            s1: "hi",
            b1: true,
            optInt: null,
            optStr: null,
            s2: "bye",
            b2: false,
            i2: 7,
            optBool: null
        };
    }
}