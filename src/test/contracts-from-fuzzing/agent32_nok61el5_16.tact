message MyMessage {
    value: Int;
}

contract TestContract {
    receive(msg: Slice) {
        let myMessage = MyMessage{value: 1};
        self.receiveMyMessage(myMessage);
    }

    fun receiveMyMessage(msg: MyMessage) {
        // Do something
    }
}