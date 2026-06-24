struct InnerMost {
    x: Int;
}

struct Inner {
    a: InnerMost;
}

contract NullableDeepNested {
    data: Inner?;

    init() {
        self.data = null;
    }

    receive() {
        self.data = Inner{a: InnerMost{x: 5}};
    }
}
