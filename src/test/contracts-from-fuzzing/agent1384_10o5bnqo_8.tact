struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    middle: Middle;
}

contract DeepNest {
    x: Outer;

    init() {
        self.x = Outer{
            middle: Middle{
                inner: InnerMost{
                    val: 42,
                },
            },
        };
    }
}