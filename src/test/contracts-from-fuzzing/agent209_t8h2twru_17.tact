fun f(a: Int, ): Int {
    return a;
}

contract C {
    receive() {
        f(1);
    }
}
