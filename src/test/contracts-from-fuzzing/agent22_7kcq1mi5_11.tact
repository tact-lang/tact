message MyMessage {
    value: Int;
}

const PAY_GAS_SEPARATELY: Int = 0;

contract Test {
    receive() {
        let msg = MyMessage{value: 123};
        send(SendParameters{
            to: address("0:0000000000000000000000000000000000000000000000000000000000000000"),
            value: 0,
            mode: PAY_GAS_SEPARATELY,
            body: self.storeMyMessage(msg).endCell()
        });
    }

    fun storeMyMessage(msg: MyMessage): Builder {
        let builder = beginCell();
        builder = builder.storeInt(msg.value, 32);
        return builder;
    }
}