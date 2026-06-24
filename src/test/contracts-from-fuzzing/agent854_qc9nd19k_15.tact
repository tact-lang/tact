struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    inner: Inner;
    init() {
        self.inner = Inner{ foo: 99, bar: true };
    }
}
