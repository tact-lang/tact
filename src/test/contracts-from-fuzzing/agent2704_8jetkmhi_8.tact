contract NoConstructor {
    val1: Int = 0;
    val2: Bool = true;
    val3: Address;

    init() {
        self.val3 = myAddress();
    }
}