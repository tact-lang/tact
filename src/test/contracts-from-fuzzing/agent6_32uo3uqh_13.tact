struct MyMessage {
    value: Int;
}

contract TestContract {
    receive(msg: Slice) {
        let value = msg.loadInt(32);
        let myMessage = MyMessage { value: value };
    }
}