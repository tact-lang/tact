contract OptionalWithDefault {
    i: Int? = null;
    b: Bool? = null;

    init() {
        self.i = 42;
        self.b = false;
    }
}
