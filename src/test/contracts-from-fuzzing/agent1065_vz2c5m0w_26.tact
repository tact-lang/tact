struct SLevel {
    valInt: Int;
    valBool: Bool;
    valStr: String;
    valOpt: Int?;
}

contract OptionalAndRegularMix {
    f1: SLevel;
    f2: SLevel;

    init() {
        self.f1 = SLevel{
            valInt: 111,
            valBool: true,
            valStr: "x",
            valOpt: null
        };
        self.f2 = SLevel{
            valInt: 222,
            valBool: false,
            valStr: "y",
            valOpt: 3
        };
    }
}
