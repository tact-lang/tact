contract Test {
    stateMap: map<Int, Int> = emptyMap();

    receive() {
        // Testing valid usage of map.set() with key Int and value Int
        self.stateMap.set(1, 42);
    }
}
