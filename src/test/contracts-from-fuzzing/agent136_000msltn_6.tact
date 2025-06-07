contract OnlyPrimitives {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Address;

    init() {
        self.field1 = 99;
        self.field2 = true;
        self.field3 = "test";
        self.field4 = myAddress();
    }
}
