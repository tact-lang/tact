message MyMessage {
    value: Int;
}

contract Sender {
    fun sendMessage(receiver: Address) {
        let msg = MyMessage{value: 123};
        let cell = beginCell().storeInt(msg.value, 32).endCell();
        send(SendParameters{to: receiver, value: 0, mode: 64 + 2, body: cell});
    }
}

contract Receiver {
    receive(in_msg: Slice) {
       let value = in_msg.loadInt(32);
    }
}