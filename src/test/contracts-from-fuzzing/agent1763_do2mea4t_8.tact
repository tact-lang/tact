contract OptionalStructFieldDirect {
    a: Int?;
    b: Address?;
    c: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}