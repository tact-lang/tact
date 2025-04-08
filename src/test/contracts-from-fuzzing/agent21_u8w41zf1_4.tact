struct InnerMost {
    val1: Int;
    val2: Bool;
}

struct Middle {
    optInner: InnerMost?;
    flag: Bool;
}

struct Outer {
    middle: Middle;
    optMiddle: Middle?;
}

contract DeepOptionalNest {
    state: Outer;

    init() {
        self.state = Outer{
            middle: Middle{optInner: null, flag: true},
            optMiddle: null
        };
    }

    receive() {}
}