struct OptionalNestedStruct {
    inner: Int?;
}

contract OptionalStructField {
    field: OptionalNestedStruct?;

    init() {
        self.field = null;
    }
}
