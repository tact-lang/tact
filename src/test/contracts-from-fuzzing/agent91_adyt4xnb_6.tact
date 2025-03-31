contract Test5 {
    myMap: map<Int, Int> = emptyMap();

    receive() {}

    get fun getFromMap(key: Int): Int? {
        return self.myMap.get(key);
    }
}
