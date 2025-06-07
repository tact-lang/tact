struct OptionalFields {
    foo: Int?;
    bar: Bool?;
}

contract OptStructPersist {
    stored: OptionalFields;

    init() {
        self.stored = OptionalFields{ foo: null, bar: true };
    }
}