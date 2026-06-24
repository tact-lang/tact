contract GetterOptional {
    myMap: map<Int, Int>;

    init() {
        self.myMap = emptyMap();
        self.myMap.set(1, 42);
    }

    receive() {}

    get fun getFromMap(key: Int): Int? {
        return self.myMap.get(key);
    }
}
