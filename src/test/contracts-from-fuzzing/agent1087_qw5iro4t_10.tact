contract TestContract {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    strField: String;

    init() {
        self.intField = 777;
        self.boolField = false;
        self.addrField = myAddress();
        self.strField = "hello";
    }

    receive() {}
}