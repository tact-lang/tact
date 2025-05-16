contract TestMap {
    mapField: map<Int, Int>;

    init() {
        self.mapField = emptyMap();
        self.mapField.set(1, 100);
    }

    receive() {}

    get fun getValue(key: Int): Int? {
        return self.mapField.get(key);
    }
}
