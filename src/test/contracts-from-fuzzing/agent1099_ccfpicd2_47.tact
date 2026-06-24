contract OptionalDefaultTesting {
    a: Int? = null;
    b: Bool? = null;

    init() {
        self.a = 55;
        self.b = true;
    }
}