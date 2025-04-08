contract OnlyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;

    init() {
        self.a = null;
        self.b = 42;
        self.c = null;
        self.d = 100;
    }
}