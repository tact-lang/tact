contract TestMap {
    receive() {
        // Testing dump() with a map using add and then dump
        let m: map<Int, Int> = emptyMap();
        m.set(2 + 2, 4);
        dump(m);
    }
}
