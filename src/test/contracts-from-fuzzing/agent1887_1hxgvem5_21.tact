contract OptionalDefaultsMix {
    a: Int? = null;
    b: Int?;
    c: Bool? = false;
    d: Bool?;

    init() {
        self.b = 42;
        self.d = true;
    }
}