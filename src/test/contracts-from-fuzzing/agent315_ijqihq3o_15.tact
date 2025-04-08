contract OptionalVsNonoptional {
    val1: Int?;
    val2: Int;
    val3: Bool?;
    val4: Bool;

    init() {
        self.val1 = null;
        self.val2 = 1;
        self.val3 = null;
        self.val4 = true;
    }
}