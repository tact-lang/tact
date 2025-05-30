contract OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        self.a = 10;
        self.b = false;
        self.c = null;
    }
}