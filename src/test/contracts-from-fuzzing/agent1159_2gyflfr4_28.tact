struct Inner {
    val: Int = 7;
}

contract TestContract {
    inner: Inner;

    init() {
        self.inner = Inner{ val: 42 };
    }
}