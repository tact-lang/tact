contract Test4 {
    m: map<Int, Int> = emptyMap();

    receive() {}

    get fun getFromMap(key: Int): Int? {
        return self.m.get(key);
    }
}
