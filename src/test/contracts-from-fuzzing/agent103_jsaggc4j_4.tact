message MyMessage {
    value: Int;
}

contract TestTypedBinary {
    // Testing typed binary message receiver: 'receive(msg: MyMessage)'
    receive(msg: MyMessage) {
        // Process the MyMessage type
    }
}
