contract TestContract {
    addressField: Address;
    intField: Int;
    boolField: Bool;
    strField: String;

    init() {
        self.addressField = myAddress();
        self.intField = 42;
        self.boolField = true;
        self.strField = "hi";
    }
}