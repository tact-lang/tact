contract ManyPrimitiveFields {
    val1: Int;
    val2: Bool;
    val3: Address;
    val4: String;
    val5: Cell;
    val6: Slice;

    init() {
        self.val1 = 1;
        self.val2 = true;
        self.val3 = myAddress();
        self.val4 = "hello";
        self.val5 = emptyCell();
        self.val6 = emptyCell().asSlice();
    }
}