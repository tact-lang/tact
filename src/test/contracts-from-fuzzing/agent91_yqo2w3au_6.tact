message(123) MyTestMsg {
    someVal: Int as uint8;
}

contract TestMessage() {
    fun test() {
        // Create an instance of the message struct with a valid value
        let msg: MyTestMsg = MyTestMsg{ someVal: 42 };
        // Convert the message to a cell and back
        let cellMsg: Cell = msg.toCell();
        let msg2: MyTestMsg = MyTestMsg.fromCell(cellMsg);
        // Dump the value; expected output: 42
        dump(msg2.someVal);
    }

    receive() {
        self.test();
    }
}
