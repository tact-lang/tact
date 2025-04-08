contract OptFields {
    val1: Int?;
    val2: Bool?;
    val3: String?;
    val4: Address?;
    val5: Cell?;

    init() {
        self.val1 = null;
        self.val2 = true;
        self.val3 = null;
        self.val4 = null;
        self.val5 = emptyCell();
    }
}