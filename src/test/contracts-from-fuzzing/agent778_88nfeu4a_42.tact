contract OptionalInitVals {
    a: Int?;
    b: Bool?;
    c: Int?;

    init() {
        self.a = null;
        self.b = null;
        self.c = 5;
    }
}