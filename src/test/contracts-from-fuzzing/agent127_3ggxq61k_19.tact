struct OptionalNestedStruct {
    x: Int?;
    y: Int?;
}

contract OptionalNestedStructField {
    nested: OptionalNestedStruct?;

    init() {
        self.nested = null;
    }
}