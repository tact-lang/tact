fun greet(): String {
    return "Hello";
}

contract TestContract {
    receive() {
        dump(greet());
    }
}
