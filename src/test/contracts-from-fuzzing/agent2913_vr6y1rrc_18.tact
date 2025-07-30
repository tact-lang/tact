struct InnerMost {
    value: Int;
}

struct Middle {
    inner: InnerMost;
}

struct OuterMost {
    middle: Middle;
}

struct Wrap {
    outer: OuterMost;
}

contract FourLayers {
    w: Wrap;

    init() {
        self.w = Wrap{
            outer: OuterMost{
                middle: Middle{
                    inner: InnerMost{ value: 100 },
                },
            },
        };
    }
}