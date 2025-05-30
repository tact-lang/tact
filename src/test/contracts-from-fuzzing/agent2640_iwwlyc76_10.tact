struct BoolNest {
    a: Bool;
    b: Bool?;
    c: Inner;
}

struct Inner {
    d: Bool;
    e: Bool?;
    f: InnerMost;
}

struct InnerMost {
    g: Bool;
    h: Bool?;
}

contract TestContract {
    bools: BoolNest;

    init() {
        self.bools = BoolNest{
            a: true,
            b: null,
            c: Inner{
                d: false,
                e: true,
                f: InnerMost{
                    g: false,
                    h: null
                }
            }
        };
    }
}
