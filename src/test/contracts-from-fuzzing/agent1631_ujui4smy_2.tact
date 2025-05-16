struct OptionalNested {
    maybe: Int?;
}

contract OptionalNestedField {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{ maybe: null };
    }
}