fun test(): Int {
    return 42;
}

contract TestContract {
    receive() {
        test();
    }
}