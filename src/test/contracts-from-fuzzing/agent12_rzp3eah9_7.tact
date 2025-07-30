const FLAG: Bool = true;

contract Test {
    receive() {
        if (FLAG) {
            // Constant true branch
        } else {
            // Constant false branch
        }
    }
}
