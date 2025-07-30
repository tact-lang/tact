fun f(): Int {
    return 1
}

contract C {
    receive() { f(); }
}