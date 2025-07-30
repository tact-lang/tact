fun foo(_ : Int): Int { return 1; }

contract Test {
    receive() { foo(42); }
}
