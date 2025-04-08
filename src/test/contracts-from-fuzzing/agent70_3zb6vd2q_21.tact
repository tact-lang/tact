fun contract(a: Int): Int {
    return a;
}

contract C {
    receive() {
        contract(1);
    }
}