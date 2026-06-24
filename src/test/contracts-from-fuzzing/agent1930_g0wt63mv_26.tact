struct SInner {
    p: Int;
}

struct SOuter {
    q: Int;
    s: SInner;
}

contract MultipleStructs {
    si: SInner;
    so: SOuter;

    init() {
        self.si = SInner{ p: 5 };
        self.so = SOuter{ q: 6, s: SInner{ p: 7 } };
    }
}