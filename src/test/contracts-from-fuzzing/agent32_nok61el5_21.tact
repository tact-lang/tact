message MyMessage {
}

contract TestContract {
    receive(msg: Slice) {
        let myMessage = MyMessage{};
        self.receiveMyMessage(myMessage);
    }

    fun receiveMyMessage(msg: MyMessage) {
        // Do something
    }
}