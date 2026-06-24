contract TestMapReset {
    // Persistent state variable: map from Int to Int
    m: map<Int, Int> = emptyMap();

    init() {
        // Insert a key-value pair, then reset the map
        self.m.set(1, 1);
        // Reset the map by assigning null, which should be equivalent to emptyMap()
        self.m = null;
        // After reset, the map should be empty (i.e. compare equal to null)
        if (self.m != null) {
            throw(1);
        }
    }

    // Getter function to check whether the map is empty (null)
    get fun check(): Bool {
        return self.m == null;
    }
}
