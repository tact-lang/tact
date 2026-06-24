fun test(): String {
    return "Hello Tact!";
}

contract TestContract {
    receive() {
        test();
    }
}
