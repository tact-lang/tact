contract Test {
    field1: Int;
    field2: Bool;
    field3: Address;
    field4: Cell;
    field5: Slice;
    field6: String;

    init() {
        self.field1 = 0;
        self.field2 = false;
        self.field3 = myAddress();
        self.field4 = emptyCell();
        self.field5 = emptyCell().asSlice();
        self.field6 = "test";
    }
}