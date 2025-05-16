contract Test {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(42, 100);
        dump(m);
    }
}
