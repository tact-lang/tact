struct Inner {
    a: Int;
    b: Int;
}

struct Mid {
    inner1: Inner;
    inner2: Inner;
    optInner: Inner?;
}

struct Top {
    midA: Mid;
    midB: Mid;
}

contract DoubleDeep {
    df: Top;

    init() {
        self.df = Top{
            midA: Mid{
                inner1: Inner{a:1,b:2},
                inner2: Inner{a:3,b:4},
                optInner: null
            },
            midB: Mid{
                inner1: Inner{a:5,b:6},
                inner2: Inner{a:7,b:8},
                optInner: null
            }
        };
    }
}