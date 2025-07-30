contract TestDeepEquals {
    m1: map<Int, Int> = emptyMap();
    m2: map<Int, Int> = emptyMap();

    receive() {
        // Populate both maps with identical entries
        self.m1.set(1, 100);
        self.m1.set(2, 200);
        self.m2.set(1, 100);
        self.m2.set(2, 200);

        // Deep equality should succeed
        let eq1: Bool = self.m1.deepEquals(self.m2);
        dump(eq1); // Expected: true

        // Modify one map
        self.m2.set(2, 201);
        let eq2: Bool = self.m1.deepEquals(self.m2);
        dump(eq2); // Expected: false
    }
}
