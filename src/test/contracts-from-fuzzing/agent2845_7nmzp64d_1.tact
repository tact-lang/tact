contract Test1 {
    val1: Int;
    val2: Bool;
    val3: Address;
    val4: Cell;
    val5: Slice;
    val6: String;

    init() {
        self.val1 = 1;
        self.val2 = true;
        self.val3 = myAddress();
        self.val4 = emptyCell();
        self.val5 = emptyCell().asSlice();
        self.val6 = "test";
    }
}