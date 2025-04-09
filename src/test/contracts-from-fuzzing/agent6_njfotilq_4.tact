const MY_CONSTANT: Int = 42;

contract Test {
    receive() {
        // Use top-level constant
        MY_CONSTANT;
    }
}
