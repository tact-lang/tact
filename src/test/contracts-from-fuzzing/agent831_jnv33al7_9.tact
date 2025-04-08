contract OptFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;

    init() {
        self.a = null;
        self.b = true;
        self.c = "text";
        self.d = null;
    }
}