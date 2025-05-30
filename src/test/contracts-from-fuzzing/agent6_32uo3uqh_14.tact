struct MyMessage {
    value1: Int;
    value2: Bool;
}

contract TestContract {
    receive(msg: Slice) {
        let value1 = msg.loadInt(32);
        let value2 = msg.loadBool();
        let myMessage = MyMessage { value1: value1, value2: value2 };
    }
}