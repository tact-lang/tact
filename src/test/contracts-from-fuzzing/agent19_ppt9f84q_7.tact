contract TestMap {
    mymap: map<Int, Int>;

    receive() {}

    // Getter function: returns an optional Int, corresponding to the map lookup
    get fun getMapValue(key: Int): Int? {
        return self.mymap.get(key);
    }
}
