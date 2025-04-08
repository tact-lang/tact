struct Inner {
    flag: Bool?;
    text: String?;
}

contract OptionalFields {
    inner: Inner;

    init() {
        self.inner = Inner{ flag: null, text: null };
    }
}