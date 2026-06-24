struct LayerInner {
    val: Int?;
    flag: Bool?;
}

contract OptionalStructAllNull {
    inner: LayerInner?;

    init() {
        self.inner = null;
    }
}