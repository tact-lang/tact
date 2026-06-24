contract OptionalFields {
    val1: Int?;
    val2: Bool?;
    val3: Address?;
    val4: Cell?;

    init() {
        self.val1 = null;
        self.val2 = true;
        self.val3 = null;
        self.val4 = emptyCell();
    }
}