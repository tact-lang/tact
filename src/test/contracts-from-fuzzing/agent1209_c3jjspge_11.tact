struct InnerMost {
    x: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    middle: Middle;
}

contract NestedDeep {
    field: Outer;

    init() {
        self.field = Outer { middle: Middle{ inner: InnerMost{ x: 123 } } };
    }
}
