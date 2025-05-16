contract TestGetterMapAccess2 {
    m: map<Int, Int> = emptyMap();

    receive() {}

    get fun getMap(key: Int): Int? {
         return self.m.get(key);
    }
}
