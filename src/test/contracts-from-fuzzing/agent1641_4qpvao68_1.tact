contract TestContract {
    intVar: Int = 1;
    boolVar: Bool = true;
    strVar: String = "test";
    addrVar: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");

    init() {
        self.intVar = 42;
        self.boolVar = false;
        self.strVar = "changed";
        self.addrVar = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    }
}