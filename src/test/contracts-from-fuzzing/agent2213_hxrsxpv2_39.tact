struct SInner {
    ai: Int;
    ab: Bool;
}

struct SOuter {
    s1: SInner;
    s2: SInner;
}

contract WideNest {
    f: SOuter;

    init() {
        self.f = SOuter{
            s1: SInner{ ai:1, ab:true },
            s2: SInner{ ai:2, ab:false },
        };
    }
}
