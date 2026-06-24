contract OptionalShadow {
    a: Int? = null;
    b: Int?;
    c: Bool? = null;
    d: Bool?;

    init() {
        self.b = null;
        self.d = null;
    }
}
