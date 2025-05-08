message MyMessage {
    x: Int;
}

contract FailingContract {
    receive(msg: MyMessage) {
        require(false, "Forced failure");
    }
}

contract SenderContract {
    failAddr: Address;
    res: Int;

    init(failAddr: Address) {
        self.failAddr = failAddr;
        self.res = 0;
    }

    receive(msg: MyMessage) {
        send(SendParameters{
            to: self.failAddr,
            value: ton("1"),
            mode: SendRemainingValue,
            bounce: true,
            body: msg.toCell()
        });
    }

    bounced(rawMsg: Slice) {
        self.res = 1;
    }
}
