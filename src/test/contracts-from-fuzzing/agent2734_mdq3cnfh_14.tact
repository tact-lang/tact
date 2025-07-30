contract OptDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = null;

    init() {
        self.a = 55;
        self.b = false;
        self.c = "test";
    }
}