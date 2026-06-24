const MY_CONSTANT: Int = 42;

contract Test {
    receive() {
        require(MY_CONSTANT == 42, "MY_CONSTANT must be 42");
    }
}
