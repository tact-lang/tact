message MyMessage {
    value1: Int;
    value2: Bool;
}

contract TestContract {
    receive(msg: Slice) {
        let myMessage = MyMessage{value1: 1, value2: true};
        self.receiveMyMessage(myMessage);
    }

    fun receiveMyMessage(msg: MyMessage) {
        // Do something
    }
}