struct Inner {
    flag: Bool;
}

contract OptionalStructField {
    inner: Inner?;

    init() {
        self.inner = null;
    }
}