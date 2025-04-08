contract OptionalDefaultValues {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;

    init() {
        self.a = 5;
        self.b = true;
        self.s = "abc";
    }
}