message MyMessage {
    value: Int;
}

contract TestContract {
    receive(msg: MyMessage) {
        let val = msg.value;
    }
}