contract OptionalExplicitNulls {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}