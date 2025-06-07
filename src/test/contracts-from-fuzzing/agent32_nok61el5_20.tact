message MyMessage {
    value: Int?;
}

contract TestContract {
    receive(msg: Slice) {
        let myMessage = MyMessage{value: null};
        self.receiveMyMessage(myMessage);
    }

    fun receiveMyMessage(msg: MyMessage) {
        // Do something
    }
}