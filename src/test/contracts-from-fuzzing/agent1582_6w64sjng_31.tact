contract OptionalMixDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    init() {
        self.a = 5;
        self.b = null;
        self.c = "hi";
    }
}