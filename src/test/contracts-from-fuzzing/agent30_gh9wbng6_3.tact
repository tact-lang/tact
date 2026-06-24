const E: Int = ton("0.5"); // Expected: 500000000

contract TestTon {
    receive() {
        dump(E);
    }
}
