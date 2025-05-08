contract TestValidMap {
    state: map<Int, Int>;

    init() {
        // initialize the map
        self.state = emptyMap();
        // insert a key-value pair
        self.state.set(1, 100);
        // retrieve the value
        let x: Int = self.state.get(1)!!;  // x should be 100
        // update the key's value
        let replaced: Bool = self.state.replace(1, 200);
        // retrieve the new value
        let y: Int = self.state.get(1)!!;  // y should be 200
        // delete the key using .del
        let deleted: Bool = self.state.del(1);
        let z: Int? = self.state.get(1);
        // Use variables to avoid warnings
        let _ = x + y + (deleted ? 1 : 0) + (z == null ? 1 : 0);
    }

    get fun read(key: Int): Int? {
        return self.state.get(key);
    }
}
