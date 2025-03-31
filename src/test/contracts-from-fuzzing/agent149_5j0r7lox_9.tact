message MyMessage {
    a: Int;
}

contract Test {
    receive(msg: MyMessage) {
        // Typed message receiver: should be invoked for messages matching MyMessage
    }
    
    receive(msg: Slice) {
        // Fallback binary message receiver
    }
}
