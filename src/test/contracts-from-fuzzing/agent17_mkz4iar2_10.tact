contract Test {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(4, 16);
        dump(m);
    }
}
