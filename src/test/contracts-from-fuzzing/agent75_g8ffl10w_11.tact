fun test_ternary_valid(): Int {
    return true ? 1 : 2;
}

contract TestTernaryValid {
    receive() {
        test_ternary_valid();
    }
}
