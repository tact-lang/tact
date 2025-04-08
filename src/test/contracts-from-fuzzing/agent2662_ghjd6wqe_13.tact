contract LargeOptionalSet {
    val1: Int?;
    val2: Int?;
    val3: Bool?;
    val4: String?;
    val5: Cell?;
    val6: String?;
    val7: Bool?;
    val8: Int?;

    init() {
        self.val1 = null;
        self.val2 = 42;
        self.val3 = true;
        self.val4 = null;
        self.val5 = null;
        self.val6 = "hi";
        self.val7 = null;
        self.val8 = -1;
    }
}