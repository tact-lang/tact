struct Inner {
    val: Int?;
}

contract OptionalStructField {
    inner: Inner?;

    init() {
        self.inner = null;
    }
}