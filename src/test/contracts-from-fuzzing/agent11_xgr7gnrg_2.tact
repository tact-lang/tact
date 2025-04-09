message MyMessage {
    myValue: Int;
}

contract MyContract {
    receive(msg: MyMessage) {
        let x = msg.myValue;
    }
}
