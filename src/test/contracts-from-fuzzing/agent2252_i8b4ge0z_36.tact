contract ContractWithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "default";
    init() {
        self.a = 10;
        self.b = false;
        self.c = "changed";
    }
}