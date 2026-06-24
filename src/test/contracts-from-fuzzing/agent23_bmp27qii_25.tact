struct Message {
    amount: Int;
}

contract Test {
    fun process(msg: Message) {
        let amount = msg.amount;
    }

    receive() {
        let msg: Message = Message{amount: 100};
        self.process(msg);
    }
}