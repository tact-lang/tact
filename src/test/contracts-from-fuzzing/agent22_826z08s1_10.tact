contract TestMapIterationDelete {
    // Test deleting map entries during iteration
    fizz: map<Int, Int> = emptyMap();

    init() {
        // Populate map with three entries
        self.fizz.set(1, 10);
        self.fizz.set(2, 20);
        self.fizz.set(3, 30);

        // Iterate over the map and delete each key
        foreach (k, v in self.fizz) {
            self.fizz.del(k);
        }
        
        // Verify the map is empty
        if (!self.fizz.isEmpty()) {
            throw(101);
        }
    }
}
