fun test(): String {
    return "Hello, Tact strings!";
}

contract TestContract {
    receive() {
        test();
    }
}
