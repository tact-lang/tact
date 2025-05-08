contract AllOptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = 123;
        self.e = false;
        self.f = "hi";
    }
}
