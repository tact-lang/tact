struct P {
    a: Int;
}

struct Q {
    p: P;
}

struct R {
    q: Q;
}

struct S {
    r: R;
}

contract DeepNest {
    s: S;
    init() {
        self.s = S{ r: R{ q: Q{ p: P{ a: 1 } } } };
    }
}