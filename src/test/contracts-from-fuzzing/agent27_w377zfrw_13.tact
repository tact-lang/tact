fun test_hex_escape(): String {
    // Using hex escapes to form "ABC"
    return "\x41\x42\x43";
}

contract TestContract {
    receive() {
        test_hex_escape();
    }
}
