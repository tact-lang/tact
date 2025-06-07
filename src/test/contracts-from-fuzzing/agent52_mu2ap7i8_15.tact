contract TestMapGetter {
    m: map<Int, Int> = emptyMap();
    
    receive() {}

    // Getter: returns an optional Int from map m
    get fun getFromMap(key: Int): Int? {
        return self.m.get(key);
    }
}
