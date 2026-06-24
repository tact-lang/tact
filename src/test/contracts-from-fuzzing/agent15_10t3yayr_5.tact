struct InnerMost {
    a: Int;
}

struct Middle {
    im: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract DeepNest {
    val: Outer;

    init() {
        self.val = Outer{
            mid: Middle{
                im: InnerMost{
                    a: 100
                }
            }
        };
    }
}