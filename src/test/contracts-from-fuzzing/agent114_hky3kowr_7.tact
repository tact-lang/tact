contract PrimitiveTypesContract {
    intField: Int;
    boolField: Bool;
    stringField: String;
    addressField: Address;

    init() {
        self.intField = 123;
        self.boolField = true;
        self.stringField = "hello";
        self.addressField = myAddress();
    }
}