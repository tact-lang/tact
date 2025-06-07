contract Test {
    m: map<Int, Int> = emptyMap();
    
    receive() {
        // Set key 5 to 15
        self.m.set(5, 15);
        // Test existence for key 5 (expected true) and key 10 (expected false)
        if (self.m.exists(5)) {
            dump(1);
        } else {
            dump(0);
        }
        
        if (self.m.exists(10)) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
