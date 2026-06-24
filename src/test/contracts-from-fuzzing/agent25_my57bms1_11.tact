contract TestMapAddressBool {
    receive() {
        // Create an empty map with key type Address and value type Bool
        let m: map<Address, Bool> = emptyMap();
        // Use a built-in function to obtain an address. (myAddress() is assumed available.)
        let addr: Address = myAddress();
        m.set(addr, true);
        let b: Bool? = m.get(addr);
        dump(b); // Expected output: true (as Some(true))
    }
}
