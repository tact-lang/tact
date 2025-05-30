contract InitDefaults {
    val1: Int = 5;
    val2: String = "abc";
    val3: Bool = true;

    init() {
        self.val1 = 10;
        self.val2 = "def";
        self.val3 = false;
    }
}