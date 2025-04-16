struct InnerMost {
    value: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    middle: Middle;
}

contract DeepNest {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: InnerMost{
                    value: 42
                }
            }
        };
    }
}