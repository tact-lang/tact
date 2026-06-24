contract StorageManyFields {
    val1: Int = 1;
    val2: Bool = true;
    val3: String = "hello";
    val4: Address;
    val5: Cell;
    val6: Slice;
    val7: Builder;
    val8: Int?;
    val9: Bool?;
    val10: String?;
    val11: Address?;
    val12: Cell?;
    val13: Slice?;
    val14: Builder?;

    init() {
        self.val4 = myAddress();
        self.val5 = emptyCell();
        self.val6 = emptyCell().asSlice();
        self.val7 = beginCell();
        self.val8 = null;
        self.val9 = null;
        self.val10 = null;
        self.val11 = null;
        self.val12 = null;
        self.val13 = null;
        self.val14 = null;
    }
}