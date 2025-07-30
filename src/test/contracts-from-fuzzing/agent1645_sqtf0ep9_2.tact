struct Inner {
    a: Int;
    b: Bool;
}

contract NestedStructContract {
    inner: Inner;

    init() {
        self.inner = Inner{ a: 5, b: true };
    }
}