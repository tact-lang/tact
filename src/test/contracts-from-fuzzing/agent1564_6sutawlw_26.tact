struct OCInner {
    val: Int;
}

contract OptionalStructField {
    inner: OCInner?;

    init() {
        self.inner = null;
    }
}