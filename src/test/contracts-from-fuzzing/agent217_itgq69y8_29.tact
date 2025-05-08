struct MixedOptional {
    i1: Int;
    i2: Int?;
    b1: Bool;
    b2: Bool?;
    s1: String;
    s2: String?;
}

contract MixedOptVars {
    field: MixedOptional;

    init() {
        self.field = MixedOptional{
            i1: 1,
            i2: null,
            b1: true,
            b2: null,
            s1: "hi",
            s2: null
        };
    }
}