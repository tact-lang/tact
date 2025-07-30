contract TestMapAddressBool {
    m: map<Address, Bool> = emptyMap();

    receive() {
        let addr = address("0:0000000000000000000000000000000000000000000000000000000000000000");
        self.m.set(addr, true);
        let value = self.m.get(addr);
    }
}
