struct InnerOptFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptStorage {
    field: InnerOptFields;

    init() {
        self.field = InnerOptFields{ a: null, b: true, c: null };
    }
}