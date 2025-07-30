contract AlternateDefaults {
    a: Int = 3;
    b: Bool? = null;
    c: String? = "abc";

    init() {
        self.a = 7;
        self.b = true;
        self.c = null;
    }
}