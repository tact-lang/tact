message TestMsg { a: Int; }

contract TestMessage() {
    receive(msg: TestMsg) {
        // Dump the field from the received message; expected output: the value of a
        dump(msg.a);
    }
}
