struct InnerMost {
    val1: Int;
    val2: Int;
}

struct Middle {
    inner: InnerMost;
    optInner: InnerMost?;
}

struct Outer {
    mid: Middle;
    optMid: Middle?;
}

contract NestedOptionalStructs {
    outer: Outer;

    init() {
        self.outer = Outer{
            mid: Middle{inner: InnerMost{val1:1, val2:2}, optInner: null},
            optMid: null,
        };
    }
}