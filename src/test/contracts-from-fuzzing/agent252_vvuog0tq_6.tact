struct Inner {
    x: Int;
    y: Bool;
}

struct Middle {
    inner1: Inner;
    inner2: Inner;
    optInner: Inner?;
}

struct Outer {
    m1: Middle;
    m2: Middle;
    optMiddle: Middle?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            m1: Middle{
                inner1: Inner{ x:1, y:true },
                inner2: Inner{ x:2, y:false },
                optInner: null
            },
            m2: Middle{
                inner1: Inner{ x:3, y:true },
                inner2: Inner{ x:4, y:false },
                optInner: null
            },
            optMiddle: null
        };
    }
}