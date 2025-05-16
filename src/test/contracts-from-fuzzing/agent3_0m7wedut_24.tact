contract TestAddressMapEquality {
    // Persistent state maps with Address as keys
    m1: map<Address, Int> = emptyMap();
    m2: map<Address, Int> = emptyMap();

    init() {
        // Set the same key-value pair in both maps using myAddress()
        let addr: Address = myAddress();
        self.m1.set(addr, 42);
        self.m2.set(addr, 42);
    }

    get fun compare(): Bool {
        // Both shallow equality and deepEquals should return true
        return (self.m1 == self.m2) && self.m1.deepEquals(self.m2);
    }
}
