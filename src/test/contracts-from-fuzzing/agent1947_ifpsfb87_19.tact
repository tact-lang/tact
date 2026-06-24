struct Nested {
    value: Int?;
}

contract TopOptionalNested {
    nested: Nested?;
    init() {
        self.nested = null;
    }
}