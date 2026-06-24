struct IntWrap {
    value: Int;
}

contract OptStructField {
    inner: IntWrap?;

    init() {
        self.inner = null;
    }
}