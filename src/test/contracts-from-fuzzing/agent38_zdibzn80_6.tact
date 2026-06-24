contract Test_isEmpty {
    receive() {
        let m: map<Int, Int> = emptyMap();
        dump(m.isEmpty()); // Expected output: true
        m.set(42, 123);
        dump(m.isEmpty()); // Expected output: false
    }
}
