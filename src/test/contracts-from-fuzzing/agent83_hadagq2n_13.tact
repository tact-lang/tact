fun test_hex_escape() : String {
    return "Hex: \x41";
}

contract TestContract {
    receive() {
        test_hex_escape();
    }
}
