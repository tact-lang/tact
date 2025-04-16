struct IntS {
    val: Int;
}

struct BoolS {
    val: Bool;
}

struct StrS {
    val: String;
}

contract NestedMix {
    i: IntS;
    b: BoolS;
    s: StrS;

    init() {
        self.i = IntS{ val: 1 };
        self.b = BoolS{ val: true };
        self.s = StrS{ val: "s" };
    }
}