struct NestedOptionalStruct {
    inner: String?;
    number: Int;
}

contract OptionalStructField {
    nested: NestedOptionalStruct?;

    init() {
        self.nested = null;
    }
}