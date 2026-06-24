contract Test {
    receive() {
        // Correct map type syntax uses angle brackets
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        // Using discarded wildcards in foreach iteration
        foreach (_, _ in m) {
            // No operation
        }
    }
}
