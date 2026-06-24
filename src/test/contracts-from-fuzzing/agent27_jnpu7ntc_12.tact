contract TestAddressMap {
    receive() {
        // Test a map with Address as key and Int as value
        let m: map<Address, Int> = emptyMap();
        let addr: Address = myAddress();
        m.set(addr, 123);
        dump(m.get(addr)); // expecting dump(123) 
    }
}
