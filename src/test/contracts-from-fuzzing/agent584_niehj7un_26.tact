struct Combo {
    anInt: Int;
    optInt: Int?;
    aBool: Bool;
    optBool: Bool?;
    str: String;
    optStr: String?;
}

contract MixFields {
    combo: Combo;

    init() {
        self.combo = Combo{
            anInt: 1,
            optInt: null,
            aBool: false,
            optBool: null,
            str: "abc",
            optStr: null
        };
    }
}