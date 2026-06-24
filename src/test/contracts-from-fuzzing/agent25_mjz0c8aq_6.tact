message MyMsg { someVal: Int as uint8; }

contract TestMessage {
    fun test() {
        // Create a message of type MyMsg with a specific value
        let m: MyMsg = MyMsg{ someVal: 99 };
        
        // Convert the message to a Cell and back
        let cell = m.toCell();
        let m2: MyMsg = MyMsg.fromCell(cell);

        // Verify that the message's field is preserved
        dump(m2.someVal == 99);
    }

    receive() {
        self.test();
    }
}
