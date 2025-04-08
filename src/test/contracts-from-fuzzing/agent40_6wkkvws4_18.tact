fun foo(): Int {
    return 42;
}

contract C {
    receive() {
        foo();
    }
}