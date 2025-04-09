message MyMessage {
    value: Int;
}

contract MyContract {
    receive(msg: MyMessage) {
    }
}
