const MY_CONSTANT: Int = 42;

contract Test {
    receive() {
        if (MY_CONSTANT > 10) { }
    }
}
