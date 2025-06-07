struct OptionalFields {
    foo: Int?;
    bar: Bool?;
}

contract OptionalStructTest {
    s: OptionalFields;
    init() {
        self.s = OptionalFields{ foo: null, bar: true };
    }
}