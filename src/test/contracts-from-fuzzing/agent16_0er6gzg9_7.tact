contract Test {
    receive() {
        // Testing map.replace on existing and non-existing keys
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(42, 42);
        
        let r1: Bool = m.replace(7, 68); // Should succeed and return true
        dump(r1); // Expected output: true
        
        let r2: Bool = m.replace(8, 68); // Should fail as key 8 doesn't exist, returning false
        dump(r2); // Expected output: false
    }
}
