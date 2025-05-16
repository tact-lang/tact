message(42) TestMsg {
    field: Int as uint8;
}

contract TestMessage {
    fun test() {
        // For testing purposes, send a dummy dump
        dump(999);
    }
    // Receiver for TestMsg: it will dump the 'field'
    receive(msg: TestMsg) {
        // Dump the value carried in msg.field
        dump(msg.field); // Expected behavior: dump the 8-bit integer value
    }
    // Fallback receiver: invoke test()
    receive() { self.test(); }
}
