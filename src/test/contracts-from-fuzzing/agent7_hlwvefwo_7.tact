message MyMessage {
    value: Int;
}

contract TestContract {
    receive(msg: MyMessage) {
        let value = msg.value;
    }
}