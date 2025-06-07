contract TestMapAddInForeach {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Initialize with one entry
        self.m.set(1, 10);
        
        // In foreach loop, add a new entry computed from current key and value
        foreach (k, v in self.m) {
            // Adding a new entry; note that modifying the map during iteration might be unpredictable
            self.m.set(k + 5, v + 5);
        }
        
        // Expecting that the new key (1+5 = 6) would contain value 15
        dump(self.m.get(6)); // Expected: 15 if the new entry was added
    }
}
