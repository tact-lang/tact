contract Test {
    m: map<Int, Int>;

    receive() {
        // Test .replace() method
        self.m = emptyMap();
        
        // Set two key-value pairs
        self.m.set(7, 70);
        self.m.set(42, 42);

        // Replace existing key 7 with 68; should return true
        let replaced1: Bool = self.m.replace(7, 68);
        dump(replaced1); // Expect to dump 1 (true)

        // Replace non-existing key 8; should return false
        let replaced2: Bool = self.m.replace(8, 68);
        dump(replaced2); // Expect to dump 0 (false)

        // Now replace key 7 with null, should delete the entry and return true
        let replaced3: Bool = self.m.replace(7, null);
        dump(replaced3); // Expect to dump 1 (true)

        // Verify that key 7 no longer exists
        if (self.m.exists(7)) {
            dump(999); // Error case
        } else {
            dump(100); // Expected branch
        }
    }
}
