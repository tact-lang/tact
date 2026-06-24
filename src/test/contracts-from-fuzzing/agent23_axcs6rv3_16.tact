/* Test 11 (revised): Using '_' in foreach to discard both key and value */

contract Test {
    fun countEntries(): Int {
        let m: map<Int,Int> = emptyMap();
        m.set(3, 300);
        m.set(4, 400);
        // Using wildcard for both key and value
        foreach (_, _ in m) {
            // No operation needed
        }
        return 42;
    }
    receive() { self.countEntries(); }
}
