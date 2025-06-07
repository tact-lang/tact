contract Test1 {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Address;

    init() {
        self.field1 = 0;
        self.field2 = false;
        self.field3 = "";
        self.field4 = myAddress();
    }
}