struct OptionalNested {
    inn: Int?;
}

contract OptionalNestedField {
    data: OptionalNested?;

    init() {
        self.data = null;
    }
}