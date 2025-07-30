contract OptionalOverrides {
    a: Int = 0;
    b: Int?;
    c: Bool? = null;

    init() {
        self.a = 1;
        self.b = null;
        self.c = null;
    }
}
