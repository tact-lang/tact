contract InitOverrideDefaults {
    val1: Int = 5;
    val2: Bool = false;
    val3: String = "abc";

    init() {
        self.val1 = 42;
        self.val2 = true;
        self.val3 = "xyz";
    }
}