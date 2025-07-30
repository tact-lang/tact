fun getVal(): Int {
    return 42;
}

contract TestReturn {
    receive() {
        dump(getVal());
    }
}
