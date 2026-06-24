fun testFromBase64(): Int {
    // Validate fromBase64 conversion from a valid Base64 string literal
    let s: String = "SGVyZSdzIEpvaG5ueSE="; // Base64 for "Here's Johnny!"
    let slice1: Slice = s.fromBase64();
    let slice2: Slice = s.asSlice().fromBase64();
    // Compare the hash of the slices as proxy for equality
    if (slice1.hash() != slice2.hash()) {
        throw(1);
    }
    return 42;
}

contract TestContract {
    receive() {
        dump(testFromBase64());
    }
}
