contract Test3 {
    myMap: map<Int, Int>; // an empty map

    receive() {}

    // Getter function to retrieve an optional value from the map
    get fun getFromMap(key: Int): Int? {
        return self.myMap.get(key);
    }
}
