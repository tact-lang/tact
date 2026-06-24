struct Inner {
    value: Int;
}

contract NestedStructStorage {
    s: Inner;

    init() {
        self.s = Inner{ value: 7 };
    }
}