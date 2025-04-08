contract OptDefaults {
    a: Int? = 1;
    b: Bool? = null;
    c: String? = "abc";

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
    }
}