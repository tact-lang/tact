struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost;
    optInner: InnerMost?;
}

struct Outer {
    middle: Middle;
    optMiddle: Middle?;
}

contract DeepNestedTest {
    outer: Outer;
    optOuter: Outer?;

    init() {
        self.outer = Outer{
            middle: Middle{
                inner: InnerMost{val: 1},
                optInner: null
            },
            optMiddle: null
        };
        self.optOuter = null;
    }
}