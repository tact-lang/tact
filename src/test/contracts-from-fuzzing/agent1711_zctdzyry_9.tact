contract TestTuple {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Slice;
    field5: Cell;
    field6: Address;
    field7: Int?;
    field8: Bool?;
    field9: String?;
    field10: Slice;
    field11: Cell;
    field12: Address;

    init() {
        self.field1 = 1;
        self.field2 = false;
        self.field3 = "hi";
        self.field4 = emptyCell().asSlice();
        self.field5 = emptyCell();
        self.field6 = myAddress();
        self.field7 = null;
        self.field8 = null;
        self.field9 = null;
        self.field10 = emptyCell().asSlice();
        self.field11 = emptyCell();
        self.field12 = myAddress();
    }
}