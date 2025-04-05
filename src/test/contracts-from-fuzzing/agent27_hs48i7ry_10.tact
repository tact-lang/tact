const B: Int = ton("1");

contract Test {
    receive() {
        require(B == ton("1"), "ok");
    }
}
