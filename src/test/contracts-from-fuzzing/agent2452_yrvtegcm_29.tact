struct NestedOptional {
    maybe: Int?;
}

contract OptionalTopLevel {
    nested: NestedOptional? = null;

    init() {
        self.nested = null;
    }
}