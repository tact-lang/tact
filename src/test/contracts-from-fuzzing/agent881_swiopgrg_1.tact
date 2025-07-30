struct Nested { inner: Int; }

contract TestContract {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Cell;
    val5: Slice;
    val6: Builder;
    val7: Address;
    val8: Nested;
    val9: Int?;
    val10: Bool?;
    
    init() {
        self.val1 = 1;
        self.val2 = true;
        self.val3 = "test";
        self.val4 = emptyCell();
        self.val5 = emptyCell().asSlice();
        self.val6 = beginCell();
        self.val7 = myAddress();
        self.val8 = Nested{inner: 42};
        self.val9 = null;
        self.val10 = null;
    }
}