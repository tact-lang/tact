contract TestAddressMap {
    receive() {
        // Testing map with Address as key and Int as value
        // Using a valid address literal via the address() function
        let addr: Address = address("0:0000000000000000000000000000000000000000000000000000000000000000");
        let m: map<Address, Int> = emptyMap();
        m.set(addr, 123);
        let v: Int? = m.get(addr);
    }
}
