const A: Int = 42;

contract Test {
    receive() {
        // Second argument must be a string error message
        require(A == 42, "ok");
    }
}
