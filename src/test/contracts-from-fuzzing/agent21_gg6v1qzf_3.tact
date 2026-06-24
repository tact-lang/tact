contract Test {
    field1: Int = 1;
    field2: Bool = true;
    field3: Address;
    field4: Cell;
    field5: Slice;
    field6: String = "test string";

    init() {
        self.field1 = 123;
        self.field2 = false;
        self.field3 = myAddress();
        self.field4 = emptyCell();
        self.field5 = emptyCell().asSlice();
        self.field6 = "hello";
    }
}