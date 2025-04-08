struct Inner {
    a: Int;
    b: Int?;
}

contract TestContract {
    inner: Inner;

    init() {
        self.inner = Inner{
            a: 5,
            b: null,
        };
    }
}