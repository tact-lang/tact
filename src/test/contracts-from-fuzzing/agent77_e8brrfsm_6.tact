message(123) MyMsg {
    someVal: Int as uint8;
}

contract TestMessage() {
    fun test() {
        // Instantiate the message struct
        let msg = MyMsg{ someVal: 42 };
        dump(msg.someVal); // expect output: 42

        // Convert message struct to cell and back
        let cell = msg.toCell();
        let msg2 = MyMsg.fromCell(cell);
        dump(msg2.someVal); // expect output: 42
    }
    
    receive() {
        self.test();
    }
}
