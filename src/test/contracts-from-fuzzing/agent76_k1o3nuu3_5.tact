contract TestMap {
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
    }

    receive () {}

    get fun getFromMap(): Int? {
        return self.m.get(999);
    }
}
