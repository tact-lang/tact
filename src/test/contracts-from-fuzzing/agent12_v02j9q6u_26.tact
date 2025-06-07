contract TestMapMutateForeach {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set initial key-value pairs
        self.m.set(1, 10);
        self.m.set(2, 20);
        
        // Attempt to modify the map during iteration
        foreach (key, _ in self.m) {
            // For each key, increment its value by 1
            let current: Int? = self.m.get(key);
            if (current != null) {
                self.m.set(key, current!! + 1);
            }
        }
        
        dump(self.m.get(1)); // Expected: 11
        dump(self.m.get(2)); // Expected: 21
    }
}
