struct Inner {
    a: Int;
    b: Bool;
}

contract Deep1 {
    inner: Inner;
    init() {
        self.inner = Inner{a: 1, b: true};
    }
}