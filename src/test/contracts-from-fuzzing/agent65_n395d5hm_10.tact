contract TestMapGetter {
    m: map<Int, Int> = emptyMap();

    receive() {}

    // Getter returning the value for a non-existent key, expecting null
    get fun getValue(): Int? {
        return self.m.get(999);
    }
}
