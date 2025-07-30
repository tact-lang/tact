contract TestMap1 {
    // Persistent map state variable mapping Int to Int
    stateMap: map<Int, Int>;

    // Initialization function using init() to initialize the map
    init() {
        self.stateMap = emptyMap();
        // Use the .set() method without assignment because it returns void
        self.stateMap.set(1, 42);
    }

    // Receiver function testing the .get() method
    receive() {
        let a: Int? = self.stateMap.get(1); // should retrieve 42
        let b: Int? = self.stateMap.get(2); // should be null (non-existent key)
    }
}
