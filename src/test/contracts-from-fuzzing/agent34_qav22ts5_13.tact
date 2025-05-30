fun foo(_ : Int): Int { return 123; }

contract Test {
    receive() {
        dump(foo(10));
    }
}
