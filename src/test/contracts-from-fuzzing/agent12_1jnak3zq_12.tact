contract Test {
    receive() {
        let m: map<Int,Int> = emptyMap();
        m.set(1, 42);
        dump(m);
    }
}
