contract Heterogeneous {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Slice;
    field5: Address;

    init() {
        self.field1 = 123;
        self.field2 = true;
        self.field3 = "hi";
        self.field4 = emptyCell().asSlice();
        self.field5 = myAddress();
    }
}
