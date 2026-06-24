contract TestDeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inner: Inner{
                    val1: 1,
                    val2: 2,
                },
                optInner: null,
            },
            optMid: null,
        };
    }
}

struct Outer {
    mid: Middle;
    optMid: Middle?;
}

struct Middle {
    inner: Inner;
    optInner: Inner?;
}

struct Inner {
    val1: Int;
    val2: Int;
}
