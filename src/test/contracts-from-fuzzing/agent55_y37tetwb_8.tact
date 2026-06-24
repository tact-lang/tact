// Test 1: Boolean constant in a contract
contract TestBool {
    const FLAG: Bool = true;

    receive() {
         let b: Bool = self.FLAG;
    }
}
