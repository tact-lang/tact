contract TestReplace {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set values
        self.m.set(7, 70);
        self.m.set(42, 42);
        
        // Replace value for existing key; should return true
        let replaced1: Bool = self.m.replace(7, 68);
        dump(replaced1); // Expected: true

        // Replace value for non-existing key; should return false
        let replaced2: Bool = self.m.replace(8, 68);
        dump(replaced2); // Expected: false

        // Replace with null value for existing key; should delete the entry and return true
        let replaced3: Bool = self.m.replace(42, null);
        dump(replaced3); // Expected: true

        // Replace with null value for non-existing key; should return false
        let replaced4: Bool = self.m.replace(99, null);
        dump(replaced4); // Expected: false
    }
}
