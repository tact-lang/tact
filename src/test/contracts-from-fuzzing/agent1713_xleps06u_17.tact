contract EmptyInitFields {
    intField: Int;
    boolField: Bool;
    stringField: String;
    addressField: Address;

    init() {
        self.intField = 0;
        self.boolField = false;
        self.stringField = "";
        self.addressField = myAddress();
    }
}