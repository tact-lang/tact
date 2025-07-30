contract OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = "foo";
    d: Address?;

    init() {
        self.a = 10;
        self.d = myAddress();
    }
}