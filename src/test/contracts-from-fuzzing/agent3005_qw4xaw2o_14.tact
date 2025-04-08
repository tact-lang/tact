struct Mid {
    prim1: Int;
    prim2: Bool;
}

struct OuterOpt {
    m1: Mid?;
    m2: Mid?;
}

contract ComplexOptNested {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{
            m1: null,
            m2: Mid{ prim1: 7, prim2: true }
        };
    }
}