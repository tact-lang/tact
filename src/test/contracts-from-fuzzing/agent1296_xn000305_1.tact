contract TestContract {
    field1: Int;
    field2: Bool;
    field3: Address;
    field4: Cell;
    field5: Slice;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = myAddress();
        self.field4 = emptyCell();
        self.field5 = emptyCell().asSlice();
    }
}
