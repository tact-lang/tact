// Test Case 1: Contract constant accessed via self
contract TestConstantSelf {
    const B: Int = 30;

    receive() {
        let r: Int = self.B + 10;
    }
}
