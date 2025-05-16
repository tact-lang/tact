// Test Case 1: Boolean constant evaluation
contract BoolConstTest {
    const FLAG: Bool = true;
    flag: Bool = self.FLAG;

    receive() {
        if (self.FLAG) {
            // This branch is compiled in when FLAG is true
        }
    }
}
