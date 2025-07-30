contract OptTest {
    val1: Int?;
    val2: Bool?;
    val3: Address?;
    val4: Cell?;
    val5: Slice?;
    val6: String?;

    init() {
        self.val1 = null;
        self.val2 = true;
        self.val3 = null;
        self.val4 = emptyCell();
        self.val5 = null;
        self.val6 = "str";
    }
}