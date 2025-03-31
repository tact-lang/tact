contract Test6 {
    myMap: map<Int, Int>;

    init() {
        self.myMap = emptyMap();
    }

    get fun getKeyValue(key: Int): Int? {
        return self.myMap.get(key);
    }

    receive() {}
}
