fun test(): Int {
    return 123;
}

contract Test {
    receive() {
        test();
    }
}