struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    inner: Inner;

    init() {
        self.inner = Inner{
            a: 7,
            b: true,
        };
    }
}