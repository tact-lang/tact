contract AddressOptStorage {
    val1: Address?;
    val2: Address?;

    init() {
        self.val1 = null;
        self.val2 = myAddress();
    }
}
