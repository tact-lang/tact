struct Inner {
    num: Int as uint8;
    flag: Bool;
}

contract InnerSerialization {
    inner: Inner;

    init() {
        self.inner = Inner{ num: 100, flag: true };
    }
}