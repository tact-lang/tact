contract Test {
    fun process(msg: Slice) {
        let amount = msg.loadInt(64);
    }

    receive() {
        self.process(beginCell().storeInt(100, 64).endCell().asSlice());
    }
}