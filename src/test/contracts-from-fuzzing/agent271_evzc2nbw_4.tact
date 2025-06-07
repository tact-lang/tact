struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract OptionalStructTest {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{ a: null, b: null, c: null };
    }
}
