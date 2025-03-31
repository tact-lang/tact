fun test(): String {
    return "abc\\def";
}

contract Test {
    receive() {
        test();
    }
}
