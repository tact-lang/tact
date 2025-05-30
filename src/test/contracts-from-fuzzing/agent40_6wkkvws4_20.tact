fun foo(a: Int,): Int {
    return 42;
}

contract C {
    receive() {
        foo(1);
    }
}