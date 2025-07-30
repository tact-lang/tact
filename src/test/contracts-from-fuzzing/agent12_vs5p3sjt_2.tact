fun returnsHelloWorld(): String {
    return "Hello, world!";
}

contract Test {
    receive() {
        returnsHelloWorld();
    }
}
