struct Inner {
    x: Int;
    y: Int?;
}

struct Middle {
    in1: Inner;
    in2: Inner;
    optInner: Inner?;
}

struct Outer {
    mid1: Middle;
    mid2: Middle;
    optMid: Middle?;
}

contract MultiLayerNested {
    complexData: Outer;
    init() {
        self.complexData = Outer{
            mid1: Middle{
                in1: Inner{ x: 1, y: null },
                in2: Inner{ x: 2, y: null },
                optInner: null
            },
            mid2: Middle{
                in1: Inner{ x: 3, y: null },
                in2: Inner{ x: 4, y: null },
                optInner: null
            },
            optMid: null
        };
    }
}
