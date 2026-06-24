struct Inner {
    x: Int;
    y: Bool;
    z: String?;
}

contract TestContract {
    inner: Inner;
    init() {
        self.inner = Inner{
            x: 42,
            y: false,
            z: null,
        };
    }
}