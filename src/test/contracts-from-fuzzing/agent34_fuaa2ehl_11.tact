message TestMessage {
    value: Int;
}

contract TestContract {
    fun sendMessage(addr: Address) {
        let params: SendParameters = SendParameters{
            to: addr,
            value: 0,
            mode: 1,
            body: null
        };
        send(params);
    }

    receive() {
        self.sendMessage(myAddress());
    }
}