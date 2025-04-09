contract OptsWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: String? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "hey";
    }
}