contract OptionalPrimitiveFields {
    val1: Int?;
    val2: Bool?;
    val3: Address?;
    val4: Cell?;
    val5: String?;

    init() {
        self.val1 = 123;
        self.val2 = true;
        self.val3 = null;
        self.val4 = null;
        self.val5 = "Hello";
    }
}
