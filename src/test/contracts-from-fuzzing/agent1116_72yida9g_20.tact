struct SInner {
    val: Int;
}

contract OptionalStructField {
    st: SInner?;

    init() {
        self.st = null;
    }
}
