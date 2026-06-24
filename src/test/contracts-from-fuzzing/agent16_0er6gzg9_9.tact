contract Test {
    receive() {
        // Testing map.del on existing and non-existing keys
        let m: map<Int, Int> = emptyMap();
        m.set(7, 123);
        m.set(42, 321);

        let d1: Bool = m.del(7); // Expected to succeed, key 7 exists
        dump(d1); // Expected output: true

        let d2: Bool = m.del(7); // Expected to fail, key 7 was already deleted
        dump(d2); // Expected output: false
    }
}
