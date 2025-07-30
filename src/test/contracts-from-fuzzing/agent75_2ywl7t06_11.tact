contract PrecTest {
    receive() {
        // Testing operator precedence: multiplication before addition
        // Expected: 1 + (2 * 3) = 7
        dump(1 + 2 * 3);
    }
}
