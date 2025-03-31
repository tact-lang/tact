contract Test {
    receive() {
        // Test: Using wildcard _ in foreach loop to discard keys. 
        // Using proper mutable variable declaration using let.
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        let sum: Int = 0;
        foreach (_, value in m) {
            sum += value;
        }
        dump(sum); // Expected output: 30
    }
}
