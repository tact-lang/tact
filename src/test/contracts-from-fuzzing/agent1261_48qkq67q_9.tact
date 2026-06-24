struct MixLevels {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
}

contract NestedMix {
    s: MixLevels;
    i: Int;
    b: Bool;
    s2: MixLevels;

    init() {
        self.s = MixLevels{ a: 1, b: null, c: "hi", d: null };
        self.i = 10;
        self.b = true;
        self.s2 = MixLevels{ a: 2, b: false, c: "yo", d: 99 };
    }
}