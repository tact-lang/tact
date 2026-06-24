fun test(_: Int): Int { return 0; }

contract C { 
    receive() {
        test(42);
    }
}
