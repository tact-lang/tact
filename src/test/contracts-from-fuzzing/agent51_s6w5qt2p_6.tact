fun getNumber(): Int {
    return 42;
}

contract Test {
    receive() {
        dump(getNumber());
    }
}
