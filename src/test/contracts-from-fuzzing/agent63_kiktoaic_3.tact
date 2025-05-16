message MyMsg {
    value: Int;
}

contract TestReceiverMyMsg {
    receive(msg: MyMsg) {
        // Handler for typed binary messages
    }
}
