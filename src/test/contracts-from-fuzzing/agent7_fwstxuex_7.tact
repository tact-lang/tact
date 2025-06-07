contract Test {
    m1: map<Int, Int> = emptyMap();
    m2: map<Int, Int> = emptyMap();

    receive() {
        // Set the same key-value pair in both maps
        self.m1.set(1, 2);
        self.m2.set(1, 2);

        // Test deep equality: should be true
        let deepEqual: Bool = self.m1.deepEquals(self.m2);
        dump(deepEqual);

        // Test shallow equality using ==
        // Note: documentation says that shallow equality may yield false if the underlying cell serializations differ
        let shallowEqual: Bool = (self.m1 == self.m2);
        dump(shallowEqual);
    }
}
