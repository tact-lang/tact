struct InnerMost {
    value: Int;
}

struct Middle {
    inner: InnerMost;
    optInner: InnerMost?;
}

struct Outer {
    mid: Middle;
    optMid: Middle?;
    text: String;
}

contract Test {
    state: Outer;

    init() {
        self.state = Outer{
            mid: Middle{
                inner: InnerMost{value:1},
                optInner: null,
            },
            optMid: null,
            text: "data",
        };
    }
}