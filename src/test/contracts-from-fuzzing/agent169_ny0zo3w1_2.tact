struct Inner {
    flag: Bool;
    count: Int;
}

contract TestContract {
    inner: Inner;

    init() {
        self.inner = Inner{ flag: true, count: 5 };
    }
}