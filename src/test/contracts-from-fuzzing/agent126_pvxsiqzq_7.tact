message MyMessage { a: Int; }

contract Test {
    // Valid test: Receiver for a typed binary message using a message type
    receive(msg: MyMessage) {}
}
