struct DeepNest {
    a: Int;
    b: Int?;
    c: Inner;
}

struct Inner {
    d: Int;
    e: InnerMost;
}

struct InnerMost {
    f: Bool;
    g: String?;
}

contract TestContract {
    nest: DeepNest;

    init() {
        self.nest = DeepNest{
            a: 1,
            b: null,
            c: Inner{
                d: 2,
                e: InnerMost{
                    f: true,
                    g: null,
                }
            }
        };
    }
}
