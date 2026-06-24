contract Test_MapReturn {
    // A map from Int to Int
    m: map<Int, Int>;

    init() {
        // Initialize map with a single entry for demonstration
        self.m.set(1, 100);
    }

    receive() {}

    // Getter function returning the map itself
    get fun getMap(): map<Int, Int> {
        return self.m;
    }
}
