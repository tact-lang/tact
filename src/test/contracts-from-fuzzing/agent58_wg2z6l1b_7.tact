contract TestMap {
    // Declare a persistent state variable of map type; maps are empty by default
    m: map<Int, Int>;

    receive() {}

    // Getter function to retrieve a value from the map by its key
    // It returns an optional Int (null if key not found)
    get fun getValue(k: Int): Int? {
        return self.m.get(k);
    }
}
