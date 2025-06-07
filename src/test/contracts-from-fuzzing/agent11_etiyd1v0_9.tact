contract MapModificationTest {
    // Persistent state variable: a map from Int to Int
    fizz: map<Int, Int>;

    // Constructor: initialize the map with two entries
    init() {
        self.fizz = emptyMap();
        self.fizz.set(1, 10);
        self.fizz.set(2, 20);
    }

    // Function attempting to modify the map during iteration by deleting elements
    fun updateDuringIteration() {
        foreach (k, v in self.fizz) {
            // Attempt to delete the current key during iteration
            self.fizz.del(k);
        }
    }

    // Getter to return a proxy for entries count based on existence of key 1
    get fun countEntries() : Int {
        if (self.fizz == null) {
            return 0;
        } else {
            if (self.fizz.exists(1)) {
                return 1;
            } else {
                return 0;
            }
        }
    }
}
