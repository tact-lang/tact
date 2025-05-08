contract TestMapGetter {
    m: map<Int, Int> = emptyMap();

    receive() {}

    get fun getMissing(): Int? {
        return self.m.get(1);
    }
}
