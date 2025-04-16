fun test(a: Int, ): Int {
    return 1;
}

contract C {
    receive() { test(1); }
}