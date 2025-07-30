contract TestMap {
    dict: map<Int, Int>;
    
    receive() {}
    
    // Returns the value under the given key, or null if not present
    get fun getFromMap(key: Int): Int? {
        return self.dict.get(key);
    }
}
