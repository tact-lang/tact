contract Test {
    // Declare an empty map from Int to Int using the correct map syntax
    m: map<Int, Int> = emptyMap();

    receive() {}

    // Getter function that takes a key and returns the value from the map, if any
    get fun getMapValue(key: Int): Int? {
        return self.m.get(key);
    }
}
