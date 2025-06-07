fun test(_: Int, _: Int) {}

contract Test {
    receive() {
        test(1, 2);
    }
}
