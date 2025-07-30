contract ManyFields {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Slice;
    val5: Cell;
    val6: Address;

    init() {
        self.val1 = 1;
        self.val2 = false;
        self.val3 = "test";
        self.val4 = emptyCell().asSlice();
        self.val5 = emptyCell();
        self.val6 = myAddress();
    }
}