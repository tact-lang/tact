struct Inner {
    x: Int;
    y: Bool;
}

contract NestedFields {
    inner: Inner;

    init() {
        self.inner = Inner{ x: 42, y: true };
    }
}