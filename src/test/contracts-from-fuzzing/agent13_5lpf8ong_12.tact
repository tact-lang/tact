// Test 1: Constant using compile-time function ton
// This snippet tests that constants can be initialized with compile-time functions.
contract ConstTon {
    const ONE: Int = ton("1");
    amount: Int = self.ONE;

    receive() {}
}
