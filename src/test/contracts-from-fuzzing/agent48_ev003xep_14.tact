contract TestMapGetterValid {
    // Persistent state variable: map that maps Int keys to Int values
    m: map<Int, Int>;

    receive() {}

    // Getter that returns the map
    get fun getMap(): map<Int, Int> {
        return self.m;
    }
}
