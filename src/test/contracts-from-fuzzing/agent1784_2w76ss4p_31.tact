contract ContractWithDefaults {
    i: Int = 7;
    b: Bool = true;
    s: String = "foo";
    o: Int? = null;
    p: String? = null;

    init() {
        self.i = 8;
        self.b = false;
        self.s = "bar";
        self.o = 22;
        self.p = "baz";
    }
}