contract Test {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set an initial value
        self.m.set(7, 70);
        
        // Test .replace() on an existing key: should return true and update value
        let repExisting: Bool = self.m.replace(7, 68);
        dump(repExisting); // Expected output: true (and value for key 7 updated to 68)

        // Test .replace() on a non-existing key: should return false
        let repNonExist: Bool = self.m.replace(8, 68);
        dump(repNonExist); // Expected output: false

        // Test .replace() with null to delete an entry
        self.m.set(42, 42);
        let repDelete: Bool = self.m.replace(42, null);
        dump(repDelete); // Expected output: true
        dump(self.m.exists(42)); // Expected output: false (entry deleted)
    }
}
