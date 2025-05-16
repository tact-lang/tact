contract Test1 {
    val1: Int;
    val2: Bool;
    val3: Address;
    val4: Cell;
    val5: Builder;
    val6: Slice;
    val7: String;
    init() {
        self.val1 = 10;
        self.val2 = true;
        self.val3 = myAddress();
        self.val4 = emptyCell();
        self.val5 = beginCell();
        self.val6 = emptyCell().asSlice();
        self.val7 = "test";
    }
}