struct OptionalNested {
    inn: Int?;
}

contract OptionalField {
    nested: OptionalNested?;

    init() {
        self.nested = null;
    }
}