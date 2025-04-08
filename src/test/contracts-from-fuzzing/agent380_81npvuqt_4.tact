struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalTest {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{ a: null, b: null, c: null };
    }
}