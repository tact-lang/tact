struct InnerMost { val: Int }

struct Inner {
    nested: InnerMost;
}

struct Middle {
    nested: Inner;
}

struct Outer {
    nested: Middle;
}

contract DeepNest {
    data: Outer;

    init() {
        self.data = Outer{nested: Middle{nested: Inner{nested: InnerMost{val: 123}}}};
    }
}
