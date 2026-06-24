// Case 1: Contract constant evaluated with an arithmetic expression
contract Test {
    const SUM: Int = 40 + 2;
    
    receive() {
        // Use constant in an expression
        let x: Int = self.SUM;
    }
}
