contract SerialOrderTest {
    intField: Int as int64;
    boolField: Bool;
    stringField: String;
    addressField: Address;

    init() {
        self.intField = 123456789;
        self.boolField = true;
        self.stringField = "order";
        self.addressField = myAddress();
    }
}