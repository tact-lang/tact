contract TestMap {
    // Persistent state variable: a map from Int to Int
    mapping: map<Int, Int> = emptyMap();

    // Receiver to ensure full compilation
    receive() {}

    // Initialization function to set a key-value pair
    init() {
        self.mapping.set(1, 100);
    }

    // Getter function that retrieves a value from the map by key
    // Returns an optional Int (null if the key does not exist)
    get fun getMapValue(key: Int): Int? {
        return self.mapping.get(key);
    }
}
