contract TestMapSelfEquality {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set a key-value pair
        self.m.set(100, 999);
        
        // Self equality checks
        dump(self.m == self.m);         // Expected: true (shallow equality)
        dump(self.m.deepEquals(self.m));  // Expected: true (deep equality)
    }
}
