contract Test {
    // Receiver using a message type declared after the contract (forward reference)
    receive(msg: M) {
    }
}

message M { a: Int; }
