struct OptInner {
    val1: Int;
    val2: Bool;
}

contract OptionalStructField {
    nested: OptInner?;

    init() {
        self.nested = null;
    }
}