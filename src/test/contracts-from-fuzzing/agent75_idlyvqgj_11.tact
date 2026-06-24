contract TestGetterMap {
    m: map<Int, Int> = emptyMap();
    receive() {}

    // Getter with parameter: returns the value associated with the given key, or null if absent
    get fun getKey(k: Int): Int? {
         return self.m.get(k);
    }
}
