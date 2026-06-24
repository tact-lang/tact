message MyMsg { someVal: Int as uint8; }

contract TestMessages() {
    fun run() {
         // Create a message of type MyMsg with a value
         let msg: MyMsg = MyMsg{ someVal: 42 };
         
         // Convert the message to a Cell
         let cell: Cell = msg.toCell();
         
         // Reconstruct the message from the Cell
         let msg2: MyMsg = MyMsg.fromCell(cell);
         
         // Dump the values for verification
         dump(msg.someVal);  // Expected output: 42
         dump(msg2.someVal); // Expected output: 42
    }
    
    receive() {
       self.run();
       cashback(sender());
    }
}

// Dummy contract to ensure TestMessages is referenced
contract DummyMsg() {}