contract ContractWithStringDefaults {
    a: String = "";
    b: String = "hello";

    init() {
        self.a = "";
        self.b = "world";
    }
}
