contract DivTest {
    receive() {
        // In Tact, integer division rounds toward -∞.
        // For example, 3/2 yields 1, and -3/2 should yield -2.
        let result = -3 / 2; // expected: -2
        dump(result);
    }
}
