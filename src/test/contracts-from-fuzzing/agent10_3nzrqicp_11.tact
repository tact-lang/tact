contract TestDeepEquals {
    m: map<Int, Int> = emptyMap();
    n: map<Int, Int> = emptyMap();

    init() {
        // Set same key-value pair in both maps
        self.m.set(1, 42);
        self.n.set(1, 42);
        // Compare maps using deepEquals
        let eq: Bool = self.m.deepEquals(self.n);
        dump(eq); // Expected to dump true
    }

    receive() {}
}
