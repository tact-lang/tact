message A { v: Int; }

contract Test {
    // Valid binary message receiver using a message type
    receive(msg: A) {}
}
