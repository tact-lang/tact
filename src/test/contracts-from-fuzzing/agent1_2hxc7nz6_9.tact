message(0x12345678) Ping { // Define opcode in the message declaration using hex literal
    queryId: Int as uint64;
}

contract Test {
    receive(msg: Ping) {
        // Handle Ping message
    }
}
