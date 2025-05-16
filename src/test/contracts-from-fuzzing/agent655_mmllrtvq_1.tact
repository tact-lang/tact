contract TestContract {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    stringField: String;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.addressField = myAddress();
        self.stringField = "hello";
    }
}