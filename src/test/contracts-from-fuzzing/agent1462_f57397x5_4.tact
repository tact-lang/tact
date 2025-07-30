struct OptionalNest {
    foo: Int?;
    bar: Bool?;
}

contract NullableFields {
    nested: OptionalNest;
    init() {
        self.nested = OptionalNest{ foo: null, bar: true };
    }
}