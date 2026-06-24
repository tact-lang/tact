struct Inner {
    value: Int;
}

contract TestContract {
    inner: Inner;

    init() {
        self.inner = Inner{ value: 42 };
    }
}