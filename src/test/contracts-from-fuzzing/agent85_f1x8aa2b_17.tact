contract VariablesNoDefaults {
    a: Int;
    b: Bool;
    c: Address;

    init() {
        self.a = 1;
        self.b = false;
        self.c = myAddress();
    }

    receive() {}
}