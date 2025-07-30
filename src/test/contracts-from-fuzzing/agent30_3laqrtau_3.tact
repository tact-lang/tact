message MyMessage {
    value1: Int;
    value2: Int?;
}

contract MyContract {
    receive(msg: MyMessage) {
        let x = msg.value1;
        let y = msg.value2;
    }
}
