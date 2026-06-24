contract TestContext {
    receive() {
        let senderAddr: Address = sender();
        let ctx = context();
        let ctxSender: Address = ctx.sender;
        let contractCode: Cell = myCode();
    }
}
