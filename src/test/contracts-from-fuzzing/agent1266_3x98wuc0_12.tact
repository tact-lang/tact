contract ContractDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "abc";

    init() {
        self.a = 10;
        self.b = true;
        self.c = "def";
    }
}