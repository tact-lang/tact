contract TestContract {
    value1: Int;
    value2: Bool;
    value3: Address;
    value4: Cell;
    value5: Slice;
    value6: String;
    init() {
        self.value1 = 1;
        self.value2 = true;
        self.value3 = myAddress();
        self.value4 = emptyCell();
        self.value5 = self.value4.asSlice();
        self.value6 = "test";
    }
}
