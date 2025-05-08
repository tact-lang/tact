fun testExtendedEscapes(): Int {
    // Test various escape sequences including hex escape, Unicode escape, and extended Unicode escape.
    let s: String = "Hex: \x41, Unicode: \u0041, Extended: \u{1F602}"; // Expected to print: "Hex: A, Unicode: A, Extended: 😂"
    return s.hashData();
}

contract TestContract {
    receive() {
        dump(testExtendedEscapes());
    }
}
