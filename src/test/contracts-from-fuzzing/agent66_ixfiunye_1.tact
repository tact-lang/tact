fun greet(): String {
    return "Hello World";
}

contract TestContract {
    receive() {
        greet();
    }
}
