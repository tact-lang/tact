struct Combo {
    i: Int;
    b: Bool;
    s: String;
    opti: Int?;
    opts: String?;
    optb: Bool?;
}

contract MixedFields {
    combo: Combo;
    init() {
        self.combo = Combo{
            i: 42,
            b: false,
            s: "Z",
            opti: null,
            opts: null,
            optb: null,
        };
    }
}
