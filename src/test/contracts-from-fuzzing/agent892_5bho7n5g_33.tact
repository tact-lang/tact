contract OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = "x";
    }
}