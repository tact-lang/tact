message MyMessage {
    a: Int;
}

contract Test {
    // Correct typed binary message receiver
    receive(msg: MyMessage) { }
}
