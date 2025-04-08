struct Inner {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract Defaults {
    inner: Inner;

    init() {
        self.inner = Inner{};
    }
}