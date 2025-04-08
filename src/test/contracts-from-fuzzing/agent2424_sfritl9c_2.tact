struct Inner {
    a: Int;
    b: Bool?;
}

struct Middle {
    inner: Inner;
    optInner: Inner?;
}

struct Outer {
    mid: Middle;
    optMid: Middle?;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inner: Inner{ a: 1, b: true },
                optInner: null,
            },
            optMid: null,
        };
    }
}