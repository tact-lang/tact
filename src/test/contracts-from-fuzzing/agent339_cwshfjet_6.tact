struct InnerMost {
    a: Int;
}

struct Inner {
    b: InnerMost;
}

struct Middle {
    c: Inner;
}

struct Outer {
    d: Middle;
    e: Int;
}

contract DeepContract {
    data: Outer;

    init() {
        self.data = Outer{
            d: Middle{
                c: Inner{
                    b: InnerMost{
                        a: 123
                    }
                }
            },
            e: 456
        };
    }
}