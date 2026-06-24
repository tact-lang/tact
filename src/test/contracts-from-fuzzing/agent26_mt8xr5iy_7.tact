contract Test {
    receive() {
        // Test .del() on maps
        let m: map<Int, Int> = emptyMap();
        m.set(7, 123);
        m.set(42, 321);
        let del1: Bool = m.del(7); // expected true
        let del2: Bool = m.del(7); // expected false
    }
}
