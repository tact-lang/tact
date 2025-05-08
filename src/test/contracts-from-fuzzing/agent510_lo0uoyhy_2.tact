struct InnerMost {
    z: Int;
    opt: Bool?;
}

struct Inner {
    m: String;
    i: InnerMost;
}

contract DeepNest {
    s: Inner;

    init() {
        self.s = Inner{
            m: "x",
            i: InnerMost{
                z: 99,
                opt: false,
            },
        };
    }
}