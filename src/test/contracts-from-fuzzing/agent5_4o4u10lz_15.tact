contract TestMapIterationOrder {
    // State variable map and helper variables to check iteration order
    m: map<Int, Int>;
    prev: Int;
    flag: Int; // flag = 1 means order is correct, 0 means incorrect

    init() {
        self.m = emptyMap();
        // Insert keys in arbitrary order; iteration is expected to be in ascending order
        self.m.set(10, 100);
        self.m.set(3, 30);
        self.m.set(7, 70);
        self.m.set(-1, -10);
        // Initialize prev to a very low value
        self.prev = -1000000000;
        self.flag = 1;
    }

    // Non-get function that updates flag based on iteration order over self.m
    fun checkOrder() {
        foreach (k, v in self.m) {
            if (k < self.prev) {
                self.flag = 0;
            }
            self.prev = k;
        }
    }

    get fun test(): Int {
        self.checkOrder();
        return self.flag; // expected 1 if iteration order is ascending
    }
}
