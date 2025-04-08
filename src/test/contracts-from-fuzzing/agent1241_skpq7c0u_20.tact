contract OptionalDefault {
    a: Int?;
    b: Int = 0;
    c: Int?;
    d: Int = 1;

    init() {
        self.a = null;
        self.c = null;
    }
}
