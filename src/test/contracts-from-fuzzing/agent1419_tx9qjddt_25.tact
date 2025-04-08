contract LargeOptionalFields {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: String?;
    f: Address?;

    init() {
        self.a = null;
        self.b = 1;
        self.c = null;
        self.d = false;
        self.e = "abc";
        self.f = null;
    }
}