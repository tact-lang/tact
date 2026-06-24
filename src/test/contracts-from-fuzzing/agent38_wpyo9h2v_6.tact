contract Test_MapGetter {
    // A map from Int to Int; initially empty
    m: map<Int, Int>;

    receive() {}

    // Getter function that takes a key as a parameter and returns the associated value if it exists
    get fun getMapValue(key: Int): Int? {
        return self.m.get(key);
    }
}
