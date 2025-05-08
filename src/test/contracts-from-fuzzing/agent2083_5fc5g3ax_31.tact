contract OptionalStringDefaults {
    s1: String? = null;
    s2: String? = null;

    init() {
        self.s1 = "Hello";
        self.s2 = null;
    }
}
