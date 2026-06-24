fun test_empty(): Bool {
    // Testing empty string literal equality
    return "" == "";
}

contract TestContract {
    receive() {
        test_empty();
    }
}
