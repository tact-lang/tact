contract TestMapAccess {
    m: map<Int, Int> = emptyMap();

    receive() {}

    get fun getValue(): Int? {
        return self.m.get(100);
    }
}
