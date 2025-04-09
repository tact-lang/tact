message MyMessage {
    value: Int;
}

contract MessageContract {
    receive(msg: MyMessage) {
    }
}