contract OptionalNullableFields {
    val1: Int?;
    val2: Bool?;
    val3: String?;
    val4: Address?;
    val5: Cell?;
    val6: Slice?;

    init() {
        self.val1 = null;
        self.val2 = null;
        self.val3 = null;
        self.val4 = null;
        self.val5 = null;
        self.val6 = null;
    }
}