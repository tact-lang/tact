message MyMessage {
    a: Int;
}

contract Test {
    // Receiver for typed binary message, now using 'message' declaration as per documentation 
    receive(msg: MyMessage) {
        // body intentionally left empty
    }
}
