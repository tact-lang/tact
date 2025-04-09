contract Test {
    // Persistent map state variable; maps Int keys to Int values.
    m: map<Int, Int>;
    
    // default persistent state variables are empty
    receive() {}
    
    // Getter that returns the value corresponding to the provided key, or null if the key isn't found
    get fun getMapValue(key: Int): Int? {
        return self.m.get(key);
    }
}
