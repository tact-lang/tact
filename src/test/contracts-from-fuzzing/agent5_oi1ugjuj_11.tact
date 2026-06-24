contract Test {
    receive() {
        // Dump a map type using correct generic syntax
        let m: map<Int, Int> = emptyMap();
        m.set(2 + 2, 4);
        dump(m);
    }
}
