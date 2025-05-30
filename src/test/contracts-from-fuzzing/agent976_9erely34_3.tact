struct InnerOpt {
    x: Int?;
}

contract OptionalNestedField {
    nested: InnerOpt;
    init() {
        self.nested = InnerOpt{}; // x should default to null
    }
}