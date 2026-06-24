contract TestMapOps {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set map entries
        self.m.set(1, 100);
        self.m.set(2, 200);
        
        // Test exists method
        if (self.m.exists(1)) {
            dump(10);
        }
        if (!self.m.exists(3)) {
            dump(20);
        }
        
        // Test isEmpty method
        if (!self.m.isEmpty()) {
            dump(30);
        }
        
        // Test deepEquals method
        let m2: map<Int, Int> = emptyMap();
        m2.set(1, 100);
        m2.set(2, 200);
        dump(self.m.deepEquals(m2));
    }
}
