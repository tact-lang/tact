struct InnerMost {
    x: Int;
    y: Int;
}

struct Inner {
    a: InnerMost;
    b: InnerMost;
}

struct Middle {
    inner1: Inner;
    inner2: Inner;
}

struct Outer {
    middle: Middle;
}

contract TestContract {
    nestedChain: Outer;

    init() {
        self.nestedChain = Outer{
            middle: Middle{
                inner1: Inner{
                    a: InnerMost{ x: 1, y: 2 },
                    b: InnerMost{ x: 3, y: 4 },
                },
                inner2: Inner{
                    a: InnerMost{ x: 5, y: 6 },
                    b: InnerMost{ x: 7, y: 8 },
                },
            }
        };
    }
}