const MY_CONSTANT: Int = 42;

contract Test {
    receive() {
        if (MY_CONSTANT == 42) {
            // valid constant usage in contract
        }
    }
}
