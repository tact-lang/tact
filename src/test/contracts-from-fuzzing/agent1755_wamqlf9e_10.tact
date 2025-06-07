contract OptionalDefaults {
    val1: Int?;
    val2: String? = null;
    val3: Bool? = null;
    init() {
        self.val1 = null;
        self.val2 = null;
        self.val3 = null;
    }
}