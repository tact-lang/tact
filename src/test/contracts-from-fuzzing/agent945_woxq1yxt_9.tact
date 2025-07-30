contract OptionalsAndDefaults {
    val1: Int?;
    val2: Int = 123;
    val3: Bool?;
    val4: String = "abc";

    init() {
        self.val1 = 1;
        self.val2 = 2;
        self.val3 = false;
        self.val4 = "def";
    }
}