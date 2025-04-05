const FLAG: Bool = true;

contract TestBool {
    receive() {
        if (FLAG) {
            // Constant Boolean works correctly
        }
    }
}
