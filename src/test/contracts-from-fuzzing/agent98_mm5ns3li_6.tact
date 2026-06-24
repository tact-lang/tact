contract TestMapGetter {
    myMap: map<Int, Int>;

    receive() {}

    // This getter attempts to get a non-existent key from the map, which should return null
    get fun getMapValue(): Int? {
        return self.myMap.get(100);
    }
}
