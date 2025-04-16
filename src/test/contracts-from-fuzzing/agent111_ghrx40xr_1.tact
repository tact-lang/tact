contract TestContract {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Slice;
    val5: Cell;
    val6: Builder;
    val7: Address;
    
    init() {
        self.val1 = 42;
        self.val2 = true;
        self.val3 = "test";
        self.val4 = emptyCell().asSlice();
        self.val5 = emptyCell();
        self.val6 = beginCell();
        self.val7 = myAddress();
    }
}