contract LargeFields {
    field1: Int;
    field2: Bool;
    field3: Int?;
    field4: Bool?;
    field5: String;
    field6: Slice;
    field7: Builder;
    field8: Address;
    field9: Cell;
    field10: Int; 

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = null;
        self.field4 = null;
        self.field5 = "test";
        self.field6 = emptySlice();
        self.field7 = beginCell();
        self.field8 = myAddress();
        self.field9 = emptyCell();
        self.field10 = 10;
    }
}
