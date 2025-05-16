contract TestContract {
    val1: Int = 1;
    val2: Bool = true;
    val3: Address;
    init() {
        self.val1 = 2;
        self.val2 = false;
        self.val3 = myAddress();
    }
}