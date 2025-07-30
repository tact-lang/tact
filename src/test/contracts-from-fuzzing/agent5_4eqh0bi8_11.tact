contract MapDeepEqualsTest {
    m: map<Int, Int> = emptyMap();
    n: map<Int, Int> = emptyMap();

    receive() {
        // Populate both maps with the same key-value pair
        self.m.set(1, 10);
        self.n.set(1, 10);
        let eq1: Bool = self.m.deepEquals(self.n); // should be true

        // Modify one map
        self.m.set(2, 20);
        let eq2: Bool = self.m.deepEquals(self.n); // should be false
    }
}
