contract Test {
    receive() {
        // Testing dump with a map: key Int and value Int
        let m: map<Int, Int> = emptyMap();
        m.set(2 + 2, 4);
        dump(m);
    }
}
