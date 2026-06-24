const VALUE: Int = 123;

contract Test {
    receive() {
        dump(VALUE);
    }
}
