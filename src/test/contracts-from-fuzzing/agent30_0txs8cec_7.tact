contract TestDeepEquals {
    m1: map<Int, Int>;
    m2: map<Int, Int>;

    receive() {
        // Initialize both maps
        self.m1 = emptyMap();
        self.m2 = emptyMap();
        
        // Set same key-value pair in both
        self.m1.set(1, 2);
        self.m2.set(1, 2);

        // Test deep equality
        let areDeepEqual: Bool = self.m1.deepEquals(self.m2);
        dump(areDeepEqual); // Expected output: true

        // Test shallow equality
        let areShallowEqual: Bool = self.m1 == self.m2;
        dump(areShallowEqual); // Expected output: true (if serialization is identical)

        // Modify one map
        self.m2.set(2, 3);
        let areEqualAfterChange: Bool = self.m1.deepEquals(self.m2);
        dump(areEqualAfterChange); // Expected output: false
    }
}
