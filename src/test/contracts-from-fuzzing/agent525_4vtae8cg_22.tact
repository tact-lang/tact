contract OptionalDefaults {
    a: Int? = null;
    b: Bool? = false;
    c: String? = null;
    d: Address? = null;

    init() {
        self.a = null;
        self.b = true;
        self.c = "abc";
        self.d = myAddress();
    }
}