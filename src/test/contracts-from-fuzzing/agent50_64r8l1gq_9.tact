struct OptionalNestedFields {
    foo: Int?;
    bar: Bool?;
}

contract NullablePersistence {
    a: OptionalNestedFields?;

    init() {
        self.a = null;
    }
}