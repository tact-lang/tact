/// Test case: Valid usage of compile-time function ton
contract TestTonValid {
    // Testing conversion of human-readable toncoin values to nanoToncoins
    one: Int = ton("1");            // Expected: 10^9
    pointOne: Int = ton("0.1");       // Expected: 10^8
    nano: Int = ton("0.000000001");   // Expected: 1

    receive () {}
}
