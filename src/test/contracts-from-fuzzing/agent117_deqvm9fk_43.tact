struct InnerMost {
    x: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    middle: Middle;
}

contract DeeplyNested {
    data: Outer;

    init() {
        self.data = Outer{middle: Middle{inner: InnerMost{x: 7}}};
    }
}
