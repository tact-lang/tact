const X: Int = 40 + 2;

contract Test1 {
    receive() {
        require(X == 42, "ok");
    }
}
