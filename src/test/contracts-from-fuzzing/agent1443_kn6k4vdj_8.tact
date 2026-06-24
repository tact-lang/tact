struct NestedOpt {
    num: Int?;
    txt: String?;
}

struct DoubleNest {
    f: Int;
    nested: NestedOpt?;
}

contract OptStructs {
    s: DoubleNest;

    init() {
        self.s = DoubleNest{
            f: 55,
            nested: null
        };
    }

    receive() {}
}