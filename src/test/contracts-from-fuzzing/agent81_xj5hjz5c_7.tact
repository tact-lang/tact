message TestMsg { val: Int as uint8; }

contract TestMessage() {
    fun run() {
         // Instantiate message struct
         let msg: TestMsg = TestMsg{ val: 255 };
         dump(msg.val); // Should dump 255
         
         // Convert message to cell and back
         let cellRep: Cell = msg.toCell();
         let msg2: TestMsg = TestMsg.fromCell(cellRep);
         dump(msg2.val); // Should dump 255
    }
    receive() {
         self.run();
    }
}
