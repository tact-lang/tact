message MyMessage {
    value: Int;
}

contract Sender {
    fun sendTo(recipient: Address) {
        let msg = MyMessage{value: 1};
        let cell: Cell = beginCell().storeInt(msg.value, 32).endCell();
        let params: SendParameters = SendParameters{
            to: recipient,
            value: 0,
            mode: 1,
            body: cell
        };
        send(params);
    }
}

contract Receiver {
    receive(msg: MyMessage) {
        let x = msg.value;
    }
}
