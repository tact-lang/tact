contract Test {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        dump(m.exists(1)); // expected: true
        dump(m.exists(2)); // expected: false
    }
}
