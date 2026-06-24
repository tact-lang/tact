struct SInner {
    v: Int;
}

struct SOuter {
    i1: SInner;
    i2: SInner;
}

contract MultipleInner {
    val: SOuter;

    init() {
        self.val = SOuter {
            i1: SInner { v: 1 },
            i2: SInner { v: 2 }
        };
    }
}