fun f(): Int {
    return 42;
}

contract Test {
    receive() {
        dump(f());
    }
}
