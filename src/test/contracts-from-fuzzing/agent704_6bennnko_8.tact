struct InnerMost {
    value: Int?;
}

struct Inner {
    nested: InnerMost?;
}

struct Middle {
    inner: Inner?;
}

struct Outer {
    middle: Middle?;
}

contract DeepOptionals {
    outer: Outer;

    init() {
        self.outer = Outer{middle: Middle{inner: Inner{nested: InnerMost{value: 42}}}};
    }
}