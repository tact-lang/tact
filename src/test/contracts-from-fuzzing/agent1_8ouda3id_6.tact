contract Test4 {
    // Persistent state variable map, automatically empty
    m: map<Int, Int>;

    receive() {}

    // Getter function returning the map state
    get fun getMap(): map<Int, Int> {
        return self.m;
    }
}
