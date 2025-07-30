struct Inner {
    a: Int;
}

contract TestContract {
    inner: Inner?;
    init() {
        self.inner = Inner{ a: 5 };
    }
}