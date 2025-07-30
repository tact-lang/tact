struct InnerMost {
    val: Int;
}

struct Inner {
    im: InnerMost;
}

struct Middle {
    inn: Inner;
}

struct Outer {
    mid: Middle;
}

contract DeepNest {
    field: Outer;

    init() {
        self.field = Outer{
            mid: Middle{
                inn: Inner{
                    im: InnerMost{
                        val: 42
                    }
                }
            }
        };
    }
}