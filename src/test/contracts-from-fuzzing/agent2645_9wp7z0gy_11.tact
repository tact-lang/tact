struct InnerMost {
    x: Int;
    y: String;
}

struct Inner {
    innerMost: InnerMost;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract DeepHierarchy {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{
                    innerMost: InnerMost{
                        x: 5,
                        y: "deep",
                    },
                },
            },
        };
    }
}
