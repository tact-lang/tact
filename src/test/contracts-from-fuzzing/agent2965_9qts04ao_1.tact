struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    inner: Inner;

    init() {
        self.inner = Inner{a: 1, b: true};
    }
}
