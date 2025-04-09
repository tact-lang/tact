contract TestMapNullComparison {
    m: map<Int, Int> = emptyMap();

    receive() {
        // According to documentation, an empty map is equivalent to null
        dump(self.m == null); // Expected: true
        
        // Add an entry
        self.m.set(5, 555);
        dump(self.m == null); // Expected: false
        
        // Reset the map to empty
        self.m = emptyMap();
        dump(self.m == null); // Expected: true
    }
}
