struct Inner {
    val: Int;
}

contract NullableStructField {
    inner: Inner?;

    init() {
        self.inner = null;
    }
}
