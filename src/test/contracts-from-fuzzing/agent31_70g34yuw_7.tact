message MyMessage {
    value: Int;
}

contract TestContract {
    fun processMessage(msg: MyMessage) {
        let x = msg.value;
    }

    receive() {
        let msg = MyMessage{value: 1};
        self.processMessage(msg);
    }
}