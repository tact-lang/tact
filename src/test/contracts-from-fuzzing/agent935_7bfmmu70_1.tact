contract Test {
    val1: Int;
    val2: Bool;
    val3: Address;
    val4: Cell;
    val5: Slice;
    val6: String;

    init() {
        self.val1 = 0;
        self.val2 = true;
        self.val3 = myAddress();
        self.val4 = emptyCell();
        self.val5 = self.val4.asSlice();
        self.val6 = "test";
    }

    receive() {}
}