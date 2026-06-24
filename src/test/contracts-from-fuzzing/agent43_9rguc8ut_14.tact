contract TestLogicalOps {
    receive() {
        // Logical AND
        dump(true && true);    // Expected: true
        dump(true && false);   // Expected: false
        dump(false && true);   // Expected: false

        // Logical OR
        dump(true || false);   // Expected: true
        dump(false || false);  // Expected: false
        dump(false || true);   // Expected: true
    }
}
