contract TestMap {
    // Test dump() with a map type (map<Int, Int>)
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(4, 16);
        dump(m);
    }
}
