struct OptionalNest {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalNestedField {
    nested: OptionalNest;

    init() {
        self.nested = OptionalNest{
            a: null,
            b: null,
            c: null,
        };
    }
}