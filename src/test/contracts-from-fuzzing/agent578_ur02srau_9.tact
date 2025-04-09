contract OnlyDefaults {
    val1: Int = 123;
    val2: Bool = false;
    val3: String = "hello";
    val4: Int?;  // null default
    val5: Bool?; // null default

    init() {
        self.val1 = 456;
        self.val2 = true;
        self.val3 = "world";
        self.val4 = 789;
        self.val5 = false;
    }
}