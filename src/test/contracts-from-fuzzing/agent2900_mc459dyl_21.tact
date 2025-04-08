contract OptionalStrings {
    a: String? = null;
    b: String? = null;

    init() {
        self.a = "foo";
        self.b = null;
    }
}
