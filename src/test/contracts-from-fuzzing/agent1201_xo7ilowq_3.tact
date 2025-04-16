struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    inner: Inner?;

    init() {
        self.inner = null;
    }
}