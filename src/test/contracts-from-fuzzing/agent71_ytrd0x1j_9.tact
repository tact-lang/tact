contract TestMapGetter {
    // Persistent map from Int to Int declared with the correct syntax
    m: map<Int, Int>;

    init() {
        // Persistent map variables are empty by default, but here we explicitly initialize one entry
        self.m.set(1, 111);
    }

    receive() {}

    // Getter function that returns the value for a given key
    // If the key is not found, returns null
    get fun getMapValue(key: Int): Int? {
        return self.m.get(key);
    }
}
