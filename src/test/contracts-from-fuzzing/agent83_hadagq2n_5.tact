fun test_quote() : String {
    return "He said: \"Hello\"";
}

contract TestContract {
    receive() {
        test_quote();
    }
}
