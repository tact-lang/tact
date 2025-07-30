struct OptInner {
    val: Int? = null;
}

contract DefaultOptField {
    inner: OptInner? = null;

    init() {
        self.inner = null;
    }
}