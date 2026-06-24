struct InnerMost {
    val: Int;
}

struct Middle {
    inn: InnerMost;
    optInn: InnerMost?;
}

struct OuterMost {
    mid: Middle;
    optMid: Middle?;
}

contract NestedOptMix {
    d: OuterMost;

    init() {
        self.d = OuterMost{
            mid: Middle{
                inn: InnerMost{ val: 1 },
                optInn: null,
            },
            optMid: null,
        };
    }
}
