struct Inner {
    value: Int?;
}

contract OptionalInStructTest {
    inner: Inner;

    init() {
        self.inner = Inner{ value: null };
    }
}