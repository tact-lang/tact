const MY_CONSTANT: Int = 42;

contract Test {
    receive() {
         throwIf(100, MY_CONSTANT != 42);
    }
}
