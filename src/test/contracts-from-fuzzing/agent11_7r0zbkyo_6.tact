fun test(): String {
    return "😀";
}

contract TestContract {
    receive() {
        test();
    }
}
