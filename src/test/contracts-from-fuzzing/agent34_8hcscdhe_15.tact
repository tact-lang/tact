contract Test {
    receive() {
        // Test map with Address keys and Bool values using correct generic syntax
        let a: Address = myAddress();
        let m: map<Address, Bool> = emptyMap();
        m.set(a, true);
        dump(m.get(a)!!);  // Expected output: true
        
        // Delete the entry and check existence
        m.del(a);
        dump(m.exists(a)); // Expected output: false
        
        // Check that asCell() returns null for an empty map
        dump(m.asCell() == null); // Expected output: true
    }
}
