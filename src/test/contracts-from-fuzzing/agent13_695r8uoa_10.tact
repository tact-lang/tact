contract TestContract {
    mapVar: map<Int, Int>; // a map from Int keys to Int values
    init() {
        self.mapVar = emptyMap();
        self.mapVar.set(1, 100);
    }

    receive() {
        // testing assignment, no complexities.
        self.mapVar.set(2, 200);
    }
}