message TestMessage {
    value: Int;
}

contract TestContract {
    fun sendMessage(addr: Address) {
        let params: SendParameters = SendParameters{
            to: addr,
            value: 0,
            mode: 64,
            body: TestMessage{value: 1}.toCell()
        };
        send(params);
    }

    receive() {
        self.sendMessage(myAddress());
    }
}