fun test(): String {
    return "He said \"Hello!\"";
}

contract TestContract {
    receive() {
        test();
    }
}
