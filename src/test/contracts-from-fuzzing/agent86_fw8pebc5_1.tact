contract TestContract {
    val1: Int;
    val2: Bool;
    val3: Address;
    val4: String;

    init() {
        self.val1 = 0;
        self.val2 = false;
        self.val3 = myAddress();
        self.val4 = "";
    }
}