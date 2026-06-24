struct Inner {
    s: String?;
}

contract OptionalStringField {
    inner: Inner;

    init() {
        self.inner = Inner{ s: null };
    }
}