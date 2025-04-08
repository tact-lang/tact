contract ManyFieldsPrimitives {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Cell;
    val5: Slice;
    val6: Builder;
    val7: Address;
    val8: Int?;
    val9: Bool?;
    val10: String?;
    val11: Cell?;
    val12: Slice?;
    val13: Builder?;
    val14: Address?;
    
    init() {
        self.val1 = 1;
        self.val2 = true;
        self.val3 = "a";
        self.val4 = emptyCell();
        self.val5 = emptyCell().asSlice();
        self.val6 = beginCell();
        self.val7 = myAddress();
        self.val8 = null;
        self.val9 = null;
        self.val10 = null;
        self.val11 = null;
        self.val12 = null;
        self.val13 = null;
        self.val14 = null;
    }
}
