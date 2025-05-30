struct Inner {
    y: Int;
}

contract NestedStructInField {
    inner: Inner;

    init() {
        self.inner = Inner{ y: 7 };
    }
}
