struct Inner {
    f1: Int;
    f2: Bool;
}

contract TestContract {
    inner: Inner;

    init() {
        self.inner = Inner{
            f1: 100,
            f2: true,
        };
    }
}