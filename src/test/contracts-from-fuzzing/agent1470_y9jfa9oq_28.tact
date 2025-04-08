struct InnerMost {
    i: Int;
    s: String?;
}

struct MiddleL {
    nested: InnerMost;
    flag: Bool;
}

contract ComplexNest {
    middle: MiddleL;

    init() {
        self.middle = MiddleL{
            nested: InnerMost{ i:123, s:null },
            flag: true,
        };
    }
}