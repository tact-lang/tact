contract Test {
    receive() {
        let addr: Address = myAddress();
        let params: SendParameters = SendParameters { to: addr , value: 0, mode: 0, body: beginCell().storeInt(1, 32).endCell() };
        send(params);
    }
}