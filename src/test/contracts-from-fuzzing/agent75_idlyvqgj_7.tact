contract TestEmptyMap {
    // Persistent map, explicitly initialized to empty map
    m: map<Int, Int> = emptyMap();
    receive() {}

    // Getter function returning the persistent map
    get fun getEmptyMap(): map<Int, Int> {
        return self.m;
    }
}
