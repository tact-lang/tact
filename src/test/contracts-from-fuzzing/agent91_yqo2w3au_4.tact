// Test case for Maps
contract TestMaps() {
    fun test() {
        // Create an empty map with Int keys and Int values
        let m: map<Int, Int> = emptyMap();
        // Insert a key-value pair: key 1 with value 100
        m.set(1, 100);
        // Retrieve the value
        dump(m.get(1)!!); // Expected output: 100

        // Delete the key 1; first deletion should return true
        dump(m.del(1)); // Expected output: true
        // Second deletion is idempotent; should return false
        dump(m.del(1)); // Expected output: false

        // Check if the map is empty
        dump(m.isEmpty()); // Expected output: true
    }

    receive() {
        self.test();
    }
}
