contract TestGetterReturnMap {
    // Persistent map field, emptyMap is default for maps
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
        self.m.set(1, 111);
    }

    receive() {}

    get fun getMap(): map<Int, Int> {
        return self.m;
    }
}
