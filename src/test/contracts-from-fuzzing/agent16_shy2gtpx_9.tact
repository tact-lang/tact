message(123) MyMsg {
    someVal: Int as uint8;
}

contract TestMessage() {
    fun test() {
        // Instantiate a message with someVal = 42
        let msg: MyMsg = MyMsg{ someVal: 42 };
        // Convert the message to a Cell
        let cell: Cell = msg.toCell();
        // Reconstruct the message from the cell
        let msg2: MyMsg = MyMsg.fromCell(cell);
        dump(msg2.someVal); // expected output: 42
    }

    receive() {
        self.test();
    }
}
