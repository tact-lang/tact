struct Nested { inner: Int; }

contract Test {
    val1: Int;
    val2: Bool;
    val3: Address;
    val4: Slice;
    val5: Cell;
    val6: String;
    val7: Nested;
    val8: Int?;
    val9: Bool?;
    val10: Address?;
    val11: Cell?;
    val12: String?;

    init() {
        self.val1 = 1;
        self.val2 = true;
        self.val3 = myAddress();
        self.val4 = emptyCell().asSlice();
        self.val5 = emptyCell();
        self.val6 = "test";
        self.val7 = Nested{ inner: 5 };
        self.val8 = null;
        self.val9 = null;
        self.val10 = null;
        self.val11 = null;
        self.val12 = null;
    }
}