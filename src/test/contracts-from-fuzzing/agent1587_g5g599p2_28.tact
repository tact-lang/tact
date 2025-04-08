struct IntOpt {
    i: Int?;
}

contract OptionalStructField {
    inner: IntOpt?;

    init() {
        self.inner = null;
    }
}