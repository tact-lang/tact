struct MidOpt {
    f1: Int;
    f2: Int?
}

struct OuterOpt {
    nested: MidOpt?;
    f3: Bool;
}

contract OptMidOuter {
    s: OuterOpt;

    init() {
        self.s = OuterOpt{
            nested: MidOpt{ f1: 42, f2: null },
            f3: true
        };
    }
}
