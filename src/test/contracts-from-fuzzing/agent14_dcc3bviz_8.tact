message MyMsg {
    a: Int
}

contract TestTypedMsg {
    // Receiver for typed binary messages: expects a message of type MyMsg
    receive(msg: MyMsg) {
        // Accessing a field of the message
        let _ = msg.a;
    }
}
