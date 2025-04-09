message MyMsg { someVal: Int as uint8; }

contract TestMessageValid() {
    fun run() {
        // Instantiate message struct with someVal = 42
        let msg: MyMsg = MyMsg{ someVal: 42 };
        let cell: Cell = msg.toCell();
        // Reconstruct the message from the cell
        let msg2: MyMsg = MyMsg.fromCell(cell);
        dump(msg2.someVal); // Expected to dump 42
    }
    receive() {
        self.run();
        cashback(sender());
    }
}
