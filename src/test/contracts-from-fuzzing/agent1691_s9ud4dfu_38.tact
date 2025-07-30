struct OuterMost {
    nested: Outer;
}

struct Outer {
    nested: Middle;
}

struct Middle {
    nested: Inner;
}

struct Inner {
    x: Int;
}

contract FourLayerContract {
    val: OuterMost;

    init() {
        self.val = OuterMost{
            nested: Outer{
                nested: Middle{
                    nested: Inner{
                        x: 123
                    }
                }
            }
        };
    }
}