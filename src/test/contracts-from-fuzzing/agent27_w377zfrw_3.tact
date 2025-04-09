fun test(): String {
    return "Hello, world!\n\t\r";
}

contract TestContract {
    receive() {
        test();
    }
}
