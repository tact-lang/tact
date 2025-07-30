message MyMessage {
    MyMessage: Int;
}

contract MyContract {
    receive(msg: MyMessage) {
        let x = msg.MyMessage;
    }
}
