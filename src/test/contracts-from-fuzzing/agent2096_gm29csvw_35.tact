struct SInner {
    a: Int?;
}

struct SOuter {
    b: SInner;
    c: Int;
}

contract InitStructOpt {
    s: SOuter;
    init() {
        self.s = SOuter{ b: SInner{ a: null }, c: 42 };
    }
}