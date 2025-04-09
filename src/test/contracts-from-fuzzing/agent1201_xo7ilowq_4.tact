struct Inner {
    val: Int?;
}

contract TestContract {
    inner: Inner;

    init() {
        self.inner = Inner{ val: null };
    }
}