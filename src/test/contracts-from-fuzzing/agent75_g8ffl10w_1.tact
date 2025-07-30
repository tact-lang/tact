fun test_int(): Int {
    return 42;
}

contract TestInt {
    receive() {
        test_int();
    }
}
