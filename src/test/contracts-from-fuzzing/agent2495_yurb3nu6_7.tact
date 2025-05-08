contract NoDefaults {
    val1: Int;
    val2: Bool;
    val3: Address;

    init() {
        self.val1 = 33;
        self.val2 = false;
        self.val3 = myAddress();
    }
}