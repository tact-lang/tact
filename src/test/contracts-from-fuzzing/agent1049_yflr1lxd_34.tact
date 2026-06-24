contract OptionalDefaulted {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;

    init() {
        self.a = 42;
        self.b = "abc";
        self.c = true;
    }
}