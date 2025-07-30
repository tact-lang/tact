struct OptInner {
    val: Int?;
    txt: String?;
}

contract OptionalStructField {
    inner: OptInner?;

    init() {
        self.inner = null;
    }
}
