fun f(a: Int, b: Int,) {
    return;
}

contract C {
    receive() {
        f(1,2);
    }
}