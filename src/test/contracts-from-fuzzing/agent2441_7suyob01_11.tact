struct OptionalWithNested {
    inside: Int?;
}

contract OptionalNestedField {
    field: OptionalWithNested?;

    init() {
        self.field = null;
    }
}