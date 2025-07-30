const MY_CONSTANT: Int = 42;

contract Test {
    receive() {
        // Valid use of a global constant in a local variable
        let x: Int = MY_CONSTANT;
    }
}
