message MyMessage {
    value: Int;
}

contract TestContract {
    receive(msg: MyMessage) {
        // Do nothing with the message for now
    }
}