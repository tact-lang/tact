contract TestDeepEquals {
    m1: map<Int, Int>;
    m2: map<Int, Int>;

    receive() {
        self.m1 = emptyMap();
        self.m2 = emptyMap();

        // Set same key-value pair in both maps
        self.m1.set(1, 100);
        self.m2.set(1, 100);

        // Compare maps using deepEquals (should return true)
        let deep: Bool = self.m1.deepEquals(self.m2);
        dump(deep);  // expected output: 1

        // Compare maps using shallow equality operator (==)
        let shallow: Bool = (self.m1 == self.m2);
        dump(shallow);  // expected output: 1
    }
}
