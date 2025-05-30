contract TestMapEqualityComparison {
    m1: map<Int, Int> = emptyMap();
    m2: map<Int, Int> = emptyMap();

    init() {
        self.m1.set(1, 2);
        self.m2.set(1, 2);
    }

    get fun compare(): Bool {
        // Shallow equality and deep equality
        return (self.m1 == self.m2) && self.m1.deepEquals(self.m2);
    }
}
