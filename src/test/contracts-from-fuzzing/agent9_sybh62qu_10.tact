contract OptionalTopLevels {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: Bool?;

    init() {
        self.a = 5;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = false;
    }
}