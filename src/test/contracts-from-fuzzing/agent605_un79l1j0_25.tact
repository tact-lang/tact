contract OptionalFields {
    val1: Int?;
    val2: Bool?;
    val3: String?;
    val4: Cell?;
    val5: Slice?;
    val6: Address?;

    init() {
        self.val1 = null;
        self.val2 = null;
        self.val3 = null;
        self.val4 = null;
        self.val5 = null;
        self.val6 = null;
    }
}