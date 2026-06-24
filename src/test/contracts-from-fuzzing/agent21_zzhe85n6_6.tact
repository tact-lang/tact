contract TestIsEmpty {
    receive() {
        // Test 5: isEmpty() method on maps
        let m: map<Int, Int> = emptyMap();
        let check1: Bool = m.isEmpty(); // expected: true
        m.set(1, 100);
        let check2: Bool = m.isEmpty(); // expected: false
    }
}
