fun test_base64() {
    let s: String = "SGVyZSdzIEpvaG5ueSE=";
    let slice1: Slice = s.fromBase64();
    let slice2: Slice = s.asSlice().fromBase64();
    // Compare slices using equality operator
    if (slice1 == slice2) {
        // All good
        return;
    }
}

contract Test {
    receive() {
        test_base64();
    }
}
