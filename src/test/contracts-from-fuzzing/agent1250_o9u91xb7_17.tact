contract InitVsDefaults {
    val1: Int = 1;
    val2: Bool;
    val3: String = "hi";
    optVal: Int?;

    init() {
        self.val2 = true;
        self.optVal = null;
    }
}