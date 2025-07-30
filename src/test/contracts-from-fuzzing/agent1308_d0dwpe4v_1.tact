contract TestContract {
    value1: Int;
    value2: Bool;
    value3: Slice;
    value4: Cell;
    value5: Address;
    value6: String;
    value7: Int?;
    value8: Address?;
    value9: Cell?;

    init() {
        self.value1 = 0;
        self.value2 = false;
        self.value3 = emptyCell().asSlice();
        self.value4 = emptyCell();
        self.value5 = myAddress();
        self.value6 = "test";
        self.value7 = null;
        self.value8 = null;
        self.value9 = null;
    }
}