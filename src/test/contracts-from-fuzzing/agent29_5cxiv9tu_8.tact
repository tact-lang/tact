contract Test {
    m: map<Int, Int> = emptyMap();

    get fun getMapValue(key: Int): Int? {
        return self.m.get(key);
    }

    receive() {
        self.getMapValue(1);
    }
}
