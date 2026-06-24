contract TestMapAsCell {
    // Persistent state variable: map from Int to Int
    m: map<Int, Int> = emptyMap();

    init() {
        // Insert a key-value pair
        self.m.set(42, 100);
    }

    // Getter function to return the serialized cell representation of the map
    // According to documentation, if the map is non-empty, asCell() should return a Cell, otherwise null
    get fun getAsCell(): Cell? {
        return self.m.asCell();
    }
}
