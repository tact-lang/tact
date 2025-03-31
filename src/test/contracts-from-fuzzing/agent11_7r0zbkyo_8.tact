fun test(): String {
    return "Hello
Multiple lines";
}

contract TestContract {
    receive() {
        test();
    }
}
