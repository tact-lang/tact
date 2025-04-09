fun test(): String {
    return "Hello
world";
}

contract Test {
    receive() {
        test();
    }
}
