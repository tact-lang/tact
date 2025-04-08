struct Inner {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    inner: Inner;

    init() {
        self.inner = Inner{ val1: 123, val2: true };
    }
}