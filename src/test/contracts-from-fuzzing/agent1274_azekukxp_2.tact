struct Inner {
    value: Int;
}

contract OptionalNestedField {
    outer: Inner?;

    init() {
        self.outer = null;
    }
}