contract Test {
    field1: Int = 0;
    field2: Bool = false;
    field3: String = "";
    field4: Int?;
    field5: Bool?;
    field6: String?;
    field7: Cell;
    field8: Slice;
    field9: Address;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = "abc";
        self.field4 = null;
        self.field5 = null;
        self.field6 = null;
        self.field7 = emptyCell();
        self.field8 = emptyCell().asSlice();
        self.field9 = myAddress();
    }
}