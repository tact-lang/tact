struct InnerMost {
    u: Int;
}

struct Inner {
    s: InnerMost;
    t: String;
}

struct Middle {
    inner: Inner;
    b: Bool;
}

contract MultiDeep {
    m: Middle;

    init() {
        self.m = Middle{
            inner: Inner{
                s: InnerMost{u: 42},
                t: "test",
            },
            b: true,
        };
    }
}