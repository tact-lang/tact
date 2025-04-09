struct MixedOptional {
    basic: Int;
    optInt: Int?;
    optBool: Bool?;
    reqStr: String;
    optStr: String?;
}

contract MixedOptionalComplex {
    mopt: MixedOptional;

    init() {
        self.mopt = MixedOptional{
            basic: 99,
            optInt: null,
            optBool: false,
            reqStr: "abc",
            optStr: null,
        };
    }
}