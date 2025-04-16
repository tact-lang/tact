struct InnerMost {
    w: Int;
}

struct Inner {
    y: InnerMost;
}

struct Outer {
    x: Inner;
}

contract DeepNestedContract {
    s: Outer;

    init() {
        self.s = Outer{
            x: Inner{
                y: InnerMost{w: 42}
            }
        };
    }
}