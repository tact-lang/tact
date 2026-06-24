// Test 3: Contract Bool constant

contract Test3 {
    const FLAG: Bool = true;

    receive() {
        if (self.FLAG) { }
    }
}
