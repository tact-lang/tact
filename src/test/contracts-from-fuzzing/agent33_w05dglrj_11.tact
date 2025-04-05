message InternalMessage {
    value: Int;
}

contract SenderContract {
    fun sendMessage(receiver: Address) {
        let msg = InternalMessage{value: 123};
        send(SendParameters{
            to: receiver,
            value: 0,
            mode: 64,
            body: beginCell().storeInt(msg.value, 32).endCell()
        });
    }
}

contract ReceiverContract {
    receive(msg: InternalMessage) {
        let value = msg.value;
    }
}
