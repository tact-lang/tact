fun test_empty() : String {
    return "";
}

contract TestContract {
    receive() {
        test_empty();
    }
}
