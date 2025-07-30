message MyMessage {
    value: Int;
}

contract SimpleContract {
    receive(msg: MyMessage) {
        let value = msg.value;
    }
}