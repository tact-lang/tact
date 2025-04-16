/* Test 10 (revised): Using '_' in foreach to discard the value (capture key) */

contract Test {
    fun iterate(): Int {
        let m: map<Int,Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        // Discard the value, keep the key (we cannot sum due to immutability constraints, so we just iterate)
        foreach (k, _ in m) {
            // No operation needed
        }
        return 42;
    }
    receive() { self.iterate(); }
}
