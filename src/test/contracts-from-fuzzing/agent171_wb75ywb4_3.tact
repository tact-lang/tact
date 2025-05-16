struct OptionalFields {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
    text: String?;
}

contract TestOptional {
    data: OptionalFields;
    init() {
        self.data = OptionalFields{ foo: null, bar: null, baz: null, text: null };
    }
}