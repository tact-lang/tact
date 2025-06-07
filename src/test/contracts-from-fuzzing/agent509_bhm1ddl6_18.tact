struct MixA {
    a: Int;
    b: Bool?;
}

struct MixB {
    c: String;
    d: Int?;
}

contract MixNested {
    s1: MixA;
    s2: MixB?;

    init() {
        self.s1 = MixA{ a: 5, b: null };
        self.s2 = null;
    }
}