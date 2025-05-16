contract ManyFields {
    field1: Int;
    field2: Bool;
    field3: Address;
    field4: Cell;
    field5: Slice;
    field6: String;
    field7: String?;
    field8: Cell?;
    field9: Int?;
    field10: Bool?;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = myAddress();
        self.field4 = emptyCell();
        self.field5 = emptyCell().asSlice();
        self.field6 = "test";
        self.field7 = null;
        self.field8 = null;
        self.field9 = null;
        self.field10 = null;
    }
}
