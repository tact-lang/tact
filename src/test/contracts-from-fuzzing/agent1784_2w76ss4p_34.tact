contract OptionalDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = null;
    d: Address? = null;

    init() {
        self.a = 5;
        self.b = false;
        self.c = "foo";
        self.d = myAddress();
    }
}