struct Inner {
    someValue: Int;
}

struct Middle {
    inner: Inner;
    optInner: Inner?;
}

struct Outer {
    middle: Middle;
    optMiddle: Middle?;
}

contract Layers {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{someValue:1},
                optInner: null
            },
            optMiddle: null
        };
    }
}
