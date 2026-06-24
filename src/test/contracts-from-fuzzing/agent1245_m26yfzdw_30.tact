struct PrimNest {
    a: Int;
    b: Bool;
    c: String;
}

struct SecondaryNest {
    k: Int;
    inner: PrimNest; 
    flag: Bool;
}

contract NestMix {
    store: SecondaryNest;

    init() {
        self.store = SecondaryNest{
            k: 8,
            inner: PrimNest{ a: 1, b: true, c: "str" },
            flag: false,
        };
    }
}
