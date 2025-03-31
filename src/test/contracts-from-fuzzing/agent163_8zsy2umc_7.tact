message MyMsg {
    a: Int;
}

contract TestMsgReceiver2 {
    // Receiver for typed binary messages using a 'message' type
    receive(msg: MyMsg) {
        // no operation
    }
}
