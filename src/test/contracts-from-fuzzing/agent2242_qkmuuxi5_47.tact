contract OptionalReorder {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        self.b = true;
        self.c = "abc";
        self.a = 55;
        self.a = null;
        self.c = null;
    }
}