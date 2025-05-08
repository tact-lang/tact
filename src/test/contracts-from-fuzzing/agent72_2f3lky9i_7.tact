contract Test {
    receive() {
        let c: Cell = beginCell().endCell();
        nativeSendMessage(c, 1);
    }
}
