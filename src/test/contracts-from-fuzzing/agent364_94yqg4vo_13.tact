struct OptionalFields {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract DefaultNullOptionals {
    s: OptionalFields;

    init() {
        self.s = OptionalFields{}; // all fields omitted, default nulls
    }
}