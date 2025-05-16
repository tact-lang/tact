// Test 17: MapCompare - comparing two maps using deepEquals()
contract MapCompare {
    // Persistent map fields
    m1: map<Int, Int>;
    m2: map<Int, Int>;

    init() {
        // Set m1 in one order
        self.m1.set(1, 10);
        self.m1.set(2, 20);
        // Set m2 in reverse order
        self.m2.set(2, 20);
        self.m2.set(1, 10);
    }

    // Getter function returns true if maps are deep-equal
    get fun compare(): Bool {
        return self.m1.deepEquals(self.m2);
    }
}
