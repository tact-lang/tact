struct InnerMost { a: Int; b: Bool }

struct Inner {
    x: Int;
    y: Bool;
    im: InnerMost;
    opt: Bool?
}

struct Middle {
    inner: Inner;
    optInner: Inner?
}

contract DeepNesting {
    data: Middle;

    init() {
        self.data = Middle{
            inner: Inner{
                x: 2,
                y: false,
                im: InnerMost{ a: 99, b: true },
                opt: null
            },
            optInner: null
        };
    }
}