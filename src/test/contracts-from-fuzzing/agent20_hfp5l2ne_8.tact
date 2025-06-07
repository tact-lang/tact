contract TestMap {
    m: map<Int, Int> = emptyMap();

    receive() {}
    
    get fun getMapValue(key: Int): Int? {
         return self.m.get(key);
    }
}
