contract Test4 {
    // State variable: a map from Int to Int, empty by default
    state: map<Int, Int> = emptyMap();

    // Minimal receiver for full contract compilation
    receive () {}

    // Getter function with parameter that accesses the map.
    // Returns the value for a given key (Int?)
    get fun getMapValue(key: Int): Int? {
        return self.state.get(key);
    }
}
