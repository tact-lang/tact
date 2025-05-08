fun test(): String {
    return "Hello\nWorld!";
}

contract TestContract {
    receive() {
        test();
    }
}
