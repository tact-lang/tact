contract MultiFields {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Cell;
    field5: Slice;
    field6: Address;
    field7: String;
    field8: Bool;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = "a";
        self.field4 = emptyCell();
        self.field5 = emptyCell().asSlice();
        self.field6 = myAddress();
        self.field7 = "b";
        self.field8 = false;
    }
}