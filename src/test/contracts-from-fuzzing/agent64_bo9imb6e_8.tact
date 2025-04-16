contract TestMapKey {
    m: map<Int, Int> = emptyMap();
    
    receive() {}
    
    get fun getKey(): Int? {
        // Attempt to get a key that doesn't exist
        return self.m.get(999);
    }
}
