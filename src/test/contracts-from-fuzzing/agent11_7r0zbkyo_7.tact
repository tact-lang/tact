fun test(): String {
    return "Hello \x1F world";
}

contract TestContract {
    receive() {
        test();
    }
}
