struct Complex {
    i: Int;
    flag: Bool;
    text: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    nested: SubComplex;
}

struct SubComplex {
    subI: Int;
    subOpt: Int?;
}

contract ComplexFields {
    storage: Complex;

    init() {
        self.storage = Complex{
            i: 1,
            flag: true,
            text: "hello",
            optInt: null,
            optBool: null,
            optStr: null,
            nested: SubComplex{subI: 99, subOpt: null}
        };
    }
}