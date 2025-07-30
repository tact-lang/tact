fun f(a: Int, ): Int { return a; }

contract Test {
    receive() { f(1); }
}