contract TestOptionalGetter {
    m: map<Int, Int>;
    
    init() {
        self.m = emptyMap();
        self.m.set(10, 500);
    }
    
    receive() {}
    
    // Getter function with one parameter to fetch an optional value from the map
    get fun getOptional(key: Int): Int? {
        return self.m.get(key);
    }
}
