contract OptionalFields {
    x: Int?;
    b: Bool?;
    a: Address?;
    s: String?;

    init() {
        self.x = null;
        self.b = null;
        self.a = null;
        self.s = null;
    }
}