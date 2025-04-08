struct DeepNest {
    lvl1: Int;
    lvl2: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract UseDeepNest {
    d: DeepNest;

    init() {
        self.d = DeepNest{
            lvl1: 42,
            lvl2: Inner{ a: 1, b: true, c: "deep" }
        };
    }
}