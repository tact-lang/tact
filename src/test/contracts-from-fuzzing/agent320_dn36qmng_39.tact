contract OnlyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;

    init() {
        self.a = 5;
        self.b = null;
        self.c = true;
    }
}