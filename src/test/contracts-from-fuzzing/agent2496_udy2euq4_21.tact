contract OptionalStrings {
    a: String?;
    b: String?;
    c: String?;

    init() {
        self.a = "foo";
        self.b = null;
        self.c = "bar";
    }
}
