fun test(): String {
    return "Hello, world!";
}

contract TestContract {
    receive() {
        let s: String = test();
    }
}
