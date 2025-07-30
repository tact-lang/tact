contract OnlyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}