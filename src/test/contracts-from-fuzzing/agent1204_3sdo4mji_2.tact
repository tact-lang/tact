struct InnerMost {
    a: Int;
}

struct Inner {
    b: Int;
    im: InnerMost;
}

struct Middle {
    c: Int;
    inner: Inner;
}

struct Outer {
    d: Int;
    middle: Middle;
}

contract DeepNest {
    data: Outer;

    init() {
        self.data = Outer{
            d: 9,
            middle: Middle{
                c: 8,
                inner: Inner{
                    b: 7,
                    im: InnerMost{ a: 6 }
                }
            }
        };
    }
}
