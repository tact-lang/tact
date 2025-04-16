fun test(_: Int) {}

contract Test {
    receive() {
        test(42);
    }
}
