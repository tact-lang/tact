fun escapeTest(): String {
    return "He said, \"Hello World\".";
}

contract TestContract {
    receive() {
        escapeTest();
    }
}
