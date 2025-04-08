contract OptionalsWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;

    init() {
        self.a = 100;
        self.b = true;
        self.c = "hi";
        self.d = myAddress();
    }
}