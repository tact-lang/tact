contract TestAddressMap() {
    fun test() {
        // Create a map with Address keys and Int values
        let m: map<Address, Int> = emptyMap();
        let addr: Address = myAddress();
        m.set(addr, 123);
        let v: Int = m.get(addr)!!;
        dump(v); // expected to dump 123
    }

    receive() {
        self.test();
    }
}
