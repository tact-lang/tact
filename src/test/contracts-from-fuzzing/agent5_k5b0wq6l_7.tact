contract Test {
    receive() {
        // Dumping a map using correct generic syntax
        let m: map<Int, Int> = emptyMap();
        m.set(4, 16);
        dump(m);
    }
}
