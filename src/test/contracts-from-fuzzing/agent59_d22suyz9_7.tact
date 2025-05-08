message(101) TestMsg {
    value: Int as uint8;
}

contract TestMessageConversion {
    fun run() {
        // Create an instance of message struct TestMsg
        let msg: TestMsg = TestMsg { value: 42 };
        // Convert the message struct to a Cell
        let cellMsg: Cell = msg.toCell();
        // Parse the cell back into a TestMsg
        let msg2: TestMsg = TestMsg.fromCell(cellMsg);
        // Dump the value, expecting 42
        dump(msg2.value);
    }
    receive() {
        self.run();
        cashback(sender());
    }
}
