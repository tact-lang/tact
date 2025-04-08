struct OptFields {
    a: Bool?;
    b: Int?;
    c: String?;
}

contract OptStorage {
    f: OptFields = OptFields{ a: null, b: null, c: null };
}