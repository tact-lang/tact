contract OnlyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}