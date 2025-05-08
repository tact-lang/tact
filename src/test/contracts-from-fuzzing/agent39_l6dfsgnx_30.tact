message M {
    id: Int;
}

contract Test {
    receive(message: M) {
        message.id = 2;
    }
}