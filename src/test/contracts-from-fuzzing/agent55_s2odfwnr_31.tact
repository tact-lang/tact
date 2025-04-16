struct ABC {
    a: Int = 1;
    b: Bool = true;
    c: String = "test";
}

struct DEF {
    d: Int = 2;
    e: Bool = false;
    f: String = "other";
}

struct Agg {
    abc: ABC;
    def: DEF;
}

contract NestedMix {
    agg: Agg;

    init() {
        self.agg = Agg{
            abc: ABC{},
            def: DEF{}
        };
    }
}
