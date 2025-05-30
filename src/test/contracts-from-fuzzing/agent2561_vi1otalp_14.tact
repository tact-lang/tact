struct DeepNest {
    f1: Int;
    f2: Bool;
    f3: String?;
}

struct MidNest {
    d1: DeepNest?;
    d2: DeepNest;
}

contract NestedComplex {
    middle: MidNest;
    init() {
        self.middle = MidNest{
            d1: null,
            d2: DeepNest{ f1: 5, f2: true, f3: null }
        };
    }
}