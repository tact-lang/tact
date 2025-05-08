struct SInner {
    f1: Int;
    f2: Bool;
}

struct SOuter {
    wrap1: SInner;
    wrap2: SInner;
    optInt: Int?;
}

contract MultiStructComb {
    packed: SOuter;

    init() {
        self.packed = SOuter{
            wrap1: SInner{ f1: 1, f2: true },
            wrap2: SInner{ f1: 2, f2: false },
            optInt: null
        };
    }
}