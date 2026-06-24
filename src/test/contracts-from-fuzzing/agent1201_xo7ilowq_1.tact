contract TestContract {
    val1: Int;
    val2: Bool;
    val3: Address;

    init() {
        self.val1 = 10;
        self.val2 = true;
        self.val3 = myAddress();
    }
}