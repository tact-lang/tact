contract OptionalWithDefaults {
    a: Int? = null;
    b: Int? = 0;

    init() {
        self.a = 1;
        self.b = null;
    }
}