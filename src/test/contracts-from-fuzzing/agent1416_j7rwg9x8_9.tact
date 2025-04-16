// test optional fields at contract top level, all optional init null
contract OptionalFields {
    a: Int?;
    b: String?;
    c: Address?;
    d: Bool?;
    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}