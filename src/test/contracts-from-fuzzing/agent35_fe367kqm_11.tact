fun testOps() {
    // Division rounds toward -∞
    dump(3 / 2);       // expected: 1
    dump(-3 / 2);      // expected: -2 (since -1.5 rounds down to -2)

    // Modulo operator behavior
    dump(1 % -5);      // expected: -4 (as specified in the docs)

    // Bitwise NOT and variations
    dump(~5);          // expected: -6 (bitwise NOT of 5)
    dump(-(~5));       // expected: 6
}

fun runTest() {
    testOps();
}
