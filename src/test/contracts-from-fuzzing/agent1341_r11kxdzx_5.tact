struct MaybeInner {
    val: Int;
}

contract OptionalStructField {
    inner: MaybeInner?;

    init() {
        self.inner = null;
    }
}