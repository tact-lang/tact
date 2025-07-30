struct InnerMost {
    y: Int;
}

struct Inner {
    x: InnerMost;
}

contract NestedStructStorage {
    s: Inner;

    init() {
        self.s = Inner{ x: InnerMost{ y: 123 } };
    }
}