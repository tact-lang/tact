contract Test {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set a value
        self.m.set(2, 200);
        
        // Test: key exists
        if (self.m.exists(2)) {
            dump(1); // Expect to dump 1
        } else {
            dump(0);
        }

        // Test: key does not exist
        if (self.m.exists(3)) {
            dump(0);
        } else {
            dump(1); // Expect to dump 1
        }
    }
}
