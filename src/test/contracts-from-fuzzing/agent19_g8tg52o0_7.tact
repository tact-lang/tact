contract DebugMap {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(2 + 2, 4);
        dump(m);
    }
}
