contract TestMapBool {
    m: map<Int, Bool> = emptyMap();

    receive() {
        // Set two key-value pairs
        self.m.set(1, true);
        self.m.set(2, false);
        
        // Get and dump the values
        dump(self.m.get(1)); // Expected: true
        dump(self.m.get(2)); // Expected: false
    }
}
