fun test_escape(): String {
    return "Line1\nLine2: \"Quote\" and \\ Backslash";
}

contract TestContract {
    receive() {
        test_escape();
    }
}
