contract TestGetterOptionalMap {
    m: map<Int, Int> = emptyMap();

    init() {
         // Do not insert any key-value pairs, so map is empty
    }
    
    receive() {}

    get fun getOptional(key: Int): Int? {
         return self.m.get(key);
    }
}
