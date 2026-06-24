contract ContractDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "hello";
    d: Int? = null;
    e: String = "world";

    init() {
        self.d = 42;
    }
}