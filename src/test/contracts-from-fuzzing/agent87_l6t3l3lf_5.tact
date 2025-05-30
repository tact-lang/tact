contract TestMap {
    // Declare a persistent state variable of type map with Int keys and Int values using angle brackets syntax
    m: map<Int, Int> = emptyMap();

    // Initialize the map in the constructor (optional since maps default to empty)
    init() {
        // Set a key-value pair for testing
        self.m.set(42, 100);
    }

    receive() {}

    // Getter function to retrieve a value from the map by key
    get fun getMapValue(key: Int): Int? {
        return self.m.get(key);
    }
}
