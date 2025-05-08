fun test(): String {
    return "Hello \\ World!";
}

contract TestContract {
    receive() {
        test();
    }
}
