struct InnerMost {
    a: Int;
    b: Bool;
}

struct Inner {
    x: Int?;
    y: InnerMost;
}

struct Outer {
    first: Inner;
    second: Int;
    maybeThird: InnerMost?;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            first: Inner{
                x: null,
                y: InnerMost{
                    a: 1,
                    b: true,
                },
            },
            second: 42,
            maybeThird: null,
        };
    }
}
