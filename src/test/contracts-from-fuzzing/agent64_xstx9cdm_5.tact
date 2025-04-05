contract TestMaps() {
    fun run() {
        // Create a map of Int keys to Int values
        let m: map<Int, Int> = emptyMap();
        
        // Test setting a value
        m.set(0, 42);
        dump(m.get(0)!!); // Expected output: 42
        
        // Test overriding the value
        m.set(0, 100);
        dump(m.get(0)!!); // Expected output: 100
        
        // Test deletion
        let delResult: Bool = m.del(0);
        dump(delResult); // Expected output: true

        // After deletion, the map should be empty
        dump(m.isEmpty()); // Expected output: true
    }

    receive() {
        self.run();
        cashback(sender());
    }
}

// Dummy contract to ensure the TestMaps contract is used
contract DummyMaps() {}