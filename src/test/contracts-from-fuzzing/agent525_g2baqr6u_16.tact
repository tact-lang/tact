contract Test {
    // declaring optional fields with default null
    a: Address?;
    b: String?;
    c: Int?;
    d: Bool?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}