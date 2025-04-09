contract TestContract {
    field1: Int;
    field2: Bool;
    field3: Address;
    field4: Cell;
    field5: Slice;
    field6: Builder;
    field7: String;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = myAddress();
        self.field4 = emptyCell();
        self.field5 = self.field4.asSlice();
        self.field6 = beginCell();
        self.field7 = "test";
    }
}