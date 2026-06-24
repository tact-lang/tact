contract ContractDefaults {
    a: Int = 10;
    b: Bool = true;
    s: String = "test";

    init() {
        self.a = 20;
        self.b = false;
        self.s = "done";
    }

    receive() {}
}