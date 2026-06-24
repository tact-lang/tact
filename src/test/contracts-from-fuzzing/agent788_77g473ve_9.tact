contract OnlyOptionalFields {
    a: Int?;
    b: Bool?;
    c: Int?;

    init() {
        self.a = null;
        self.b = true;
        self.c = 5;
    }
}
