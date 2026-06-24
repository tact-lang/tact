contract TestMapAddressKey {
    // Using Address as key and Bool as value
    m: map<Address, Bool>;

    init() {
        self.m = emptyMap();
        let addr: Address = myAddress();
        self.m.set(addr, true);
        let flag: Bool? = self.m.get(addr);
        if (flag == null || !flag!!) { throw(0); }
    }

    receive() {}
}
