contract OptionalMixDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Int? = null;

    init() {
        self.a = 5;
        self.b = true;
        self.c = null;
    }
}