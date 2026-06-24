contract TestGetterMap {
    m: map<Int, Int>;

    receive() {}

    get fun getZero(): Int? {
        return self.m.get(0);
    }
}
