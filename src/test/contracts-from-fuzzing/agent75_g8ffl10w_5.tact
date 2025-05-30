fun test_add(): Int {
    return 10 + 32;
}

contract TestAdd {
    receive() {
        test_add();
    }
}
