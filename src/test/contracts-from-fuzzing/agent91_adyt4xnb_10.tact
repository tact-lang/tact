contract Test9 {
    myMap: map<Int, Int> = emptyMap();

    receive() {}

    get fun getMissing(): Int? {
        return self.myMap.get(999);
    }
}
