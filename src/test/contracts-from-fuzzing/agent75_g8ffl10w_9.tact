fun test_extension(): String {
    return 42.toString();
}

contract TestExtension {
    receive() {
        test_extension();
    }
}
