// Test Case 2: Constant using compile-time function ascii
// This snippet tests that constants can be initialized with compile-time function ascii.
contract ConstAscii {
    const CODE: Int = ascii("ab");
    value: Int = self.CODE;

    receive() {}
}
