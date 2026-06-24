contract TestReplace {
    m: map<Int, Int>;

    receive() {
        // Initialize empty map
        self.m = emptyMap();
        // Set initial key-value pairs
        self.m.set(7, 70);
        self.m.set(42, 42);

        // Replace existing key 7 with new value 68; should return true
        let replaced1: Bool = self.m.replace(7, 68);
        dump(replaced1); // expected output: true

        // Verify that key 7 now holds value 68
        let val7: Int = self.m.get(7)!!;
        dump(val7); // expected output: 68

        // Attempt to replace a non-existent key 8; should return false
        let replaced2: Bool = self.m.replace(8, 68);
        dump(replaced2); // expected output: false

        // Test deletion via replace: setting key 7 to null should delete the entry
        let replaced3: Bool = self.m.replace(7, null);
        dump(replaced3); // expected output: true

        // Verify that key 7 is now removed
        if (self.m.get(7) == null) {
            dump(100); // expected dump: 100 if deletion successful
        } else {
            dump(0);
        }
    }
}
