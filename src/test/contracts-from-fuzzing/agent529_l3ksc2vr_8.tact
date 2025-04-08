contract OnlyOptional {
    val1: Int?;
    val2: String?;
    val3: Bool?;
    val4: Cell?;
    val5: Address?;

    init() {
        self.val1 = null;
        self.val2 = null;
        self.val3 = null;
        self.val4 = null;
        self.val5 = null;
    }
}