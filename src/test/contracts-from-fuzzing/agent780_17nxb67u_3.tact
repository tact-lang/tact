struct OptionalStructField {
    a: Int;
    b: Bool;
}

contract OptionalStructHolder {
    field: OptionalStructField?;

    init() {
        self.field = null;
    }
}