struct SInner {
    a: Int;
    b: Bool?;
}

struct SOuter {
    x: Int;
    inner1: SInner;
    inner2: SInner;
}

contract ReuseStruct {
    s: SOuter;

    init() {
        self.s = SOuter{
            x: 10,
            inner1: SInner{ a: 1, b: null },
            inner2: SInner{ a: 2, b: null },
        };
    }
}