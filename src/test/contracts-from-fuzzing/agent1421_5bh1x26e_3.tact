struct Inner {
    value: Int;
}

struct Middle {
    inner: Inner;
}

contract NestedLevels {
    middle: Middle;

    init() {
        self.middle = Middle{ inner: Inner{ value: 123 } };
    }
}