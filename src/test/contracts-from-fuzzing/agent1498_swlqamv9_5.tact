struct InnerMost {
    z: Bool;
}

struct Mid {
    m: Int;
    deep: InnerMost?;
}

struct OuterNest {
    w: Int;
    n: Mid?;
}

contract OptionalDeepNest {
    data: OuterNest;

    init() {
        self.data = OuterNest{
            w: 42,
            n: null,
        };
    }
}