struct OptFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructStorage {
    stuff: OptFields;

    init() {
        self.stuff = OptFields{ a: null, b: null, c: null };
    }
}
