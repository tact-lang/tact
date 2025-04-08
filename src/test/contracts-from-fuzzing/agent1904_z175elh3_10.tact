struct InnerMost {
    x: Int;
}

struct Middle {
    inner: InnerMost;
    optInner: InnerMost?;
}

contract Test {
    m: Middle;

    init() {
        self.m = Middle{
            inner: InnerMost{
                x: 1
            },
            optInner: null,
        };
    }
}