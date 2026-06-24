fun test_bool(): Bool {
    return false;
}

contract TestBool {
    receive() {
        test_bool();
    }
}
