contract ComboFields {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addressVal: Address;

    init() {
        self.intVal = 10;
        self.boolVal = true;
        self.stringVal = "hi";
        self.addressVal = myAddress();
    }
}