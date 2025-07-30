contract ContractWDefaultsOpt {
    a: Int? = null;
    b: Bool? = true;
    c: String? = "foo";

    init() {
        self.a = 1;
        self.b = false;
        self.c = "bar";
    }
}
