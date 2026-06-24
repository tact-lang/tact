contract TestMapReplace {
    receive() {
        // Initialize map
        let m: map<Int, Int> = emptyMap();
        m.set(5, 200);
        // Case 1: Replace existing key
        let rep1: Bool = m.replace(5, 300);
        // Case 2: Attempt to replace non-existent key
        let rep2: Bool = m.replace(10, 100);
        dump(rep1); // expected: true
        dump(rep2); // expected: false
        dump(m.get(5)!!); // expected: 300
    }
}
