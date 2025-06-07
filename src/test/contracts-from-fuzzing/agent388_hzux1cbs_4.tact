struct OptionalInner {
    a: Int;
}

contract OptionalStructField {
    field: OptionalInner?;

    init() {
        self.field = null;
    }
}