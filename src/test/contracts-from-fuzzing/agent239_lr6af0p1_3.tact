struct OptionalFields {
    foo: Int?;
    bar: Bool?;
    s: String?;
}

contract OptionalStructFieldContract {
    some: OptionalFields;

    init() {
        self.some = OptionalFields{ foo: null, bar: null, s: null };
    }
}