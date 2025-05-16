contract OnlyFields {
    val1: Int;
    val2: Bool;
    val3: Cell;
    val4: String;
    val5: Address;
    val6: Int?;
    val7: Bool?;
    val8: Cell?;
    val9: String?;
    val10: Address?;

    init() {
        self.val1 = 123;
        self.val2 = false;
        self.val3 = emptyCell();
        self.val4 = "abc";
        self.val5 = myAddress();
        self.val6 = null;
        self.val7 = null;
        self.val8 = null;
        self.val9 = null;
        self.val10 = null;
    }
}