fun testHashData(): Int {
    // Attempt to use a possibly malformed Unicode sequence.
    // It's not entirely clear if Tact allows partial code units.
    // Let us see if the compiler yields any error or warnings.

    return "\uD83D".hashData(); // incomplete UTF-16 surrogate
}

contract TestContract {
    receive() {
        let hashed = testHashData();
    }
}
