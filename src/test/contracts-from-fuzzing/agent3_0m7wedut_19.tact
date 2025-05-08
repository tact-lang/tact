contract TestMapDeletion {
    // Persistent state map from Int to Int
    m: map<Int, Int> = emptyMap();

    init() {
        // Insert entries into the map
        self.m.set(1, 100);
        self.m.set(2, 200);

        // Delete key 1 by setting its value to null
        self.m.set(1, null);
        if (self.m.get(1) != null) {
            throw(1);
        }

        // Delete key 2 using .del() method
        let res1: Bool = self.m.del(2);
        if (!res1) {
            throw(2);
        }
        if (self.m.get(2) != null) {
            throw(3);
        }

        // Attempt to delete a non-existing key should return false
        let res2: Bool = self.m.del(3);
        if (res2) {
            throw(4);
        }
    }

    // Getter function to report status if no throw occurred
    get fun status(): Int {
        // If initialization passed, return 42
        return 42;
    }
}
