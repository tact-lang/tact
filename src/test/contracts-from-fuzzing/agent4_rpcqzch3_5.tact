contract Test {
    m: map<Int, Int>;

    receive() {
        // Initialize map and set a value for key 5
        self.m = emptyMap();
        self.m.set(5, 100);
        
        // Test exists method for an existing key (should dump "true")
        if (self.m.exists(5)) {
            dump(1);  // expected to dump 1
        } else {
            dump(0);
        }
        
        // Test exists method for a non-existing key (should dump "false")
        if (self.m.exists(10)) {
            dump(1);
        } else {
            dump(0);  // expected to dump 0
        }
    }
}
