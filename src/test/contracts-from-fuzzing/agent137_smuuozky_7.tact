message MyMsg { }

contract TestTypedBinary {
    // This receiver is designed to match typed binary messages using a custom message type
    receive(msg: MyMsg) {
        // do nothing
    }
}
