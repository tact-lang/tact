trait BaseTrait { }

contract Test {
    receive() {
        nonExistentVariable = 42;
    }
}
