// Test for constant arithmetic in contract
contract TestArithmetic {
    // Constant defined inside contract, computed at compile time
    const SIX: Int = 3 + 3;

    receive() {
        dump(self.SIX); // Expected to dump 6
    }
}
