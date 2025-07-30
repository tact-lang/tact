struct OptionalInner {
    x: Int;
    y: Bool;
}

contract OptionalStructField {
    val: OptionalInner?;

    init() {
        self.val = null;
    }
}
