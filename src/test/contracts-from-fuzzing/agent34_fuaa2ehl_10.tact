message TestMessage {
    value: Int;
}

contract TestContract {
    fun sendMessage(addr: Address) {
        let params: SendParameters = SendParameters{
            to: addr,
            value: 1000000000,
            mode: 1,
            body: TestMessage{value: 1}.toCell()
        };
        send(params);
    }

    receive() {
        self.sendMessage(myAddress());
    }
}