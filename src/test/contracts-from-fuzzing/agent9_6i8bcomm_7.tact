message MyMessage {
    value: Int;
}

contract Receiver {
    receive(msg: MyMessage) {
    }
}