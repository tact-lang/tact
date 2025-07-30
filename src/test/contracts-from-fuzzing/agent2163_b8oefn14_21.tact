contract InitDefaults {
    val1: Int = 0;
    val2: Bool = false;
    val3: String = "hello";
    val4: Address;

    init() {
        self.val4 = myAddress();
    }
}