fun f(a: Int, ) {
    return;
}

contract C {
    receive() {
        f(1);
    }
}