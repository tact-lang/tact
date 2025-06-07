contract OnlyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;

    init() {
        self.a = null;
        self.b = 1;
        self.c = null;
        self.d = "hi";
    }
}
