contract GetterMapOptional {
    m: map<Int, Int> = emptyMap();

    receive() {}

    get fun getValue(key: Int): Int? {
        return self.m.get(key);
    }
}
