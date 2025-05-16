contract ContractDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
    d: Int? = null;
    e: Address? = null;
    init() {
        self.a = 2;
        self.b = false;
        self.c = "world";
        self.d = null;
        self.e = null;
    }
}