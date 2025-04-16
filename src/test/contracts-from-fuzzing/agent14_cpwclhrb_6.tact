contract TestMapDelExists {
    dict: map<Int, Int> = emptyMap();

    receive() {
        // Initially, the map should be empty
        dump(self.dict.isEmpty()); // Expected: true

        // Insert a couple of key-value pairs
        self.dict.set(3, 30);
        self.dict.set(4, 40);

        // Test existence of a key that was added
        dump(self.dict.exists(3)); // Expected: true
        // Test existence of a non-existent key
        dump(self.dict.exists(5)); // Expected: false

        // Delete an existing key
        let delRes1: Bool = self.dict.del(3);
        dump(delRes1); // Expected: true

        // Check that key 3 no longer exists
        dump(self.dict.exists(3)); // Expected: false

        // Attempt to delete the same key again
        let delRes2: Bool = self.dict.del(3);
        dump(delRes2); // Expected: false

        // The map should not be empty yet because key 4 remains
        dump(self.dict.isEmpty()); // Expected: false

        // Delete the remaining key using set with null
        self.dict.set(4, null);
        dump(self.dict.isEmpty()); // Expected: true
    }
}
