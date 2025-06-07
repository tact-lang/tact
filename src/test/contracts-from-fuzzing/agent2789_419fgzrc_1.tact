contract TestContract {
    val1: Int;
    val2: Bool;
    val3: Address;
    val4: String;
    val5: Cell;
    val6: Slice;
    val7: Builder;

    init() {
        self.val1 = 1;
        self.val2 = true;
        self.val3 = myAddress();
        self.val4 = "ok";
        self.val5 = emptyCell();
        self.val6 = emptyCell().asSlice();
        self.val7 = beginCell();
    }
}
