struct Inner {
    a: Int = 1;
    b: String = "x";
    c: Bool?;
}

contract OptionalDefaultMix {
    inner: Inner;

    init() {
        self.inner = Inner { c: null };
    }

    receive() {}
}