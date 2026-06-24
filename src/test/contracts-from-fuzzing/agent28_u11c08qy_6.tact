contract TestMapGet {
    // Initialize the map using correct Tact syntax with angle brackets
    m: map<Int, Int> = emptyMap();
    
    receive() {}
    
    // Getter that queries the map: returns the value for the given key, or 0 if the key is absent
    get fun getValue(key: Int): Int {
        let maybe: Int? = self.m.get(key);
        if (maybe == null) {
            return 0;
        } else {
            return maybe!!;
        }
    }
}
