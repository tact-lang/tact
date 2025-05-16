contract Test4 {
    m: map<Int, Int> = emptyMap();

    receive() {}

    get fun getKey(): Int? {
        return self.m.get(123);
    }
}
